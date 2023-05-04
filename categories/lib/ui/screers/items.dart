import 'package:categories/data/category.dart';
import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    final category = (ModalRoute.of(context)?.settings.arguments ??
        Category('title', {})) as Category;
    final itemTitles = category.items.keys.toList();
    final itemDescs = category.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: const Color.fromARGB(255, 116, 65, 255),
            title: Text(
              itemTitles[index],
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: {
                'title': itemTitles[index],
                'desc': itemDescs[index]
              });
            },
          );
        },
        itemCount: category.items.length,
      ),
    );
  }
}
