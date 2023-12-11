import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static final String id="home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.skip_next,size: 30,)
        ],
        backgroundColor: Colors.blue,
        title: Text("HomePage"),
      ),
      body: Container(
        color: Colors.white
      ),
    );
  }
}
