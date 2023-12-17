// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String name;
  final bool isDone;
  Function(bool?)? onChanged;

  TodoTile(
      {super.key, required this.name, required this.isDone, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Checkbox(value: isDone, onChanged: onChanged),
              Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    decoration: isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: 3,
                    decorationColor: Colors.deepPurple[800]),
              ),
            ],
          ),
        ));
  }
}
