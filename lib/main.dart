import 'package:flutter/material.dart';
import 'package:portfiolio_website/dot_background.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DotGridBackground(
          highlightColor: Colors.tealAccent,
          hoverRadius: 160,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              height: 100,
              width: 100,
              child: Text('test')
            )
          ),
        ),
      ),
    );
  }
}

