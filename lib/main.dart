import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_app_icons/flutter_app_icons.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:portfolio/pages/base.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final flutterAppIconsPlugin = FlutterAppIcons();
  // flutterAppIconsPlugin.setIcon(icon: 'assets/flare.svg');

  await dotenv.load(fileName: ".env");

  LicenseRegistry.addLicense(() async* {
    final license1 = await rootBundle.loadString('assets/fonts/OFL1.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license1);
    final license2 = await rootBundle.loadString('assets/fonts/OFL2.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license2);
    final license3 = await rootBundle.loadString('assets/fonts/OFL3.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license3);
  });

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
