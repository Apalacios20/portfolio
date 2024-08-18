import 'package:flutter/material.dart';
import 'package:portfolio/widgets/buttons/skill_null_btn.dart';

class JobContent extends StatelessWidget {
  final String jobLocation;
  final String? jobWebsite;
  final String jobDescription;
  final List<String> skills;
  final String imageName;

  const JobContent({
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
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(width: 30),
                  if (jobWebsite != null && jobWebsite!.isNotEmpty) ...[
                    const Icon(Icons.blur_on),
                    const SizedBox(width: 10),
                    Text(
                      jobWebsite!,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  jobDescription,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: skills.map((skill) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SkillNullBtn(text: skill),
                  );
                }).toList(),
              ),
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
