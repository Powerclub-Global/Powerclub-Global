import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkTreeWidget extends StatelessWidget {
  final String assetPath;
  final String name;
  final String contact;
  final List<LinkButton> links;

  const LinkTreeWidget({
    Key? key,
    required this.assetPath,
    required this.name,
    required this.contact,
    required this.links,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 600;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20), // Added padding above the image
            CircleAvatar(
              backgroundImage: AssetImage(assetPath),
              radius: 60.0,
            ),
            const SizedBox(height: 20),
            Text(name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8), // Padding above the contact field
            Text(contact, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 20),
            ...links.map((link) => Container(
                  width: isDesktop
                      ? constraints.maxWidth * 0.5
                      : double.infinity, // Adjust for desktop view
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: link,
                )),
          ],
        );
      },
    );
  }
}

class LinkButton extends StatelessWidget {
  final String title;
  final String url;
  final bool isDownload;

  const LinkButton({
    Key? key,
    required this.title,
    required this.url,
    required this.isDownload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0), // Space between buttons
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: isDownload
              ? BorderSide(
                  color: isDarkMode
                      ? Colors.white
                      : const Color(0xFFDCB62A), // Border color
                  width: 2.0, // Border width
                )
              : null,
          foregroundColor: isDarkMode
              ? Colors.white
              : Colors.black, // Adjusted text color for light mode
          backgroundColor: isDownload ? const Color.fromARGB(255, 255, 201, 8) : null,
          minimumSize: const Size(double.infinity, 50),
          padding: const EdgeInsets.symmetric(vertical: 16.0), // Adjust padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                30.0), // Increased border radius for rounded corners
          ),
        ),
        onPressed: () => _launchURL(url),
        child: Text(title),
      ),
    );
  }

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
