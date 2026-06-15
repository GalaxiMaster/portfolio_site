import 'package:flutter/material.dart';
import 'package:portfiolio_website/dot_background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfiolio_website/models/projects_details.dart';
import 'package:url_launcher/link.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                            onPressed: () {},
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
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 300),
                child: Column(
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
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          fontSize: 56,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GridView.builder(
                      itemCount: projectsList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 17, 17, 17),
                          border: Border.all(color: Color.fromARGB(255, 35, 35, 35), width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                              child: SizedBox(
                                height: 175,
                                child: Expanded(
                                  child: Image.asset(projectsList[index].imageUrl, height: 100, fit: BoxFit.fill)
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              projectsList[index].title,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                projectsList[index].description,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 146, 146, 146),
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ]
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildContactRow() {
    return Row(
      spacing: 10,
      children: [
        Text(
          '— Find me on:',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            color: Color.fromARGB(255, 146, 146, 146),
          ),
        ),
        Link(
          uri: Uri.parse('https://github.com/GalaxiMaster'),
          target: LinkTarget.blank,
          builder: (BuildContext context, FollowLink? followLink) => IconButton(
            onPressed: followLink,
            icon: SvgPicture.asset(
              'icons/github.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(Color.fromARGB(255, 146, 146, 146), BlendMode.srcIn),
            ),
          ),
        ),
        Link(
          uri: Uri.parse('https://www.linkedin.com/in/dylan-j-3a3637317/'),
          target: LinkTarget.blank,
          builder: (BuildContext context, FollowLink? followLink) => IconButton(
            onPressed: followLink,
            icon: SvgPicture.asset(
              'icons/linkedIn.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(Color.fromARGB(255, 146, 146, 146), BlendMode.srcIn),
            ),
          ),
        ),
        Link(
          uri: Uri(
            scheme: 'mailto',
            path: 'dmj08bot@gmail.com',
          ),
          target: LinkTarget.blank,
          builder: (BuildContext context, FollowLink? followLink) => IconButton(
            onPressed: followLink,
            icon: SvgPicture.asset(
              'icons/email.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(Color.fromARGB(255, 146, 146, 146), BlendMode.srcIn),
            ),
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
            style: TextStyle(
              fontFamily: 'Inter',
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
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w900,
            fontSize: 56,
            color: Colors.white, // base color required
          ),
        ),
      )
    );
  }

}