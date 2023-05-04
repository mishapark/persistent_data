import 'package:categories/data/category.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Box<Category>? _box;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CategoryAdapter());

    Hive.openBox<Category>('listItems').then((values) {
      setState(() {
        _box = values;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: _box == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ValueListenableBuilder(
                  valueListenable: _box!.listenable(),
                  builder: (context, Box<Category> box, child) {
                    return ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (_, index) {
                        final category = box.values.elementAt(index);
                        return ListTile(
                          tileColor: Colors.blue,
                          title: Text(
                            category.title,
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/items',
                              arguments: category,
                            );
                          },
                        );
                      },
                      itemCount: box.length,
                    );
                  },
                )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _box?.add(
            Category('Music', {
              'Rock': 'Details about rock',
              'Hip Hop': 'Details about hip hop',
              'Classic': 'Details about classic',
            }),
          );
        },
      ),
    );
  }
}
