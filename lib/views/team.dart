import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  bool isDarkMode = false; // Track dark mode state
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
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Teams Page",
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                )),
          )
        ]),
      ),
    );
    ;
  }
}
