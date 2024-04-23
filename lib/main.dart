import 'package:flutter/material.dart';
import 'package:pcg/views/about_us.dart';
import 'package:pcg/views/carees.dart';
import 'package:pcg/views/home_view.dart';
import 'package:pcg/views/services_page.dart';
import 'package:pcg/views/team.dart'; // Replace with your actual project name and import path

void main() {
  runApp(MaterialApp(
    title: 'Powerclub Global',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    routes: {
      '/': (context) => HomeView(),
      '/careers': (context) => CareersPage(),
      '/aboutUs': (context) => AboutUsScreen(),
      '/team': (context) => TeamPage(),
      '/services': (context) => ServicesPage(),
    },
    initialRoute: '/', // Load HomeView as the initial route
  ));
}
