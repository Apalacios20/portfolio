import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MainController extends GetxController {
  final RxString currentView = ''.obs;
  // final List images = ['firebase.png','flutter.png','jira.jpeg','nest.png','postgresql.png','python.png','react.png'];

  void changeView(String view) {
    currentView.value = view;
  }

  Future<void> goToUrl(url) async {
    final Uri newUrl = Uri.parse(url);
    if (await launchUrl(newUrl)) {
      throw Exception("Could not launch $newUrl");
    }
  }
}
