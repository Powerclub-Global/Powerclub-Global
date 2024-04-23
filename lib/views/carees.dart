import 'package:flutter/material.dart';
import 'package:pcg/store_grid.dart';
import 'package:url_launcher/url_launcher.dart';

class CareersPage extends StatefulWidget {
  @override
  CareersPageState createState() => CareersPageState();
}

class CareersPageState extends State<CareersPage> {
  final PageController _pageController = PageController(
    initialPage: 500,
    viewportFraction: .33,
  );
  double currentPageValue = 500.0;
  bool isDarkMode = false; // Track dark mode state

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page!;
      });
    });
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(Duration(seconds: 4), () {
      if (currentPageValue >= 999.0) {
        _pageController.jumpToPage(500);
      } else {
        _pageController.nextPage(
          duration: Duration(seconds: 4),
          curve: Curves.linear,
        );
      }
      _startAutoScroll();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _openWebsiteInWebView(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  // Toggle dark mode
  void _toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  List<dynamic> jobData = [
    {
      "name": "Python Deveveloper",
      "type": "Part Time",
      "description": "Do Python library integration and stuff",
      "skills": ["Figma", "UI Basics", "Codelessly"],
      "salary": "200 USD/Month"
    },
    {
      "name": "UI Designer",
      "type": "Full Time",
      "description": "Build reels and handle companies all reel requirement",
      "skills": ["Python", "Open CV", "Fast API"],
      "salary": "500 USD/Month"
    },
    {
      "name": "Cloud Engineer",
      "type": "Part Time",
      "description": "Handle Deployments for cloud and serverless functions",
      "skills": ["AWS", "Firebase", "Supabase"],
      "salary": "300 USD/Month"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.black : Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFB4914C), // Gold shadow color
                  blurRadius: 2.5, // 50% smaller blur radius
                  offset: Offset(0, 2), // 50% smaller offset
                ),
              ],
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor:
                  Colors.transparent, // Make AppBar background transparent
              elevation: 0, // Remove the default shadow
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/team');
                    },
                    child: Text("Our Team")),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/services');
                    },
                    child: Text("Services")),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/aboutUs');
                    },
                    child: Text("About Us")),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: isDarkMode ? null : Colors.black),
                    onPressed: () {
                      Navigator.pushNamed(context, '/careers');
                    },
                    child: Text(
                      "Join Us",
                      style: TextStyle(color: isDarkMode ? null : Colors.white),
                    )),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isDarkMode ? Icons.wb_sunny : Icons.brightness_2,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                      onPressed: _toggleDarkMode,
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ],
              title: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/pcg${isDarkMode ? "_b" : ""}.png',
                      height: 40.0,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 170),
                      child: Text(
                        'Powerclub Global',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Cinzel',
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 60, left: 50, right: 62),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Active Job Openings",
                    style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width > 1000
                        ? 400
                        : 0.6 * MediaQuery.sizeOf(context).width,
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.search),
                            SizedBox(
                              width: 5,
                            )
                          ],
                        ),
                        hintText: 'Find Job',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              StoreGrid(
                girdData: jobData,
                isDark: isDarkMode,
              )
            ],
          ),
        ));
  }
}

class LogoWidget extends StatelessWidget {
  final String imagePath;

  LogoWidget(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        imagePath,
        width: 100.0,
      ),
    );
  }
}
