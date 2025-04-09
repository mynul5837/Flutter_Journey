import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Lab Task 14', home: SwipeListScreen());
  }
}

class SwipeListScreen extends StatefulWidget {
  @override
  _SwipeListScreenState createState() => _SwipeListScreenState();
}

class _SwipeListScreenState extends State<SwipeListScreen> {
  List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Swap to Edit/Delete')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Dismissible(
            key: Key(item),
            background: Container(
              color: Colors.blue,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),

              child: Icon(Icons.edit, color: Colors.white, size: 30),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Icon(Icons.delete, color: Colors.white, size: 30),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                setState(() {
                  items.removeAt(index);
                });

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('$item deleted')));
              } else if (direction == DismissDirection.startToEnd) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Edit $item')));
              }
            },
            child: Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                title: Text(item),
                //leading: Icon(Icons.list),
              ),
            ),
          );
        },
      ),
    );
  }
}
