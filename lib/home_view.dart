import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController(
    initialPage: 500, // Set an initial page to make continuous scrolling
    viewportFraction: 0.33, // Set the fraction to display three logos at a time
  );
  double currentPageValue = 500.0; // Initialize currentPageValue

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
          curve: Curves.easeInOut,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set background color to white
        title: Row(
          children: <Widget>[
            Image.asset(
              'assets/pcg.png', // Replace with the path to your logo image
              height: 40.0, // Adjust the logo height as needed
            ),
            SizedBox(width: 8.0), // Add spacing between logo and title
            Text(
              'Powerclub Global',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Set text color to black
              ),
            ),
          ],
        ),
        elevation: 5, // Add elevation for shadow
        shadowColor: Color(0xFFB4914C), // Set shadow color to #B4914C
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 300.0, // Set the desired maximum height
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          'assets/hero_image.jpg',
                          fit: BoxFit.cover, // Set fit to cover
                          width: double.infinity,
                        ),
                        Center(
                          child: Text(
                            "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
          Container(
            height: 100.0, // Adjust the height of the rotating logos
            child: PageView.builder(
              controller: _pageController,
              itemCount: 1000, // Set a large number for continuous scrolling
              itemBuilder: (context, index) {
                final rotationValue =
                    (1 - (index - currentPageValue).abs()).clamp(0.0, 1.0);
                final scaleValue = Curves.easeInOut.transform(rotationValue);

                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001) // Perspective
                    ..rotateY(rotationValue * 0.5)
                    ..scale(scaleValue),
                  alignment: Alignment.center,
                  child: LogoWidget('assets/${(index % 5) + 1}.png'),
                );
              },
            ),
          ),
          Material(
            elevation: 5, // Add elevation for shadow
            color: Colors.white, // Set the background color of the footer to white
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  "Copyright Powerclub Global LLC",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black, // Set text color to black
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
        width: 100.0, // Adjust the logo size as needed
      ),
    );
  }
}
