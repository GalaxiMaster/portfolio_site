import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfiolio_website/providers/body_provider.dart';

class Hoverable extends StatefulWidget {
  final Widget Function(bool hovered) builder;
  const Hoverable({super.key, required this.builder});

  @override
  State<Hoverable> createState() => _HoverableState();
}

class _HoverableState extends State<Hoverable> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: widget.builder(_hovered),
    );
  }
}


class AnimatedTabBar extends ConsumerStatefulWidget {
  const AnimatedTabBar({super.key});

  @override
  ConsumerState<AnimatedTabBar> createState() => _AnimatedTabBarState();
}

class _AnimatedTabBarState extends ConsumerState<AnimatedTabBar>
  with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int _selectedIndex =  ref.watch(appBodyProvider).index;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: AppPage.values.length, vsync: this)
      ..addListener(() {
        setState(() {
          _selectedIndex = _tabController.index;
          context.go(AppPage.values[_selectedIndex].route);
          ref.read(appBodyProvider.notifier).switchTo(AppPage.values[_selectedIndex]);
        });
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double tabWidth = 70;

    return SizedBox(
      width: (tabWidth + 8) * AppPage.values.length,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Row(
                children: List.generate(AppPage.values.length, (i) => Expanded(
                  child: InkWell(
                    onTap: () => _tabController.animateTo(i),
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
                        child: Text(AppPage.values[i].name),
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