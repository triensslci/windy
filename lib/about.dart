import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:home_widget/home_widget.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.black
            : Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Giới thiệu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            // Display app icon
            Image.asset(
              'android/app/src/main/res/mipmap-hdpi/ic_launcher.png',
              width: 64,
              height: 64,
            ),
            SizedBox(height: 16),
            // Display app name
            Text(
              'Trung tâm Dự báo KTTV quốc gia',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 8),
            // Display app version
            Text(
              'Phiên bản 1.0.3',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Spacer(),
            // Display developer name and GitHub repository
            Text('© Aryan Sinha'),
            SizedBox(height: 8),
            Text('https://github.com/techyminati/windy'),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
