import 'package:get/get.dart';
import 'package:portfolio/models/Skill.dart';
import 'package:portfolio/models/job_info.dart';
import 'package:portfolio/models/project_info.dart';
import 'package:url_launcher/url_launcher.dart';

class MainController extends GetxController {
  final RxString currentView = ''.obs;

  void changeView(String view) {
    currentView.value = view;
  }

  Future<void> goToUrl(url) async {
    final Uri newUrl = Uri.parse(url);
    if (!await launchUrl(newUrl)) {
      throw Exception("Could not launch $newUrl");
    }
  }

  List<String> iconList = [
    'ripple2',
    'dream_catcher',
    'flower_of_life',
    'dead_tree',
    'flare',
  ];

  List<Skill> skillsIconList = [
    Skill(imagePath: "flutter.png", docLink: "https://flutter.dev/"),
    Skill(imagePath: "react.png", docLink: "https://react.dev/"),
    Skill(
        imagePath: "javaScript.png", docLink: "https://devdocs.io/javascript/"),
    Skill(
        imagePath: "typeScript.png",
        docLink: "https://www.typescriptlang.org/"),
    Skill(imagePath: "nestJS.png", docLink: "https://nestjs.com/"),
    Skill(imagePath: "python.png", docLink: "https://www.python.org/"),
    Skill(imagePath: "solidity.png", docLink: "https://soliditylang.org/"),
    Skill(imagePath: "postgreSQL.png", docLink: "https://www.postgresql.org/"),
    Skill(imagePath: "mySQL.png", docLink: "https://www.mysql.com/"),
    Skill(imagePath: "firebase.png", docLink: "https://firebase.google.com/"),
    Skill(imagePath: "aWS.png", docLink: "https://aws.amazon.com/"),
    Skill(imagePath: "atlassian.png", docLink: "https://www.atlassian.com/"),
  ];

  List<JobInfo> jobList = [
    JobInfo(
      positionHeldAtCompany: 'Flutter Developer | Mobile @ Tether RE',
      yearsWorkedAtCo: '2023 - Present',
      jobLocation: 'Twin Falls, Idaho',
      jobWebsite: 'tetherre.com',
      jobDescription:
          'Developed and maintained a real estate mobile application on both Android and iOS, designed to enhance the safety of real estate agents.  Throughout my tenure at Tether RE, I have earned and taken on the responsibility of managing some of the most complex and mission-critical implementations of our mobile application, particularly the safety features. These include a 24/7 dispatch monitoring service, impact alerts, proximity alerts, and background service capabilities to ensure continuous, around-the-clock protection for users.',
      skills: [
        'Flutter',
        'React',
        'JavaScript',
        'NestJS',
        'Postgresql',
        'AWS',
      ],
      imageName: "TetherRE.png",
    ),
    JobInfo(
      positionHeldAtCompany: 'Flutter Developer / Data Analyst @ ThirtyThree',
      yearsWorkedAtCo: '2022 - 2023',
      jobLocation: 'Yorba Linda, California',
      jobDescription:
          'Developed and maintained an application aimed at modernizing the cell tower surveying process, replacing traditional pen-and-paper methods to prioritize efficiency, dependability, and data accuracy.',
      skills: ['Flutter', 'React', 'JavaScript', 'NestJS', 'Postgresql'],
      imageName: "tangent.png",
    )
  ];

  List<ProjectInfo> projectList = [
    ProjectInfo(
      imageUrl: "coin_logo.png",
      title: "Crypto Exchange UI",
      projectType: "Web Development",
      description:
          "I have a keen interest in cryptocurrencies, which led me to develop the user interface of a crypto exchange inspired by Uphold. This project involved leveraging the CoinMarketCap API to provide accurate and real-time data feeds. I built the frontend using Flutter to ensure a responsive and seamless user experience. For the backend, I utilized Go to efficiently process the data feeds and manage the exchange operations.",
      imageUrls: ["coinx_main.png", "coinx_detail.png"],
      skills: ["Flutter", "Golang", "API Interaction"],
      gitUrl: "https://github.com/Apalacios20/crypto-exchange-ui",
    ),
    ProjectInfo(
      imageUrl: "flare.svg",
      title: "Flare Network API",
      projectType: "Web Development",
      description:
          "The first step of my project is to verify wallet addresses across all chains supported by the Flare Network. This process utilizes the Flare Network API to seamlessly validate and interact with wallet addresses. Following this, the project will incorporate real-time data feeds from all chains on Flare, as well as smart contract integration to enhance functionality and security.",
      imageUrls: ["flare.svg", "ripple2.svg"],
      skills: ["Flutter", "NestJS", "Solidity", "Flare API Interaction"],
    )
  ];
}
