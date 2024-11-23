 // تابع برای باز کردن mailto
  import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';




  void _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      if (kDebugMode) {
        print('Could not launch $url');
      }
    }
  }