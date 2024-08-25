import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:myportfolio/pages/controller.dart';
// import 'package:myportfolio/widgets/hoverable_image.dart';
import 'package:portfolio/pages/controller.dart';
import 'package:portfolio/widgets/hoverable_image.dart';

class ProjectDetail extends StatelessWidget {
  final List<String> imageUrls;
  final String title;
  final String description;
  final List<String> skills;
  final VoidCallback onBack;
  final MainController controller;
  final String? gitUrl;

  const ProjectDetail({
    required this.imageUrls,
    required this.title,
    required this.description,
    required this.skills,
    required this.onBack,
    required this.controller,
    this.gitUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: onBack,
                ),
                const Row(
                  children: [
                    Text(
                      'Web Development',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.titilliumWeb(
                          fontSize: 35, color: Colors.black),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    if (gitUrl != null)
                      IconButton(
                        onPressed: () {
                          // AP20 make this url dynamic
                          controller.goToUrl(gitUrl!);
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.github,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 25.0),
                Text(
                  description,
                  style: const TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                const SizedBox(height: 40.0),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children:
                      skills.map((skill) => Chip(label: Text(skill))).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HoverableImage(
                  imageUrl: imageUrls[0],
                  offset: const Offset(0, 0),
                ),
                const SizedBox(height: 20),
                HoverableImage(
                  imageUrl: imageUrls[1],
                  offset: const Offset(100, 0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
