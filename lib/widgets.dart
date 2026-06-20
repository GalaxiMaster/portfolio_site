import 'package:flutter/material.dart';

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


class AnimatedTabBar extends StatefulWidget {
  final List<String> tabs;
  const AnimatedTabBar({super.key, required this.tabs});

  @override
  State<AnimatedTabBar> createState() => _AnimatedTabBarState();
}

class _AnimatedTabBarState extends State<AnimatedTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this)
      ..addListener(() {
        setState(() => _selectedIndex = _tabController.index);
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
      width: (tabWidth + 8) * widget.tabs.length,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Row(
                children: List.generate(widget.tabs.length, (i) => Expanded(
                  child: InkWell(
                    onTap: () => _tabController.animateTo(i),
                    mouseCursor: SystemMouseCursors.click,
                    child: Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 150),
                        curve: Curves.easeIn,
                        style: TextStyle(
                          color: _selectedIndex == i ? Colors.white : Colors.white54,
                          fontSize: _selectedIndex == i ? 16.0 : 15.0,
                        ),
                        child: Text(widget.tabs[i]),
                      ),
                    ),
                  ),
                )),
              ),
      
              AnimatedPositioned(
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeOutQuad,
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