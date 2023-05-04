import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  late String imagesPath;
  List<File>? images;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    imagesPath = path.join(appDocDir.path, "images");
    final imagesDir = await Directory(imagesPath).create(recursive: true);
    images = await imagesDir.list().map((file) => File(file.path)).toList();
    setState(() {});
  }

  Future<void> _saveImage(String url) async {
    final response = await http.get(Uri.parse(url));
    final imageName = path.basename(controller.text);
    File image = File(path.join(imagesPath, imageName));
    await image.writeAsBytes(response.bodyBytes);
    setState(() {
      images?.add(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          images == null || images?.isEmpty == true
              ? const Expanded(
                  child: Center(
                    child: Text('No saved images'),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final image = images!.elementAt(index);
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.file(
                            image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                    itemCount: images?.length,
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter image link',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _saveImage(controller.text),
                  child: const Text('Save'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
