import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MainController extends GetxController {
  final RxString currentView = ''.obs;
  List<String> iconList = [
    'ripple2',
    'dream_catcher',
    'flower_of_life',
    'dead_tree',
    'flare',
  ];

  void changeView(String view) {
    currentView.value = view;
  }

  Future<void> goToUrl(url) async {
    final Uri newUrl = Uri.parse(url);
    if (!await launchUrl(newUrl)) {
      throw Exception("Could not launch $newUrl");
    }
  }
}
