import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfiolio_website/providers/supportshover.dart';

class Hoverable extends ConsumerStatefulWidget {
  final Widget Function(bool hovered) builder;
  final MouseCursor cursor;

  const Hoverable({
    super.key,
    required this.builder,
    this.cursor = MouseCursor.defer,
  });

  @override
  ConsumerState<Hoverable> createState() => _HoverableState();
}

class _HoverableState extends ConsumerState<Hoverable> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final supportsHover = ref.watch(mouseConnectedProvider);

    if (!supportsHover) return widget.builder(false);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: widget.builder(_hovered),
    );
  }
}

class NavTab {
  final String path;
  final String label;
  const NavTab({required this.path, required this.label});
}

/// Single source of truth for the toolbar's tabs and their URLs.
const List<NavTab> appNavTabs = [
  NavTab(path: '/home', label: 'Home'),
  NavTab(path: '/contact', label: 'Contact'),
];

class AnimatedTabBar extends StatelessWidget {
  /// The current route's path (e.g. state.matchedLocation from GoRouter),
  /// passed in by the shell so the highlighted tab always matches the URL -
  /// however navigation happened (tab tap, a button elsewhere, browser
  /// back/forward, or a direct link).
  final String currentPath;

  const AnimatedTabBar({super.key, required this.currentPath});

  int get _selectedIndex {
    final index = appNavTabs.indexWhere((tab) => tab.path == currentPath);
    return index == -1 ? 0 : index;
  }

  @override
  Widget build(BuildContext context) {
    final double tabWidth = 70;

    return SizedBox(
      width: (tabWidth + 8) * appNavTabs.length,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Row(
                children: List.generate(appNavTabs.length, (i) => Expanded(
                  child: InkWell(
                    onTap: () => context.go(appNavTabs[i].path),
                    mouseCursor: SystemMouseCursors.click,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOutQuad,
                        style: TextStyle(
                          color: _selectedIndex == i ? Colors.white : Colors.white54,
                          fontSize: _selectedIndex == i ? 16.0 : 15.0,
                        ),
                        child: Text(appNavTabs[i].label),
                      ),
                    ),
                  ),
                )),
              ),
      
              AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutQuad,
                left: (tabWidth + 8) * _selectedIndex + 4,
                bottom: 0,
                child: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color.fromARGB(175, 116, 233, 206),
                      Colors.tealAccent,
                      Color(0xFF60A5FA),
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ).createShader(bounds),
                  child: Container(
                    height: 2,
                    width: tabWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}