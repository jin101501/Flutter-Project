import 'dart:core';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher{

  void launchURl(url) async {
    if (await launch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch &url';
    }
  }
}