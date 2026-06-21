import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfiolio_website/pages/contact_page.dart';
import 'package:portfiolio_website/pages/home.dart';
import 'package:portfiolio_website/providers/body_provider.dart';
import 'package:portfiolio_website/tools.dart';
import 'package:portfiolio_website/widgets.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final body = ref.watch(appBodyProvider);
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 13, 13, 13),
        colorScheme: const ColorScheme.dark(),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              switch (body) {
                AppBody.home => HomePage(),
                AppBody.contact => ContactPage()
              },
              Positioned(
                top: 30,
                left: responsiveLeft(context) - 60,
                child: AnimatedTabBar()
              ),
            ],
          ),
        )
      ),
    );
  }
}