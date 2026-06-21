import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfiolio_website/pages/contact_page.dart';
import 'package:portfiolio_website/pages/home.dart';
import 'package:portfiolio_website/tools.dart';
import 'package:portfiolio_website/widgets.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(path: '/', builder: (context, state) => const HomePage()),
          GoRoute(path: '/contact', builder: (context, state) => const ContactPage()),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 13, 13, 13),
        colorScheme: const ColorScheme.dark(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppShell extends StatefulWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late final Widget _tabBar;

  @override
  void initState() {
    super.initState();
    _tabBar = const AnimatedTabBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            widget.child,
            Positioned(
              top: 30,
              left: responsiveLeft(context) - 60,
              child: _tabBar, // same instance every build
            ),
          ],
        ),
      ),
    );
  }
}