import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ListViewExample(),
    );
  }
}

class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView Example")),
      body: ListView.builder(
        itemCount: 20, // Display 20 items
        itemBuilder: (context, index) {
          return ListTile(title: Text("Item ${index + 1}"));
        },
      ),
    );
  }
}
