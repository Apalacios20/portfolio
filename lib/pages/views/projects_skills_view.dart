import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/project_info.dart';
import 'package:portfolio/pages/controller.dart';
import 'package:portfolio/widgets/job_tile_widget.dart';
import 'package:portfolio/widgets/project_detail.dart';
import 'package:portfolio/widgets/project_tile.dart';
import 'package:portfolio/widgets/skill_tile.dart';

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

  void _selectCard(ProjectInfo projectInfo) {
    setState(() {
      _isCardSelected = true;
      _selectedImageUrl = projectInfo.imageUrls;
      _selectedTitle = projectInfo.title;
      _selectedDescription = projectInfo.description;
      _selectedSkills = projectInfo.skills;
      _projectGitUrl = projectInfo.gitUrl;
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
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.fromLTRB(0, 60, 0, 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                                      height: 1325,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.25),
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
                                          fit: BoxFit.cover,
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
                            ]);
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
            for (var i = 0; i < widget.controller.jobList.length; i++) ...[
              JobTile(
                controller: widget.controller,
                positionHeldAtCompany:
                    widget.controller.jobList[i].positionHeldAtCompany,
                yearsWorkedAtCo: widget.controller.jobList[i].yearsWorkedAtCo,
                jobLocation: widget.controller.jobList[i].jobLocation,
                jobWebsite: widget.controller.jobList[i].jobWebsite,
                jobDescription: widget.controller.jobList[i].jobDescription,
                skills: widget.controller.jobList[i].skills,
                imageName: widget.controller.jobList[i].imageName,
              ),
              if (i != widget.controller.jobList.length - 1)
                const SizedBox(
                  height: 5,
                ),
            ],
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
                        for (var i = 0;
                            i < widget.controller.projectList.length;
                            i++) ...[
                          ProjectTile(
                            imageUrl: widget.controller.projectList[i].imageUrl,
                            title: widget.controller.projectList[i].title,
                            projectType:
                                widget.controller.projectList[i].projectType,
                            onTap: () => _selectCard(
                              widget.controller.projectList[i],
                            ),
                          ),
                          if (i != widget.controller.projectList.length - 1)
                            const SizedBox(
                              width: 25,
                            ),
                        ],
                      ],
                    ),
            ),
            const SizedBox(
              height: 45,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Skills",
                style:
                    GoogleFonts.titilliumWeb(fontSize: 35, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Wrap(
              spacing: 15.0,
              alignment: WrapAlignment.center,
              children: widget.controller.skillsIconList.map((skill) {
                String skillName = skill.imagePath.replaceAll('.png', '');
                String capitalizedSkill =
                    skillName[0].toUpperCase() + skillName.substring(1);

                return SkillTile(
                  skillName: capitalizedSkill,
                  imagePath: skill.imagePath,
                  docLink: skill.docLink,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
