// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[400],
      appBar: AppBar(
        title: const Text('TodoBlitz'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent[700],
      ),
      body: Center(
        child: Text('Hello, world!'),
      ),
    );
  }
}
