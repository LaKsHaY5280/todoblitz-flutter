// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../components/todotile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


List todos = [
    ['Todo 1', false],
    ['Todo 2', false],
    ['Todo 3', false],
    ['Todo 4', false],
    ['Todo 5', false],
  ];

  void checkBoxChange(bool? value, int index) {
    setState(() {
      todos[index][1] = value!;
    });
  }

  void createNewTask() {
    String newTask = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurpleAccent[400],
          title: const Text('Add a new task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
          content: TextField(
            decoration: const InputDecoration(
                hintText: 'Enter task name',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.white),
                )),
            style: const TextStyle(color: Colors.white, fontSize: 20),
            cursorColor: Colors.white,
            onChanged: (value) {
              newTask = value;
            },
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurpleAccent[100],
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                setState(() {
                  todos.add([newTask, false]);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[400],
      appBar: AppBar(
          title: const Text('TodoBlitz',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent[700],
      ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return TodoTile(
                  name: todos[index][0],
                  isDone: todos[index][1],
                  onChanged: (value) => checkBoxChange(value, index));
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: Colors.deepPurpleAccent[100],
          child: const Icon(Icons.add),
        )
    );
  }
}
