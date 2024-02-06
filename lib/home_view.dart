import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light, // Set initial theme to light mode
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white, // Set AppBar background color to white
          elevation: 0, // Remove the default shadow
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Define dark theme
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black, // Set AppBar background color to black
          elevation: 0, // Remove the default shadow
        ),
      ),
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.black : Colors.white,
            boxShadow: [
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
              SizedBox(
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
                  SizedBox(
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 500,
                    child: Image.asset(
                      'assets/hero_image${isDarkMode ? "_b" : ""}.png', // Use "pcg_b" in dark mode
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 200.0,
            color: isDarkMode ? Colors.black : Colors.white,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 10000,
              itemBuilder: (context, index) {
                final logoIndex = index % 5;
                final logoImagePath =
                    'assets/${(logoIndex + 1)}${isDarkMode ? "b" : ""}.png';

                final urls = [
                  'https://ethdenver2023-kingbodhi.vercel.app/',
                  'https://app.tryspace.com/M6aiq2y/society-fine-art',
                  'https://crypto-hash-nine.vercel.app/',
                  'https://emergenceiii.vercel.app',
                  'https://emergenceiii.vercel.app',
                ];

                return InkWell(
                  onTap: () async {
                    if (urls.length > logoIndex) {
                      await _openWebsiteInWebView(urls[logoIndex]);
                    }
                  },
                  child: LogoWidget(logoImagePath),
                );
              },
            ),
          ),
          Material(
            elevation: 5,
            color: isDarkMode ? Colors.black : Colors.white,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  "Copyright Powerclub Global LLC",
                  style: TextStyle(
                    fontSize: 10.0,
                    fontFamily: 'Cinzel',
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
