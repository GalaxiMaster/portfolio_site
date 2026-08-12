import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfiolio_website/pages/contact_page.dart';
import 'package:portfiolio_website/pages/home.dart';
import 'package:portfiolio_website/tools.dart';
import 'package:portfiolio_website/widgets.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return _AppShell(
          currentPath: state.matchedLocation,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomePage(),
          ),
        ),
        GoRoute(
          path: '/contact',
          name: 'contact',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ContactPage(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (context, state) => '/home',
    ),
  ],
);

class _AppShell extends StatelessWidget {
  final String currentPath;
  final Widget child;

  const _AppShell({required this.currentPath, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            child,
            Positioned(
              top: 30,
              left: responsiveLeft(context) - 60,
              child: AnimatedTabBar(currentPath: currentPath),
            ),
          ],
        ),
      ),
    );
  }
}