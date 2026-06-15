import 'dart:math';
import 'package:flutter/material.dart';

class DotGridBackground extends StatefulWidget {
  final Widget? child;
  final double dotSpacing;
  final double dotRadius;
  final double hoverRadius;
  final Color baseDotColor;
  final Color highlightColor;
  final Color backgroundColor;
  
  const DotGridBackground({
    super.key,
    this.child,
    this.dotSpacing = 28.0,
    this.dotRadius = 2.0,
    this.hoverRadius = 150.0,
    this.baseDotColor = const Color(0xFF383838),
    this.highlightColor = const Color(0xFFE8533A),
    this.backgroundColor = const Color(0xFF0D0D0D),
  });

  @override
  State<DotGridBackground> createState() => _DotGridBackgroundState();
}

class _DotGridBackgroundState extends State<DotGridBackground> {
  // null = cursor outside the widget
  Offset? _cursorLocal;

  void _onHover(Offset localPosition) {
    setState(() => _cursorLocal = localPosition);
  }

  void _onExit() {
    setState(() => _cursorLocal = null);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => _onHover(event.localPosition),
      onExit: (_) => _onExit(),
      child: GestureDetector(
        onPanUpdate: (details) => _onHover(details.localPosition),
        onPanEnd: (_) => _onExit(),
        onPanCancel: _onExit,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomPaint(
              painter: _DotGridPainter(
                cursorPosition: _cursorLocal,
                dotSpacing: widget.dotSpacing,
                dotRadius: widget.dotRadius,
                hoverRadius: widget.hoverRadius,
                baseDotColor: widget.baseDotColor,
                highlightColor: widget.highlightColor,
                backgroundColor: widget.backgroundColor,
              ),
            ),
            if (widget.child != null) widget.child!,
          ],
        ),
      ),
    );
  }
}

class _DotGridPainter extends CustomPainter {
  _DotGridPainter({
    required this.cursorPosition,
    required this.dotSpacing,
    required this.dotRadius,
    required this.hoverRadius,
    required this.baseDotColor,
    required this.highlightColor,
    required this.backgroundColor,
  });

  final Offset? cursorPosition;
  final double dotSpacing;
  final double dotRadius;
  final double hoverRadius;
  final Color baseDotColor;
  final Color highlightColor;
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    // Background
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = backgroundColor,
    );

    final paint = Paint()..isAntiAlias = true;

    final cols = (size.width / dotSpacing).ceil();
    final rows = (size.height / dotSpacing).ceil();

    for (int col = 0; col < cols; col++) {
      for (int row = 0; row < rows; row++) {
        final gridPos = Offset(col * dotSpacing, row * dotSpacing);

        double proximity = 0.0;
        Offset drawPos = gridPos;

        if (cursorPosition != null) {
          final delta = gridPos - cursorPosition!;
          final dist = delta.distance;

          proximity = (1.0 - (dist / hoverRadius)).clamp(0.0, 1.0);
          proximity = proximity * proximity;

          if (dist > 0) {
            final pushStrength = proximity * 7;
            drawPos = gridPos + (delta / dist) * pushStrength;
          }
        }

        final highlightStrength = proximity / 0.6;
        proximity = pow(proximity, 0.5).toDouble();
        final rimPosition = 0.1; // (0=centre, 1=edge)
        final rimWidth = 0.1; // 0-1 - lower is sharper
        final rimStrength = exp(-pow((proximity - rimPosition) / rimWidth, 2)) * 1; // 0-1

        final redColor = Color.lerp(baseDotColor, highlightColor, highlightStrength)!;
        final color = Color.lerp(redColor, Colors.white, rimStrength.clamp(0.0, 1.0))!.withValues(alpha: 0.3 + proximity * 0.7);
                        
        final radius = dotRadius + proximity * 2; // bigger size at centre

        paint.color = color;
        canvas.drawCircle(drawPos, radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DotGridPainter old) {
    return old.cursorPosition != cursorPosition;
  }
}