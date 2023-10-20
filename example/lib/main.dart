import 'package:flutter/material.dart';
import 'package:keyboard_popper/keyboard_popper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: KeyboardPopper(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('KeyboardPopper Example'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Tap here to show the keyboard',
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Tap me!'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
