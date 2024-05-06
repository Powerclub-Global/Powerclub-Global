import 'package:flutter/material.dart';
import 'package:pcg/appwrite.dart';
import 'package:pcg/change_notifiers/blog_notifier.dart';
import 'package:pcg/pages/blog_page.dart';
import 'package:pcg/theme/theme.dart';
import 'package:pcg/theme/theme_manager.dart';
import 'pages/home.dart';
import 'pages/industries.dart';
import 'pages/services.dart';
import 'pages/insights.dart';
import 'pages/about.dart';
import 'pages/contact.dart';
import 'pages/careers.dart';
import 'pages/bodhi.dart';

void main() {
  appwrite.initialiseAppwrite();
  blogNotifier.fetchBlogs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeManager,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Powerclub Global',
          theme: MyAppThemes.lightTheme,
          darkTheme: MyAppThemes.darkTheme,
          themeMode: themeManager.themeMode,
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => Home(),
            '/industriesPage': (context) => IndustriesPage(),
            '/servicesPage': (context) => ServicesPage(),
            '/insightsPage': (context) => const InsightsPage(),
            '/aboutUsPage': (context) => AboutUsPage(),
            '/contactUsPage': (context) => const ContactUsPage(),
            '/careersPage': (context) => CareersPage(),
            '/bodhiPage': (context) => const Bodhi(),
            '/blogs': (context) => const BlogPage()
          },
        );
      },
    );
  }
}
