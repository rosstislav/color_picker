import 'dart:math';

import 'package:flutter/material.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({Key? key}) : super(key: key);

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  final _random = Random();
  Color _color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color picker"),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _color = Color.fromRGBO(
              _random.nextInt(256),
              _random.nextInt(256),
              _random.nextInt(256),
              _random.nextDouble(),
            );
          });
        },
        child: Container(
          color: _color,
          padding: const EdgeInsets.all(20),
          child: const Center(
            child: Text('Hey there'),
          ),
        ),
      ),
    );
  }
}
