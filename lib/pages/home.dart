import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfiolio_website/dot_background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfiolio_website/models/skillsData.dart';
import 'package:portfiolio_website/models/projects_details.dart';
import 'package:portfiolio_website/pages/project_page.dart';
import 'package:portfiolio_website/tools.dart';
import 'package:web/web.dart' as web;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _projectsKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: DotGridBackground(
            highlightColor: Colors.tealAccent,
            hoverRadius: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNameText(),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        actionTextButton(
                          onPressed: () {
                            _scrollToSection(_projectsKey);
                          },
                          text: 'View My Work',
                          icon: Icons.arrow_forward,
                        ),
                        actionTextButton(
                          onPressed: () {},
                          text: 'Contact Me',
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    _buildContactRow(),
                  ],
                ),
                SizedBox(width: 500),
              ],
            ),
          ),
        ),
        SizedBox(height: 30),
        SizedBox(
          key: _projectsKey,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => LinearGradient(
                  colors: const [
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Color.fromARGB(255, 116, 233, 206),
                    Colors.tealAccent,
                    Color(0xFF60A5FA),
                  ],
                  stops: const [0.0, 0.1, 0.4, 0.6, 0.7, 1.0],
                ).createShader(bounds),
                child: Text(
                  'Projects',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w900,
                    fontSize: 56,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 1500),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final int columns = (constraints.maxWidth / 400).floor().clamp(1, 3);
                      final double cardWidth = (constraints.maxWidth - columns * 10) / columns;
                      final imageHeight = cardWidth * 9 / 16;
                      final double? cardHeight = columns > 1 
                        ? projectsList.map(
                          (p) => measureTextHeight(
                            p.description, 
                            GoogleFonts.inter(fontSize: 14), 
                            cardWidth - 16
                          ) + 70 + measureTagsHeight(p.technologies, cardWidth - 16)
                        ).reduce(max) + imageHeight
                        : null;
                      return Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: projectsList.map((project) {
                          return SizedBox(
                            width: cardWidth,
                            height: cardHeight,
                            child: ProjectTile(
                              project: project,
                              fixedHeight: cardHeight != null,
                            ),
                          );
                        }).toList(),
                      );
                    },
                  )
                ),
              ),
            ],
          ),
        ),
        SkillsSection(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Dylan J - 2026'),
        )
      ],
    );
  }

  Row _buildContactRow() {
    return Row(
      spacing: 10,
      children: [
        Text(
          '— Find me on:',
          style: GoogleFonts.inter(
            fontSize: 16,
            color: Color.fromARGB(255, 146, 146, 146),
          ),
        ),
        IconButton(
          onPressed: (){
            web.window.open('https://github.com/GalaxiMaster/', '_blank');
          },          
          icon: SvgPicture.asset(
            'icons/github.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(Color.fromARGB(255, 146, 146, 146), BlendMode.srcIn),
          ),
        ),
        IconButton(
          onPressed: (){
            web.window.open('https://www.linkedin.com/in/dylan-j-3a3637317/', '_blank');
          },
          icon: SvgPicture.asset(
            'icons/linkedIn.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(Color.fromARGB(255, 146, 146, 146), BlendMode.srcIn),
          ),
        ),
        IconButton(
          onPressed: (){
            web.window.open('https://mailto:dmj08bot@gmail.com', '_blank');
          },          
          icon: SvgPicture.asset(
            'icons/email.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(Color.fromARGB(255, 146, 146, 146), BlendMode.srcIn),
          ),
        ),
      ],
    );
  }

  Widget actionTextButton({
    required Function() onPressed,
    required String text,
    IconData? icon,
    Color fillColor = const Color.fromARGB(148, 27, 27, 27),
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: fillColor,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        side: BorderSide(
          color: Color.fromARGB(255, 96, 173, 247),
          width: 1,
        ),
      ),
      child: Row(
        spacing: 10,
        children: [
          Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 18,
              color: Colors.white, // base color required
            ),
          ),
          if (icon != null) Icon(icon, color: Colors.white)
        ],
      ),
      
    );
  }

  Widget _buildNameText() {
    return Center(
      child: ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => SweepGradient(
            colors: const [
              Colors.tealAccent,
              Color(0xFF60A5FA),
              Colors.white,
              Colors.white,
              Color(0xFF60A5FA),
              Colors.tealAccent,
            ],
            stops: const [0.0, 0.1, 0.6, 0.8, 0.95, 1.0],
        ).createShader(bounds),
        child: Text(
          'Hi, I\'m \nDylan',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w900,
            fontSize: 56,
            color: Colors.white, // base color required
          ),
        ),
      )
    );
  }

}

class ProjectTile extends StatelessWidget {
  final ProjectDetails project;
  final bool fixedHeight;
  ProjectTile({
    super.key,
    required this.project,
    required this.fixedHeight,
  });
  final ValueNotifier<bool> _isHovered = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isHovered,
      builder: (context, isHovered, child) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                backgroundColor: Color.fromARGB(255, 13, 13, 13),
                child: ProjectPage(project: project,)
              ),
            );
          },
          child: MouseRegion(
            onHover: (event) => _isHovered.value = true,
            onExit: (event) => _isHovered.value = false,
            cursor: SystemMouseCursors.click,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 17, 17, 17),
                    border: Border.all(color: Color.fromARGB(255, 35, 35, 35), width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                            child: Image.asset(
                              project.imageUrl,
                              width: double.infinity,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Row(
                              spacing: 6,
                              children: project.publishedLocations.where((el) => el.display).map((location) {
                                final color = switch(location.name.toLowerCase()) {
                                  'web' => Color.fromARGB(255, 158, 110, 205),
                                  'desktop' => Color.fromARGB(255, 96, 173, 247),
                                  'android' => Color.fromARGB(255, 67, 190, 111),
                                  'ios' => Color.fromARGB(255, 168, 174, 246),
                                  _ => Color.fromARGB(255, 35, 35, 35),
                                };
                                return Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(200, 6, 5, 5),
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(color: color, width: 1),
                                  ),
                                  child: Text(
                                    location.name,
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: color,
                                    ),
                                  ),
                                );
                              }).toList()
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          project.title,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          project.description,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Color.fromARGB(255, 146, 146, 146),
                          ),
                        ),
                      ),
                      if (fixedHeight) Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: project.technologies.map((tech) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            margin: const EdgeInsets.only(left: 8, bottom: 8),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 35, 35, 35),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              tech,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Color.fromARGB(255, 161, 161, 161),
                              ),
                            ),
                          )).toList(),
                        ),
                      )
                    ],
                  ),
                ),
                if (isHovered)
                Positioned.fill(
                  child: Material(
                    color: Color.fromARGB(150, 13, 13, 13),
                    child: Align(
                      alignment: Alignment(0, -0.25),
                      child: Icon(Icons.remove_red_eye_sharp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white,
                    Color.fromARGB(255, 116, 233, 206),
                    Colors.tealAccent,
                    Color(0xFF60A5FA),
                  ],
                  stops: [0.0, 0.2, 0.5, 0.7, 1.0],
                ).createShader(bounds),
                child: Text(
                  'Skills',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w900,
                    fontSize: 56,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ...skillsData.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: CrossAxisAlignment.start == CrossAxisAlignment.start 
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.key,
                        style:  GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color.fromARGB(255, 146, 146, 146),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: entry.value.map((skill) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 17, 17, 17),
                              border: Border.all(
                                color: const Color.fromARGB(255, 35, 35, 35),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              spacing: 10,
                              children: [
                                SvgPicture.asset(
                                  'icons/${skill['icon']}',
                                  width: 24,
                                  height: 24,
                                ),
                                Text(
                                  skill['name'] as String,
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
              );
            }),
          ],
        ),
      ),
    );
  }
}