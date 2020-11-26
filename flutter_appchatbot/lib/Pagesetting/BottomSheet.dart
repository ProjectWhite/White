import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetShape extends ShapeBorder {
  @override
  // implement dimensions
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return getClip(rect.size);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    // implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // implement scale
    throw UnimplementedError();
  }

  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 40);
    path.quadraticBezierTo(size.width/2, 0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }
}
