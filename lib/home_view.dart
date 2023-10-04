import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

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
    Future.delayed(Duration(seconds: 2), () {
      if (currentPageValue >= 999.0) {
        _pageController.jumpToPage(500);
      } else {
        _pageController.nextPage(
          duration: Duration(seconds: 2),
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

  // Function to open a website URL
  void _openWebsite(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to #FFFFFF
      appBar: AppBar(
        backgroundColor: Colors.white, // Set background color of the app bar to #FFFFFF
        title: Row(
          children: <Widget>[
            Image.asset(
              'assets/pcg.png',
              height: 40.0,
            ),
            SizedBox(width: 8.0),
            Text(
              'Powerclub Global',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        elevation: 5,
        shadowColor: Color(0xFFB4914C),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height - kToolbarHeight - 200.0,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(
                        'assets/hero_image.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
          Container(
            height: 200.0,
            color: Colors.white,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 10000,
              itemBuilder: (context, index) {
                final logoIndex = index % 5;
                final logoImagePath = 'assets/${(index % 5) + 1}.png';

                // Wrap LogoWidget in a GestureDetector to make it clickable
                return GestureDetector(
                  onTap: () {
                    // Open the website when the logo is tapped
                    _openWebsite('https://powerclubglobal.com'); // Replace with the actual URL
                  },
                  child: LogoWidget(logoImagePath),
                );
              },
            ),
          ),
          Material(
            elevation: 5,
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  "Copyright Powerclub Global LLC",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
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
