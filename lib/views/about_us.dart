import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  double currentPageValue = 500.0;
  bool isDarkMode = false; // Track dark mode state
  // Toggle dark mode
  void _toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = 200;
    double height = 200;
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
                  child: const Text("Our Team")),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/services');
                  },
                  child: const Text("Services")),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/aboutUs');
                  },
                  child: const Text("About Us")),
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
                    padding: const EdgeInsets.only(top: 5, left: 170),
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
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 60, left: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 400,
                        child: Text(
                          "Belief Powers Business",
                          style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: 50),
                          softWrap: true,
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          "At PCG, we go beyond helping businesses transform through technology. We help them make a meaningful difference; to their customers, and to the communities they serve",
                          softWrap: true,
                          style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    'https://placekitten.com/700/500',
                    fit: BoxFit.cover,
                    width: 700,
                    height: 500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text(
              "Belief in Action",
              style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                return Container(
                  color: Colors.green,
                  height: 400,
                  width: 300,
                  child: Column(children: [
                    Material(
                      child: InkWell(
                        hoverColor: Colors.blue,
                        onTap: () {},
                        onHover: (value) {
                          print("Hi");
                          setState(() {
                            width = value ? 300 : 200;
                          });
                        },
                        child: Container(
                          color: Colors.red,
                          height: 250,
                          width: 300,
                          child: Column(
                            children: [
                              AnimatedContainer(
                                height: height,
                                width: width,
                                color: Colors.blue,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeIn,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
                );
              }),
            ),
          ),
          SizedBox(
            height: 100,
          )
        ]),
      ),
    );
  }
}