import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:myportfolio/pages/base.dart';
// import 'package:myportfolio/pages/controller.dart';
import 'package:portfolio/pages/base.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: "Anthony's",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
