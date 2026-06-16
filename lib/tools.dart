import 'package:flutter/material.dart';

double measureTextHeight(String text, TextStyle style, double maxWidth) {
  final tp = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: null,
    textDirection: TextDirection.ltr,
  )..layout(maxWidth: maxWidth);
  return tp.size.height;
}