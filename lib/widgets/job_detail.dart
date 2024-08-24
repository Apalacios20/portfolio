import 'package:flutter/material.dart';
import 'package:portfolio/pages/controller.dart';
import 'package:portfolio/widgets/buttons/skill_null_btn.dart';

class JobDetail extends StatelessWidget {
  final MainController controller;
  final String jobLocation;
  final String? jobWebsite;
  final String jobDescription;
  final List<String> skills;
  final String imageName;

  const JobDetail({
    required this.controller,
    required this.jobLocation,
    this.jobWebsite,
    required this.jobDescription,
    required this.skills,
    required this.imageName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on_sharp),
                  const SizedBox(width: 10),
                  Text(
                    jobLocation,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blueGrey[600],
                      // color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(width: 30),
                  if (jobWebsite != null && jobWebsite!.isNotEmpty) ...[
                    const Icon(Icons.blur_on),
                    const SizedBox(width: 10),
                    // AP20 new
                    TextButton(
                      onPressed: () =>
                          controller.goToUrl("https://$jobWebsite"),
                      child: Text(
                        jobWebsite!,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueGrey[600],
                          // color: Colors.grey[500],
                        ),
                      ),
                    )
                  ],
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  jobDescription,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children:
                    skills.map((skill) => Chip(label: Text(skill))).toList(),
              ),

              // AP20 og and good
              // Row(
              //   children:
              //   skills.map((skill) {
              //     return Padding(
              //       padding: const EdgeInsets.only(right: 10.0),
              //       child: SkillNullBtn(text: skill),
              //     );
              //   }).toList(),
              // ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Image.asset("assets/$imageName"),
        ),
      ],
    );
  }
}
