import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

class PublicFunctions {}

Future urlLuncher(String url) async {
  var uri = Uri.parse(url);
  if (!await canLaunchUrl(uri)) {
    launchUrl(uri);
  } else {
    log("url is not found this time ; => $uri");
  }
}
