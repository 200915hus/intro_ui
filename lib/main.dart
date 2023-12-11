import 'package:flutter/material.dart';
import 'package:intro_ui/home_page.dart';
import 'package:intro_ui/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:IntroPage(),
      routes: {
        HomePage.id:(context)=>HomePage(),
        IntroPage.id:(context)=>IntroPage(),
      },
    );
  }
}


