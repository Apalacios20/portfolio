import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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

  Future<void> _downloadFile() async {
    try {
      final ByteData bytes = await rootBundle.load('assets/resume_.pdf');
      final Uint8List pdfData = bytes.buffer.asUint8List();

      await FileSaver.instance.saveFile(
        name: "resume",
        bytes: pdfData,
        ext: ".pdf",
      );

      debugPrint("File downloaded successfully");
    } catch (e) {
      debugPrint("Error downloading file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).size.height / 15, 0, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Work History",
                  style: GoogleFonts.titilliumWeb(
                      fontSize: 35, color: Colors.black),
                ),
                const SizedBox(
                  width: 15,
                ),
                IconButton.outlined(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Resume'),
                          content: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 725,
                                    height: 825,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          spreadRadius: 5,
                                          blurRadius: 10,
                                          offset: const Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/resume.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: _downloadFile,
                                    child: const Text('Download Resume'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.assignment_outlined),
                ),
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            JobTile(
              controller: widget.controller,
              positionHeldAtCompany: 'Flutter and NestJS Developer @ Tether RE',
              yearsWorkedAtCo: '2023 - Present',
              jobLocation: 'Twin Falls, Idaho',
              jobWebsite: 'tetherre.com',
              jobDescription:
                  'Developed a real estate mobile application designed to enhance the safety of real estate agents. A major achievement includes integrating the platform with a 24/7 monitoring center that delivers immediate responses when safety features are triggered. I’ve built and maintained all safety features on the frontend and the majority on the backend, taking pride in ensuring accuracy and safeguarding users.',
              skills: const [
                'Flutter',
                'React',
                'JavaScript',
                'NestJS',
                'Postgresql',
                'AWS'
              ],
              imageName: "TetherRE.png",
            ),
            const SizedBox(
              height: 5,
            ),
            JobTile(
              controller: widget.controller,
              positionHeldAtCompany:
                  'Jr. Flutter Developer / Data Analyst @ ThirtyThree',
              yearsWorkedAtCo: '2022 - 2023',
              jobLocation: 'Yorba Linda, California',
              jobWebsite: null,
              jobDescription:
                  'Developed and maintained an application aimed at modernizing the cell tower surveying process, replacing traditional pen-and-paper methods to prioritize efficiency, dependability, and data accuracy.',
              skills: const ['React', 'JavaScript', 'NestJS', 'Postgresql'],
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
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: _isCardSelected
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: ProjectDetail(
                        key: ValueKey('ProjectDetail'),
                        imageUrls: _selectedImageUrl!,
                        title: _selectedTitle!,
                        description: _selectedDescription!,
                        skills: _selectedSkills!,
                        onBack: _deselectCard,
                        controller: widget.controller,
                        gitUrl: _projectGitUrl,
                      ),
                    )
                  : Row(
                      key: ValueKey('ProjectTiles'),
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ProjectTile(
                          // AP20 testing
                          imageUrl: "coin_logo.png",
                          title: "Crypto Exchange UI",
                          description: "Web Development",
                          onTap: () => _selectCard(
                              ["coinx_main.png", "coinx_detail.png"],
                              "Crypto Exchange UI",
                              "I have a keen interest in cryptocurrencies, which led me to develop the user interface of a crypto exchange inspired by Uphold. This project involved leveraging the CoinMarketCap API to provide accurate and real-time data feeds. I built the frontend using Flutter to ensure a responsive and seamless user experience. For the backend, I utilized Go to efficiently process the data feeds and manage the exchange operations.",
                              ["Flutter", "Golang", "API Interaction"],
                              "https://github.com/Apalacios20/crypto-exchange-ui"),
                        ),
                        const SizedBox(
                          width: 25,
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
                                "NestJS",
                                "Solidity",
                                "Flare API Interaction"
                              ],
                              null),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
