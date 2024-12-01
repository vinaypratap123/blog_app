import 'package:flutter/material.dart';

class MediaQueryProvider extends InheritedWidget {
  final double screenWidth;
  final double screenHeight;

  const MediaQueryProvider({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required super.child,
  });

  static MediaQueryProvider of(BuildContext context) {
    final MediaQueryProvider? result =
        context.dependOnInheritedWidgetOfExactType<MediaQueryProvider>();
    assert(result != null, 'No MediaQueryProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
