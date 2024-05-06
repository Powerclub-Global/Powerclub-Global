import 'package:flutter/material.dart';
import 'package:pcg/theme/theme_manager.dart';




class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeManager,
      builder: (context, child) {
        bool isWideScreen = MediaQuery.of(context).size.width >= 800;
        // Define the underline color based on the theme
        Color underlineColor =
            themeManager.isDarkMode ? Colors.white : const Color(0xFFB4914C);
        return AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor:
              themeManager.isDarkMode ? Colors.black : Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu,
                color: themeManager.isDarkMode ? Colors.white : Colors.black),
            onPressed: () => scaffoldKey.currentState?.openDrawer(),
          ),
          title: isWideScreen
              ? Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed('/'),
                      child: Image.asset(
                          'assets/pcg${themeManager.isDarkMode ? "_b" : ""}.png',
                          height: 40.0),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/industriesPage'),
                        child: Text("Industries",
                            style: TextStyle(
                                color: themeManager.isDarkMode
                                    ? Colors.white
                                    : Colors.black))),
                    TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/servicesPage'),
                        child: Text("Services",
                            style: TextStyle(
                                color: themeManager.isDarkMode
                                    ? Colors.white
                                    : Colors.black))),
                    TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/insightsPage'),
                        child: Text("Insights",
                            style: TextStyle(
                                color: themeManager.isDarkMode
                                    ? Colors.white
                                    : Colors.black))),
                    TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/aboutUsPage'),
                        child: Text("About Us",
                            style: TextStyle(
                                color: themeManager.isDarkMode
                                    ? Colors.white
                                    : Colors.black))),
                    TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/contactUsPage'),
                        child: Text("Contact Us",
                            style: TextStyle(
                                color: themeManager.isDarkMode
                                    ? Colors.white
                                    : Colors.black))),
                    TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/careersPage'),
                        child: Text("Careers",
                            style: TextStyle(
                                color: themeManager.isDarkMode
                                    ? Colors.white
                                    : Colors.black))),
                  ],
                )
              : GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/'),
                  child: Center(
                      child: Image.asset(
                          'assets/pcg${themeManager.isDarkMode ? "_b" : ""}.png',
                          height: 40.0)),
                ),
          actions: [
            IconButton(
              icon: Icon(
                  themeManager.isDarkMode ? Icons.wb_sunny : Icons.brightness_2,
                  color: themeManager.isDarkMode ? Colors.white : Colors.black),
              onPressed: () async {
                themeManager.themeMode == ThemeMode.light
                    ? themeManager.changeTheme(ThemeMode.dark)
                    : themeManager.changeTheme(ThemeMode.light);
              },
            ),
            const SizedBox(
              width: 20,
            ),
          ],
          centerTitle: !isWideScreen,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: underlineColor,
              height: 1.0,
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight + 2.0); // Adjusted for the underline height
}
