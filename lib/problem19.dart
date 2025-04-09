import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Side Drawer',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  bool _isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
      _isDrawerOpen ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildDrawer() {
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        width: 250,
        color: Colors.blueGrey,
        child: Column(
          children: [
            SizedBox(height: 50),
            ListTile(
              title: Text("Home", style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              title: Text("Profile", style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: _toggleDrawer,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text('Custom Drawer Demo'),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: _toggleDrawer,
            ),
          ),
          body: Center(child: Text('Main Content')),
        ),
        if (_isDrawerOpen)
          GestureDetector(
            onTap: _toggleDrawer,
            child: Container(color: Colors.black54),
          ),
        IgnorePointer(ignoring: !_isDrawerOpen, child: buildDrawer()),
      ],
    );
  }
}
