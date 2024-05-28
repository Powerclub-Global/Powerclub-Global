import 'package:flutter/material.dart';
import 'package:pcg/widgets/home_insights.dart';
import 'package:pcg/widgets/press_release.dart';
import '../widgets/appbar.dart'; // Make sure the path is correct
import '../widgets/footer.dart';
import '../widgets/drawer.dart';

class PressReleasePage extends StatelessWidget {
  const PressReleasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey =
        GlobalKey<ScaffoldState>(); // For drawer
    bool isWideScreen = MediaQuery.of(context).size.width >= 800;
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          scaffoldKey: scaffoldKey,
          // Add other required arguments for CustomAppBar here
        ),
      ),
      drawer: const CustomDrawer(), // Assuming you have a CustomDrawer widget
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 60),
                        Text(
                          'Press Releases',
                          style: TextStyle(
                              fontFamily: 'Cinzel',
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 40),
                        Text(
                          "Explore our latest Press Releases keeping you intouch with today's most pressing economy and technology world.",
                          style: TextStyle(
                            fontFamily: 'Cinzel',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        PressReleaseSection(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  isWideScreen ? const SizedBox() : const Footer()
                ],
              ),
            ),
          ),
          isWideScreen ? const Footer() : const SizedBox()
        ],
      ),
    );
  }
}
