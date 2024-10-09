import 'package:url_launcher/url_launcher.dart';

class PublicFunctions {}

Future urlLuncher(String url) async {
  var uri = Uri.parse(url);
  if (!await canLaunchUrl(uri)) {
    launchUrl(uri);
  } else {
    print("not found");
  }
}
