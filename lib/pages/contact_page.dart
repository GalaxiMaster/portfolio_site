import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:portfiolio_website/widgets.dart';
import 'package:web/web.dart' as web;

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messagingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Row(
            spacing: 50,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 750,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 26, 26, 26),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color.fromARGB(255, 36, 36, 36))
                ),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Contact Me',
                        style: GoogleFonts.inter(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5
                        ),
                      ),
                      Row(
                        spacing: 50,
                        children: [
                          Expanded(
                            child: detailEditingBox(
                              name: 'Name', 
                              hint: 'Jane Doe',
                              icon: Icons.person_outline,
                              controller: nameController,
                              validator: (input) {
                                if (input == null || input.isEmpty) {
                                  return 'Name is required';
                                }
                                else if (input.length > 32) {
                                  return 'Name can\'t be more than 32 characters';
                                }
                                return null;
                              }
                            ),
                          ),
                          Expanded(
                            child: detailEditingBox(
                              name: 'Email', 
                              hint: 'name@email.com', 
                              icon: Icons.alternate_email,
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) return 'Email is required';
                                if (!RegExp(r'^[\w.-]+@[\w.-]+\.\w+$').hasMatch(value)) return 'Invalid email';
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      detailEditingBox(
                        name: 'Message', 
                        hint: 'Type your message here', 
                        icon: Icons.message_outlined,
                        controller: messagingController, 
                        maxLines: 10,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Message is required';
                          return null;
                        }
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            submitForm(
                              nameController.text,
                              emailController.text,
                              messagingController.text
                            );
                            _formKey.currentState?.reset();
                          }
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                child: Row(
                                  spacing: 7.5,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Send Message'),
                                    Icon(Icons.send_rounded, size: 18,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 26, 26, 26),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color.fromARGB(255, 36, 36, 36))
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 8,),
                    socialBox(
                      name: 'GitHub',
                      icon: 'github.svg',
                      link: 'https://github.com/galaximaster'
                    ),
                    socialBox(
                      name: 'Email',
                      icon: 'email.svg',
                      link: 'mailto:dmj08bot@gmail.com',
                      linkFront: 'dmj08bot@gmail.com'
                    ),
                    socialBox(
                      name: 'LinkedIn',
                      icon: 'linkedIn.svg',
                      link: 'https://www.linkedin.com/in/dylan-j-3a3637317',
                      linkFront: 'https://www.linkedin.com/in/dylan-j'
                    ),
                    socialBox(
                      name: 'Based In',
                      icon: 'location.svg',
                      link: 'Sydney, Aus',
                      enabled: false
                    ),
                    SizedBox(height: 8,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> submitForm(String name, String email, String message) async {
    final response = await http.post(
      Uri.parse('https://portfolio-email.dmj08bot.workers.dev'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'message': message,
      }),
    );
    return response.statusCode == 200;
  }

  Padding socialBox({
    required String name,
    required String link,
    String? linkFront, // to allow link and the link text to be different
    required String icon,
    bool enabled = true
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        spacing: 15,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 20, 20, 20,),
              borderRadius: BorderRadius.circular(10)
            ),
            padding: EdgeInsets.all(12),
            child: SvgPicture.asset(
              'icons/$icon',
              colorFilter: ColorFilter.mode(Color.fromARGB(255, 146, 146, 146), BlendMode.srcIn),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 16
                ),
              ),
              SelectionArea(
                child: GestureDetector(
                  onTap: enabled ? () => web.window.open(link) : null,
                  child: Hoverable(
                    builder: (isHovered) {
                      return AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeOutQuad,
                        style: TextStyle(
                          color: isHovered ? Colors.white60 : Colors.white54,
                          decoration: isHovered ? TextDecoration.underline : null
                        ),
                        child: Text(linkFront ?? link),
                      );
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget detailEditingBox({
    required String name,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    String? Function(String?)? validator,
    int? maxLines
  }) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 10,
          children: [
            Icon(
              icon,
              size: 18,
            ),
            Text(name),
          ],
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            hintStyle: TextStyle(
              color: Colors.white38,
              letterSpacing: 2,
              fontSize: 15
            ),
            filled: true,
            fillColor: Color.fromARGB(255, 20, 20, 20),
            hoverColor: Color.fromARGB(255, 20, 20, 20),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 49, 55, 63)),
              borderRadius: BorderRadius.circular(15)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.tealAccent),
              borderRadius: BorderRadius.circular(15)
            ),
          ), 
          maxLines: maxLines,
          validator: validator,
        ),
      ],
    );
  }
}