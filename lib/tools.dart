import 'dart:ui';

import 'package:flutter/material.dart';

double measureTextHeight(String text, TextStyle style, double maxWidth) {
  final tp = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: null,
    textDirection: TextDirection.ltr,
  )..layout(maxWidth: maxWidth);
  return tp.size.height;
}

double measureTagsHeight(List<String> technologies, double cardWidth) {
  const tagPadding = 8.0 * 2; // horizontal padding per tag
  const tagMargin = 8.0; // left margin per tag
  const tagHeight = 14.0 + 8; // font size + vertical padding
  const spacing = 6.0;
  const runSpacing = 6.0;

  double x = 0;
  double totalHeight = tagHeight;

  for (final tech in technologies) {
    // Approximate text width
    final textWidth = tech.length * 8.4 + tagPadding + tagMargin;
    if (x + textWidth > cardWidth - 16 && x > 0) {
      totalHeight += tagHeight + runSpacing;
      x = 0;
    }
    x += textWidth + spacing;
  }

  return totalHeight + 25; // bottom padding
}

double responsiveLeft(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  const minWidth = 600;
  const maxWidth = 800.0;

  final t = ((width - minWidth) / (maxWidth - minWidth)).clamp(0.0, 1.0);

  final centeredLeft = width / 2;
  final desktopLeft = width / 6 * 4;

  return lerpDouble(centeredLeft, desktopLeft, t)!;
}