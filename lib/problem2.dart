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
      home: const ButtonPressExample(),
    );
  }
}

class ButtonPressExample extends StatefulWidget {
  const ButtonPressExample({super.key});

  @override
  State<ButtonPressExample> createState() => _ButtonPressExampleState();
}

class _ButtonPressExampleState extends State<ButtonPressExample> {
  String displayText = "Press the button";

  void _changeText() {
    setState(() {
      displayText = "Button Pressed";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stateful Widget Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(displayText, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeText,
              child: const Text("Press Me"),
            ),
          ],
        ),
      ),
    );
  }
}
