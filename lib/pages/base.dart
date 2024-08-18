import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:myportfolio/pages/controller.dart';
// import 'package:myportfolio/pages/views/default_view.dart';
// import 'package:myportfolio/pages/views/projects_skills_view.dart';
// import 'package:myportfolio/widgets/contact_form_dialog.dart';
// import 'package:myportfolio/widgets/contact_form_textfield.dart';
// import 'package:myportfolio/widgets/home_icons.dart';
import 'package:portfolio/pages/controller.dart';
import 'package:portfolio/pages/views/default_view.dart';
import 'package:portfolio/pages/views/projects_skills_view.dart';
import 'package:portfolio/widgets/contact_form_dialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MainController controller = Get.put(MainController());
  // RxString _currentView = 'default'.obs;

  Widget _getView(String view) {
    switch (view) {
      case 'portfolio':
        return ProjectsAndSkillsView(controller: controller);
      default:
        return DefaultView(controller: controller);
    }
  }

  // Widget _getView(String view) {
  //   switch (view) {
  //     case 'default':
  //       return DefaultView();
  //     case 'Projects / Skills':
  //     // return portfolioView();
  //     // case 'Contact':
  //     //   return ContactView();
  //     // case 'Home':
  //     default:
  //       return DefaultView();
  //   }
  // }

  // void _changeView(String view) {
  //   // setState(() {
  //   _currentView.value = view;
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: make the content of the container bottom center due to scrolling issue
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(30, 20, 45, 0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.black,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 10,
              blurRadius: 20,
              offset: Offset(0, -10),
            ),
          ],
        ),
        child: Column(
          children: [
            // Could add other links to different sections of the app
            // May just change the entire set up and stay on 1 screen and change ui
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Icon(Icons.electric_bolt),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "{",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '  Anthony Palacios  ',
                        style: GoogleFonts.expletusSans(
                          textStyle: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      const Text(
                        "}",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: () => controller.changeView(''),
                          child: Text(
                            'Home',
                            style: GoogleFonts.titilliumWeb(
                              textStyle: const TextStyle(
                                fontSize: 21,
                                color: Colors.black,
                              ),
                            ),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'About',
                            style: GoogleFonts.titilliumWeb(
                              textStyle: const TextStyle(
                                fontSize: 21,
                                color: Colors.black,
                              ),
                            ),
                          )),
                      TextButton(
                          onPressed: () => controller.changeView('portfolio'),
                          child: Text(
                            'Portfolio',
                            style: GoogleFonts.titilliumWeb(
                              textStyle: const TextStyle(
                                fontSize: 21,
                                color: Colors.black,
                              ),
                            ),
                          )),
                      TextButton(
                          onPressed: () async =>
                              await Get.dialog(const ContactDialog()),
                          child: Text(
                            'Contact',
                            style: GoogleFonts.titilliumWeb(
                              textStyle: const TextStyle(
                                fontSize: 21,
                                color: Colors.black,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            controller
                                .goToUrl("https://github.com/Apalacios20");
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.github,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.goToUrl(
                                "https://www.linkedin.com/in/anthony-palacios-37054217a/");
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.linkedin,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            // AP20 ABOVE IS THE SEARCH BAR AT TOP
            const SizedBox(
              height: 70,
            ),
            // AP20 TOP OF THE WHITE PAPER
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * .75,
                width: MediaQuery.of(context).size.width * .75,
                padding: const EdgeInsets.fromLTRB(55, 20, 55, 0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFAFAFA),
                      Color(0xFFF8F8F8),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                // AP20 START OF THE CHANGING OF VIEWS IN THE PAPER
                // child: DefaultView(),
                child: Obx(() => _getView(controller.currentView.value)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}









// skills, projects, contact me
// Flutter, React.js, Typescript, Firebase, Postgresql, Python, Jira

// left off:
// get contact form finished at the bottom of the screen
