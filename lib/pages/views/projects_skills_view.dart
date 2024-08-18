import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:myportfolio/pages/controller.dart';
// import 'package:myportfolio/widgets/job_tile_widget.dart';
// import 'package:myportfolio/widgets/project_detail.dart';
// import 'package:myportfolio/widgets/project_tile.dart';
import 'package:portfolio/pages/controller.dart';
import 'package:portfolio/widgets/job_tile_widget.dart';
import 'package:portfolio/widgets/project_detail.dart';
import 'package:portfolio/widgets/project_tile.dart';

class ProjectsAndSkillsView extends StatefulWidget {
  final MainController controller;
  const ProjectsAndSkillsView({required this.controller, super.key});

  @override
  State<ProjectsAndSkillsView> createState() => _ProjectsAndSkillsViewState();
}

class _ProjectsAndSkillsViewState extends State<ProjectsAndSkillsView> {
  bool _isCardSelected = false;
  // AP20 list of strings
  List<String>? _selectedImageUrl;
  String? _selectedTitle;
  String? _selectedDescription;
  List<String>? _selectedSkills;
  String? _projectGitUrl;

  List<String> projectOneImages = [];

  void _selectCard(List<String> imageUrl, String title, String description,
      List<String> skills, String? gitUrl) {
    setState(() {
      _isCardSelected = true;
      _selectedImageUrl = imageUrl;
      _selectedTitle = title;
      _selectedDescription = description;
      _selectedSkills = skills;
      _projectGitUrl = gitUrl;
    });
  }

  void _deselectCard() {
    setState(() {
      _isCardSelected = false;
      _selectedImageUrl = null;
      _selectedTitle = null;
      _selectedDescription = null;
      _selectedSkills = null;
      _projectGitUrl = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
        padding: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).size.height / 15, 0, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Work History",
                style:
                    GoogleFonts.titilliumWeb(fontSize: 35, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            const JobTileWidget(
              positionHeldAtCompany: 'Flutter and NestJS Developer @ Tether RE',
              yearsWorkedAtCo: '2023 - Present',
              jobLocation: 'Twin Falls, Idaho',
              jobWebsite: 'tetherre.com',
              jobDescription:
                  'Developing a real estate application designed to enhance the safety of real estate agents. Responsible for complex implementations, including SQS, background services, and integrations, always prioritizing reliability and enhancing user interaction.',
              skills: [
                'Flutter',
                'React',
                'JavaScript',
                'Nest.js',
                'Postgresql',
                'AWS'
              ],
              imageName: "TetherRE.png",
            ),
            const JobTileWidget(
              positionHeldAtCompany:
                  'Jr. Flutter Developer / Data Analyst @ ThirtyThree',
              yearsWorkedAtCo: '2022 - 2023',
              jobLocation: 'Yorba Linda, California',
              jobWebsite: null,
              jobDescription:
                  'Developed and maintained an application aimed at modernizing the cell tower surveying process, replacing traditional pen-and-paper methods to prioritize efficiency, dependability, and data accuracy.',
              skills: ['React', 'JavaScript', 'Nest.js', 'Postgresql'],
              imageName: "tangent.png",
            ),
            const SizedBox(
              height: 45,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Projects",
                style:
                    GoogleFonts.titilliumWeb(fontSize: 35, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            // AP20 tile cards
            // i think this is where im suppose to set state and remove widgets and render other layout
            if (_isCardSelected)
              // AP20 when card selected / make image URL lists
              Align(
                alignment: Alignment.centerLeft,
                child: ProjectDetail(
                  imageUrls: _selectedImageUrl!,
                  title: _selectedTitle!,
                  description: _selectedDescription!,
                  skills: _selectedSkills!,
                  onBack: _deselectCard,
                  controller: widget.controller,
                  gitUrl: _projectGitUrl,
                ),
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // AP20 project cards
                children: [
                  ProjectTile(
                    imageUrl: "coinx_logo.png",
                    title: "Crypto Exchange UI",
                    description: "Web Development",
                    onTap: () => _selectCard(
                        ["coinx_main.png", "coinx_detail.png"],
                        "Crypto Exchange UI",
                        "I have a keen interest in cryptocurrencies, which led me to develop the user interface of a crypto exchange inspired by Uphold. This project involved leveraging the CoinMarketCap API to provide accurate and real-time data feeds. I built the frontend using Flutter to ensure a responsive and seamless user experience. For the backend, I utilized Go to efficiently process the data feeds and manage the exchange operations.",
                        ["Flutter", "golang", "API Interaction"],
                        "https://github.com/Apalacios20"),
                  ),
                  ProjectTile(
                    imageUrl: "flare.svg",
                    title: "Flare Network API",
                    description: "Web Development",
                    onTap: () => _selectCard(
                        ["flare.svg", "ripple2.svg"],
                        "Flare Network API (Coming Soon)",
                        "The first step of my project is to verify wallet addresses across all chains supported by the Flare Network. This process utilizes the Flare Network API to seamlessly validate and interact with wallet addresses. Following this, the project will incorporate real-time data feeds from all chains on Flare, as well as smart contract integration to enhance functionality and security.",
                        [
                          "Flutter",
                          "NestJs",
                          "Solidity",
                          "Flare API Interaction"
                        ],
                        null),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}


// TODO: when hovering over show a bigger picture of the picture hovering over
// class HoverableImage extends StatefulWidget {
//   final String imageUrl;
//   final Offset offset;

//   const HoverableImage({
//     required this.imageUrl,
//     required this.offset,
//     Key? key,
//   }) : super(key: key);

//   @override
//   _HoverableImageState createState() => _HoverableImageState();
// }

// class _HoverableImageState extends State<HoverableImage> {
//   bool _isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovered = true),
//       onExit: (_) => setState(() => _isHovered = false),
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 300),
//         transform:
//             Matrix4.translationValues(widget.offset.dx, widget.offset.dy, 0),
//         decoration: BoxDecoration(
//           boxShadow: _isHovered
//               ? [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 15,
//                     offset: Offset(0, 10),
//                   ),
//                 ]
//               : [],
//         ),
//         child: widget.imageUrl.toLowerCase().endsWith('.svg')
//             ? SvgPicture.asset(
//                 widget.imageUrl,
//                 height: 200,
//                 fit: BoxFit.contain,
//               )
//             : Image.asset(
//                 widget.imageUrl,
//                 height: 200,
//                 fit: BoxFit.contain,
//               ),
//       ),
//     );
//   }
// }
