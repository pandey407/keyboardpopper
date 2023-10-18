# KeyboardPopper Widget

The `KeyboardPopper` is a Flutter widget designed to dismiss the on-screen keyboard when performing specific gestures or interactions outside of input fields, ensuring a smoother and more user-friendly experience.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)

## Installation

To use the `KeyboardPopper` widget in your Flutter project, follow these steps:

1. Add the following dependency to your project's `pubspec.yaml` file:

   ```yaml
   dependencies:
     keyboard_popper:
       git: https://github.com/pandey407/keyboardpopper.git
   ```

2. Run the following command to fetch the package:

   ```unix
   flutter pub get
   ```

   Now, you're ready to use the KeyboardPopper widget in your project.

## Usage

The primary purpose of the `KeyboardPopper` widget is to automatically dismiss the on-screen keyboard when specific gestures or interactions are detected outside of input fields. To use it, wrap your existing widgets with the `KeyboardPopper` widget.

Here's a basic example:

```dart
    import 'package:flutter/material.dart';
    import 'package:keyboard_popper/keyboard_popper.dart';

    void main() {runApp(MyApp());}

    class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        home: KeyboardPopper(
            child: Scaffold(
            appBar: AppBar(
                title: Text('KeyboardPopper Example'),
            ),
            body: Center(
                child: Column(
                children: <Widget>[
                    TextField(
                    decoration: InputDecoration(
                        labelText: 'Tap here to show the keyboard',
                    ),
                    ),
                    ElevatedButton(
                    onPressed: () {},
                    child: Text('Tap me!'),
                    ),
                ],
                ),
            ),
            ),
        ));
    }
}
```
