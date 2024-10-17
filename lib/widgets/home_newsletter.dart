import 'dart:developer';

import 'package:flutter/material.dart';

class HomeNewsletter extends StatefulWidget {
  const HomeNewsletter({Key? key}) : super(key: key);

  @override
  State<HomeNewsletter> createState() => _HomeNewsletterState();
}

class _HomeNewsletterState extends State<HomeNewsletter> {
  final TextEditingController _emailController = TextEditingController();

  void _submit() {
    log('Submitted email: ${_emailController.text}');
    _emailController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Subscription successful!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    // Define additional padding for desktop view
    final isDesktop = screenWidth > 800;
    final horizontalPadding = isDesktop
        ? screenWidth * 0.2
        : 24.0; // For example, use 20% of screen width as padding for desktop

    return Container(
      color: isDarkMode ? Colors.black : Colors.white,
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Subscribe to Powerclub Global Insights",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            "Our monthly look into the critical challenges facing global businesses.",
            style: TextStyle(
                fontSize: 16, color: isDarkMode ? Colors.white : Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black),
                ),
              ),
              const SizedBox(width: 16),
              OutlinedButton(
                onPressed: _submit,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      color: isDarkMode ? Colors.white : Colors.black),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  foregroundColor: isDarkMode ? Colors.white : Colors.black,
                ),
                child: const Text('   Submit   '),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
