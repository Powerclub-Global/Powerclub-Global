import 'package:flutter/material.dart';
import 'package:pcg/home_view.dart'; // Replace with your actual project name and import path

void main() {
  runApp(MaterialApp(
    title: 'Powerclub Global',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: HomeView(), // Load HomeView as the initial route
  ));
}
