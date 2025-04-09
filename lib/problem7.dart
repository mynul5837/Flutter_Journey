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
      home: const ImageExample(),
    );
  }
}

class ImageExample extends StatelessWidget {
  const ImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image Display Example")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Local Asset Image"),
            const SizedBox(height: 10),
            Image.asset('assets/images/flutter_logo.png', width: 150),
            const SizedBox(height: 30),
            const Text("Network Image"),
            const SizedBox(height: 10),
            Image.network(
              'https://flutter.dev/assets/homepage/carousel/slide_1-layer_0-6e1f17b63c648a384d27c3bca5f1ce4ba0c173267ea6e833e6e65790d2b4a308.png',
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
