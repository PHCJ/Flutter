import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List dummyList = List.generate(1000, (index) {
    return {
      "id": index,
      "title": "Isso é um titulo $index",
      "subtitle": "Isso é um subtitle $index"
    };
  });

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(Object context) {
    throw UnimplementedError();
  }
}
