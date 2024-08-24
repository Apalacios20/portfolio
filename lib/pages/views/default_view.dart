import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/controller.dart';
import 'package:portfolio/widgets/home_icons.dart';

class DefaultView extends StatelessWidget {
  final MainController controller;
  const DefaultView({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
      child: Column(
        children: [
          Text(
            "Anthony Palacios",
            style: GoogleFonts.expletusSans(
              textStyle: const TextStyle(
                fontSize: 120,
                color: Colors.black,
                shadows: [
                  Shadow(
                    offset: Offset(1.5, 0.5),
                    blurRadius: 1.55,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
            ),
          ),
          Text(
            "Flutter Dev  //  NestJS Dev  //  App Dev",
            style: GoogleFonts.gruppo(
              textStyle: const TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: controller.iconList
                .map((icon) => HomeIcons(imageFileSvg: icon))
                .toList(),
          ),
          const SizedBox(
            height: 100,
          ),
          OutlinedButton(
            onPressed: () => controller.changeView('portfolio'),
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              ),
              minimumSize: MaterialStateProperty.all<Size>(const Size(200, 60)),
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 24),
              ),
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(
                    color: Colors.orangeAccent.withOpacity(0.75), width: 2.0),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            child: Text(
              "Portfolio",
              style: GoogleFonts.titilliumWeb(
                textStyle: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
