import 'package:flutter/material.dart';

class HomeConnect extends StatelessWidget {
  const HomeConnect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      color: const Color(0xFFB4914C),
      padding: const EdgeInsets.all(16),
      child: isDesktop
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: OptionCard(
                    title: "What can we help you Achieve?",
                    buttonText: "    Let's Get to Work!    ",
                    onPressed: () {
                      Navigator.pushNamed(context, '/contactUsPage'); // Route to Contact page
                    },
                  ),
                ),
                const SizedBox(
                  height: 100,
                  child: VerticalDivider(color: Colors.white, width: 2),
                ),
                Expanded(
                  child: OptionCard(
                    title: "Where Powerclub Global can take you?",
                    buttonText: "    Come and See!    ",
                    onPressed: () {
                      Navigator.pushNamed(context, '/careersPage'); // Route to Careers page
                    },
                  ),
                ),
              ],
            )
          : Column(
              children: [
                OptionCard(
                  title: "What can we help you Achieve?",
                  buttonText: "    Let's Get to Work!    ",
                  onPressed: () {
                    Navigator.pushNamed(context, '/contactUsPage'); // Route to Contact page
                  },
                ),
                const SizedBox(height: 16),
                const Divider(color: Colors.white, height: 2),
                const SizedBox(height: 16),
                OptionCard(
                  title: "Where Powerclub Global can take you?",
                  buttonText: "    Come and See!    ",
                  onPressed: () {
                    Navigator.pushNamed(context, '/careersPage'); // Route to Careers page
                  },
                ),
              ],
            ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onPressed;

  const OptionCard({
    Key? key,
    required this.title,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.white),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 20),
          ),
          child: Text(buttonText),
        ),
      ],
    );
  }
}
