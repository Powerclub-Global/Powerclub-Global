import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileView(),
      tablet: TabletView(),
      desktop: DesktopView(),
    );
  }
}

class MobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile View'),
      ),
      body: Center(
        child: Text('Content for mobile view goes here'),
      ),
    );
  }
}

class TabletView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tablet View'),
      ),
      body: Center(
        child: Text('Content for tablet view goes here'),
      ),
    );
  }
}

class DesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desktop View'),
      ),
      body: Center(
        child: Text('Content for desktop view goes here'),
      ),
    );
  }
}
