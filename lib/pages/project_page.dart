import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfiolio_website/models/projects_details.dart';
import 'package:portfiolio_website/models/skillsData.dart';

class ProjectPage extends StatelessWidget {
  final ProjectDetails project;
  const ProjectPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 1100;

    return SizedBox(
      width: width * (isWide ? 0.7 :  0.9),
      height: MediaQuery.of(context).size.height * (isWide ? 0.7 :  0.9),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: isWide ? _wideLayout(width * 0.7) : _narrowLayout(),
      ),
    );
  }

  Widget _wideLayout(double width) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _leftContent()),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            _image(width: width/2),
            const SizedBox(height: 12),
            _linksBox(),
          ],
        ),
      ],
    );
  }

  Widget _narrowLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _image(width: double.infinity),
        const SizedBox(height: 16),
        _leftContent(),
        const SizedBox(height: 16),
        _linksBox(),
      ],
    );
  }

  Widget _leftContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 22,),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            project.title,
            style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: SizedBox(
            width: 300,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(175, 116, 233, 206),
                          Colors.tealAccent,
                          Color(0xFF60A5FA),
                        ],
                        stops: [0.0, 0.5, 1.0],
                      ),
                    ),
                  ),
                ),
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color.fromARGB(175, 116, 233, 206),
                      Colors.tealAccent,
                      Color(0xFF60A5FA),
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ).createShader(bounds),
                  child: Divider(
                    thickness: 2,
                    height: 2.5,
                    radius: BorderRadius.circular(99),
                  ),
                ),
              ],
            ),
          )
        ),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: project.technologies.map((tech) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            margin: const EdgeInsets.only(left: 8, bottom: 8),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 35, 35, 35),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                SvgPicture.asset(
                  'icons/${skillsData.entries.fold([], (all, entry)=>all += entry.value).firstWhere((entry)=>entry['name'] == tech)['icon']}',
                  width: 20,
                  height: 20,
                ),
                Text(
                  tech,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )).toList(),
        ),
        SizedBox(height: 8,),
        Text(
          project.description,
          style: GoogleFonts.inter(
            fontSize: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            'Key Features',
            style: GoogleFonts.inter(
              fontSize: 25,
              fontWeight: FontWeight.w300
            ),
          ),
        ),
      ],
    );
  }

  Widget _image({required double width}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(project.imageUrl, width: width),
    );
  }

  Widget _linksBox() {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF232323),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Links', style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          )),
          const SizedBox(height: 8),
          // your links here
        ],
      ),
    );
  }
}