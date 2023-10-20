import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keyboard_popper/keyboard_popper.dart';

void main() {
  testWidgets('KeyboardPopper dismisses keyboard on tap',
      (WidgetTester tester) async {
    // Build a test widget tree with KeyboardPopper.
    await tester.pumpWidget(
      const MaterialApp(
        home: KeyboardPopper(
          child: Scaffold(
            body: Center(
              child: TextField(),
            ),
          ),
        ),
      ),
    );

    // Tap on the text field to bring up the keyboard.
    await tester.tap(find.byType(TextField));
    await tester.pump();

    // Expect that the keyboard is shown.
    expect(tester.testTextInput.isVisible, isTrue);

    // Tap outside of the text field to dismiss the keyboard.
    await tester.tap(find.byType(Scaffold));
    await tester.pump();

    // Expect that the keyboard is hidden.
    expect(tester.testTextInput.isVisible, isFalse);
  });

  testWidgets('KeyboardPopper does not dismiss keyboard on tap inside button',
      (WidgetTester tester) async {
    // Build a test widget tree with a button inside KeyboardPopper.
    await tester.pumpWidget(
      MaterialApp(
        home: KeyboardPopper(
          child: Scaffold(
            body: Center(
              child: Column(
                children: [
                  const TextField(),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Button'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // Tap on the button inside the KeyboardPopper.
    await tester.tap(find.text('Button'));
    await tester.pump();

    // Expect that the keyboard is still shown.
    expect(tester.testTextInput.isVisible, isTrue);
  });
}
