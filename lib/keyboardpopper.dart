library keyboardpopper;

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

class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
