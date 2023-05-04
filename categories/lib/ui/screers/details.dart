import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments["title"]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(arguments["desc"]),
      ),
    );
  }
}
