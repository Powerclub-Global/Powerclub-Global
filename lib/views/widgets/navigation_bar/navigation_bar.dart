import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 80,
            width: 150,
            child: Image.asset('assets/pcglogo.jpeg'),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _NavBarItem(iconData: Icons.home, title: 'Home'),
              SizedBox(width: 60),
              _NavBarItem(iconData: Icons.chat, title: 'Chat'),
            ],
          )
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData iconData;
  final String title;

  const _NavBarItem({required this.iconData, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(iconData, size: 24), // Use Icon widget here
        Text(title, style: TextStyle(fontSize: 18)),
      ],
    );
  }
}

