library keyboardpopper;

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

/// Enumerates the gestures available for triggering the keyboard dismissal
/// with [KeyboardPopper].
///
/// These gestures closely resemble the ones provided by [GestureDetector]
/// in Flutter's widgets library. However, [KeyboardPopper] introduces
/// additional special gesture types, such as [onPanUpdateDownDirection],
/// [onPanUpdateUpDirection], [onPanUpdateLeftDirection], and
/// [onPanUpdateRightDirection]. These special gesture types correspond
/// to [onPanUpdateAnyDirection] from [GestureDetector.onPanUpdate], but they
/// are designed specifically to trigger the dismissal of the keyboard when
/// swiping in the indicated direction (down, up, left, and right).

/// It's important to note that, similar to [GestureDetector], you cannot
/// use pan and scale callbacks simultaneously with [KeyboardPopper]. Also,
/// horizontal and vertical drag callbacks cannot be used simultaneously.

/// For more information on gestures, you can also refer to:
///
///   * [GestureDetector], a widget for detecting various gestures.

/// Enumerates various types of gestures that can occur in an interactive
/// application. These gestures represent user interactions with the screen,
/// such as taps, drags, force presses, pans, scales, and more.

enum GestureType {
  /// A gesture type representing the event when a pointer that might cause
  /// a tap has contacted the screen at a particular location.
  onTapDown,

  /// A gesture type representing the event when a pointer that will trigger
  /// a tap has stopped contacting the screen at a particular location.
  onTapUp,

  /// A gesture type representing the event when a tap has occurred.
  onTap,

  /// A gesture type representing the event when the pointer that previously
  /// triggered an [onTapDown] event will not result in a tap.
  onTapCancel,

  /// A gesture type representing the event when a pointer that might cause
  /// a secondary tap has contacted the screen at a particular location.
  onSecondaryTapDown,

  /// A gesture type representing the event when a pointer that will trigger
  /// a secondary tap has stopped contacting the screen at a particular location.
  onSecondaryTapUp,

  /// A gesture type representing the event when the pointer that previously
  /// triggered [onSecondaryTapDown] will not result in a tap.
  onSecondaryTapCancel,

  /// A gesture type representing the event when a pointer that might cause
  /// a double tap has contacted the screen at a particular location.
  onDoubleTap,

  /// A gesture type representing the event when a long-press gesture has been
  /// recognized.
  onLongPress,

  /// A gesture type representing the start of a long-press gesture.
  onLongPressStart,

  /// A gesture type representing the event when a pointer has been drag-moved
  /// after a long-press.
  onLongPressMoveUpdate,

  /// A gesture type representing the event when a pointer that triggered a
  /// long-press has stopped contacting the screen.
  onLongPressUp,

  /// A gesture type representing the end of a long-press gesture.
  onLongPressEnd,

  /// A gesture type representing the event when a pointer has contacted the
  /// screen and might begin to move vertically.
  onVerticalDragDown,

  /// A gesture type representing the start of a vertical drag.
  onVerticalDragStart,

  /// A gesture type representing the event when a vertically moving pointer
  /// in contact with the screen has updated its position.
  onVerticalDragUpdate,

  /// A gesture type representing the end of a vertically moving pointer's drag.
  onVerticalDragEnd,

  /// A gesture type representing the event when the pointer that previously
  /// triggered [onVerticalDragDown] did not complete.
  onVerticalDragCancel,

  /// A gesture type representing the event when a pointer has contacted the
  /// screen and might begin to move horizontally.
  onHorizontalDragDown,

  /// A gesture type representing the start of a horizontal drag.
  onHorizontalDragStart,

  /// A gesture type representing the event when a horizontally moving pointer
  /// in contact with the screen has updated its position.
  onHorizontalDragUpdate,

  /// A gesture type representing the end of a horizontally moving pointer's drag.
  onHorizontalDragEnd,

  /// A gesture type representing the event when the pointer that previously
  /// triggered [onHorizontalDragDown] did not complete.
  onHorizontalDragCancel,

  /// A gesture type representing the event when a pointer in contact with
  /// the screen has initiated a force press.
  onForcePressStart,

  /// A gesture type representing the event when a pointer in contact with
  /// the screen has reached the maximum force during a force press.
  onForcePressPeak,

  /// A gesture type representing the event when a pointer in contact with
  /// the screen is either moving or applying variable force.
  onForcePressUpdate,

  /// A gesture type representing the end of a force press.
  onForcePressEnd,

  /// A gesture type representing the event when a pointer has contacted the
  /// screen and might begin to move (pan).
  onPanDown,

  /// A gesture type representing the start of a pan gesture.
  onPanStart,

  /// A gesture type representing the event when a pointer, in contact with
  /// the screen and moving, has updated its position.
  onPanUpdateAnyDirection,

  /// A gesture type representing the event when a pointer is moving vertically
  /// downward.
  onPanUpdateDownDirection,

  /// A gesture type representing the event when a pointer is moving vertically
  /// upward.
  onPanUpdateUpDirection,

  /// A gesture type representing the event when a pointer is moving horizontally
  /// to the left.
  onPanUpdateLeftDirection,

  /// A gesture type representing the event when a pointer is moving horizontally
  /// to the right.
  onPanUpdateRightDirection,

  /// A gesture type representing the end of a pan gesture.
  onPanEnd,

  /// A gesture type representing the event when the pointer that previously
  /// triggered [onPanDown] did not complete.
  onPanCancel,

  /// A gesture type representing the event when pointers in contact with
  /// the screen have established a focal point.
  onScaleStart,

  /// A gesture type representing the event when pointers in contact with
  /// the screen have indicated a new focal point and/or scale.
  onScaleUpdate,

  /// A gesture type representing the end of a scaling gesture.
  onScaleEnd,
}

/// A widget designed to dismiss the on-screen keyboard when a gesture is
/// performed. It's commonly used to ensure the keyboard is hidden when tapping
/// outside of active input elements.
///
/// [KeyboardPopper] can be wrapped around any widget, and it will trigger
/// keyboard dismissal when a gesture is performed within the area of the screen
/// not occupied by other widgets that might handle the gesture. For example,
/// if [KeyboardPopper] is configured to dismiss the keyboard on a [GestureType.onTap],
/// it will dismiss the keyboard when tapped outside of regions occupied by
/// widgets like buttons, which can consume the tap event and prevent dismissal.
///
/// A typical use case for [KeyboardPopper] involves wrapping an entire page,
/// including its [Scaffold], to ensure the keyboard is dismissed when tapping
/// on any inactive area of the screen. For instance:
///
/// ```dart
/// class ExamplePage extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) => KeyboardPopper(
///     child: Scaffold(
///       appBar: AppBar(
///         title: Text('KeyboardPopper example'),
///       ),
///       body: Column(
///         children: <Widget>[
///           Padding(
///             padding: const EdgeInsets.all(42.0),
///             child: TextField(
///               decoration: InputDecoration(
///                 border: OutlineInputBorder(),
///                 labelText: 'Tap to show the keyboard',
///                 hintText: 'Tap elsewhere to dismiss',
///               ),
///             ),
///           ),
///           Center(
///             child: RaisedButton(
///               onPressed: () => print('Keyboard persists'),
///               child: Text('Tap me!'),
///             ),
///           ),
///         ],
///       ),
///     ),
///   );
/// }
/// ```
///
/// Wrapping a [MaterialApp], [WidgetsApp], or [CupertinoApp] with a [KeyboardPopper]
/// provides the desired behavior to the entire app since each [Scaffold] is
/// considered a child of the corresponding app widget.
class KeyboardPopper extends StatelessWidget {
  /// Creates a widget to dismiss the keyboard with specific gestures.
  ///
  /// The [gestures] property defines the gestures that trigger keyboard
  /// dismissal. By default, tapping anywhere on the widget dismisses the
  /// keyboard.
  const KeyboardPopper({
    Key? key,
    this.child,
    this.behavior,
    this.gestures = const [GestureType.onTap],
    this.dragStartBehavior = DragStartBehavior.start,
    this.excludeFromSemantics = false,
  }) : super(key: key);

  /// The child widget contained within this KeyboardPopper.
  final Widget? child;

  /// Determines when a drag gesture formally begins when the user initiates it.
  final DragStartBehavior dragStartBehavior;

  /// Controls the behavior of the GestureDetector for hit testing.
  final HitTestBehavior? behavior;

  /// Excludes this widget's gestures from the semantics tree if set to true.
  final bool excludeFromSemantics;

  /// Defines the gestures that trigger keyboard dismissal.
  final List<GestureType> gestures;

  @override
  Widget build(BuildContext context) {
    // Create a GestureDetector with various gesture handlers.
    final gestureDetector = GestureDetector(
      excludeFromSemantics: excludeFromSemantics,
      dragStartBehavior: dragStartBehavior,
      behavior: behavior,
      onTap:
          gestures.contains(GestureType.onTap) ? () => _unfocus(context) : null,
      onTapDown: gestures.contains(GestureType.onTapDown)
          ? (_) => _unfocus(context)
          : null,
      onPanUpdate: gestures.contains(GestureType.onPanUpdateAnyDirection)
          ? (_) => _unfocus(context)
          : null,
      onTapUp: gestures.contains(GestureType.onTapUp)
          ? (_) => _unfocus(context)
          : null,
      onTapCancel: gestures.contains(GestureType.onTapCancel)
          ? () => _unfocus(context)
          : null,
      onSecondaryTapDown: gestures.contains(GestureType.onSecondaryTapDown)
          ? (_) => _unfocus(context)
          : null,
      onSecondaryTapUp: gestures.contains(GestureType.onSecondaryTapUp)
          ? (_) => _unfocus(context)
          : null,
      onSecondaryTapCancel: gestures.contains(GestureType.onSecondaryTapCancel)
          ? () => _unfocus(context)
          : null,
      onDoubleTap: gestures.contains(GestureType.onDoubleTap)
          ? () => _unfocus(context)
          : null,
      onLongPress: gestures.contains(GestureType.onLongPress)
          ? () => _unfocus(context)
          : null,
      onLongPressStart: gestures.contains(GestureType.onLongPressStart)
          ? (_) => _unfocus(context)
          : null,
      onLongPressMoveUpdate:
          gestures.contains(GestureType.onLongPressMoveUpdate)
              ? (_) => _unfocus(context)
              : null,
      onLongPressUp: gestures.contains(GestureType.onLongPressUp)
          ? () => _unfocus(context)
          : null,
      onLongPressEnd: gestures.contains(GestureType.onLongPressEnd)
          ? (_) => _unfocus(context)
          : null,
      onVerticalDragDown: gestures.contains(GestureType.onVerticalDragDown)
          ? (_) => _unfocus(context)
          : null,
      onVerticalDragStart: gestures.contains(GestureType.onVerticalDragStart)
          ? (_) => _unfocus(context)
          : null,
      onVerticalDragUpdate: _gesturesContainsDirectionalPanUpdate
          ? (details) => _unfocusWithDetails(context, details)
          : null,
      onVerticalDragEnd: gestures.contains(GestureType.onVerticalDragEnd)
          ? (_) => _unfocus(context)
          : null,
      onVerticalDragCancel: gestures.contains(GestureType.onVerticalDragCancel)
          ? () => _unfocus(context)
          : null,
      onHorizontalDragDown: gestures.contains(GestureType.onHorizontalDragDown)
          ? (_) => _unfocus(context)
          : null,
      onHorizontalDragStart:
          gestures.contains(GestureType.onHorizontalDragStart)
              ? (_) => _unfocus(context)
              : null,
      onHorizontalDragUpdate: _gesturesContainsDirectionalPanUpdate
          ? (details) => _unfocusWithDetails(context, details)
          : null,
      onHorizontalDragEnd: gestures.contains(GestureType.onHorizontalDragEnd)
          ? (_) => _unfocus(context)
          : null,
      onHorizontalDragCancel:
          gestures.contains(GestureType.onHorizontalDragCancel)
              ? () => _unfocus(context)
              : null,
      onForcePressStart: gestures.contains(GestureType.onForcePressStart)
          ? (_) => _unfocus(context)
          : null,
      onForcePressPeak: gestures.contains(GestureType.onForcePressPeak)
          ? (_) => _unfocus(context)
          : null,
      onForcePressUpdate: gestures.contains(GestureType.onForcePressUpdate)
          ? (_) => _unfocus(context)
          : null,
      onForcePressEnd: gestures.contains(GestureType.onForcePressEnd)
          ? (_) => _unfocus(context)
          : null,
      onPanDown: gestures.contains(GestureType.onPanDown)
          ? (_) => _unfocus(context)
          : null,
      onPanStart: gestures.contains(GestureType.onPanStart)
          ? (_) => _unfocus(context)
          : null,
      onPanEnd: gestures.contains(GestureType.onPanEnd)
          ? (_) => _unfocus(context)
          : null,
      onPanCancel: gestures.contains(GestureType.onPanCancel)
          ? () => _unfocus(context)
          : null,
      onScaleStart: gestures.contains(GestureType.onScaleStart)
          ? (_) => _unfocus(context)
          : null,
      onScaleUpdate: gestures.contains(GestureType.onScaleUpdate)
          ? (_) => _unfocus(context)
          : null,
      onScaleEnd: gestures.contains(GestureType.onScaleEnd)
          ? (_) => _unfocus(context)
          : null,
      child: child,
    );

    return gestureDetector;
  }

  // Function to unfocus the primary focus, i.e., dismiss the keyboard.
  void _unfocus(BuildContext context) =>
      WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();

  // Function to unfocus with additional details (e.g., pan direction).
  void _unfocusWithDetails(
    BuildContext context,
    DragUpdateDetails details,
  ) {
    final dy = details.delta.dy;
    final dx = details.delta.dx;
    final isDragMainlyHorizontal = dx.abs() - dy.abs() > 0;
    if (gestures.contains(GestureType.onPanUpdateDownDirection) &&
        dy > 0 &&
        !isDragMainlyHorizontal) {
      _unfocus(context);
    } else if (gestures.contains(GestureType.onPanUpdateUpDirection) &&
        dy < 0 &&
        !isDragMainlyHorizontal) {
      _unfocus(context);
    } else if (gestures.contains(GestureType.onPanUpdateRightDirection) &&
        dx > 0 &&
        isDragMainlyHorizontal) {
      _unfocus(context);
    } else if (gestures.contains(GestureType.onPanUpdateLeftDirection) &&
        dx < 0 &&
        isDragMainlyHorizontal) {
      _unfocus(context);
    }
  }

  bool get _gesturesContainsDirectionalPanUpdate =>
      gestures.contains(GestureType.onPanUpdateDownDirection) ||
      gestures.contains(GestureType.onPanUpdateUpDirection) ||
      gestures.contains(GestureType.onPanUpdateRightDirection) ||
      gestures.contains(GestureType.onPanUpdateLeftDirection);
}
