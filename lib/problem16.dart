import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Task 16', home: AnimatedContainerExample());
  }
}

class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Container')),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          width: _isChanged ? 200 : 100,
          height: _isChanged ? 100 : 200,

          decoration: BoxDecoration(
            color: _isChanged ? Colors.orange : Colors.blue,
            borderRadius: BorderRadius.circular(_isChanged ? 0 : 30),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isChanged = !_isChanged;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
