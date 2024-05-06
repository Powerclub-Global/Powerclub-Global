import 'package:flutter/material.dart';
import 'package:pcg/change_notifiers/blog_notifier.dart';
import 'package:pcg/widgets/blog_box.dart';

class ResultsSection extends StatelessWidget {
  const ResultsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "Championing the Bold to Achieve the Extraordinary",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            "See how we have helped ambitious clients achieve extraordinary outcomes",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ListenableBuilder(
              listenable: blogNotifier,
              builder: (context, child) {
                return blogNotifier.areBlogsFetched
                    ? isDesktop
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BlogBox(
                                title: blogNotifier.blogs[1].data["title"],
                                description:
                                    blogNotifier.blogs[1].data["description"],
                                image: blogNotifier.blogs[1].data["thumbnail"],
                                tag: blogNotifier.blogs[1].data["tag"],
                                content: blogNotifier.blogs[1].data["content"],
                                isDesktop: isDesktop,
                              ), // Assuming BlogBox is a widget you've defined
                              //   SizedBox(
                              //       width: 0.02083333333 *
                              //           MediaQuery.sizeOf(context).width),
                              //   BlogBox(
                              //     title: blogNotifier.blogs[0].data["title"],
                              //     description:
                              //         blogNotifier.blogs[0].data["description"],
                              //     image: blogNotifier.blogs[0].data["thumbnail"],
                              //     tag: blogNotifier.blogs[0].data["tag"],
                              //     content: blogNotifier.blogs[0].data["content"],
                              //     isDesktop: isDesktop,
                              //   ),
                            ],
                          )
                        : Column(
                            children: [
                              BlogBox(
                                title: blogNotifier.blogs[1].data["title"],
                                description:
                                    blogNotifier.blogs[1].data["description"],
                                image: blogNotifier.blogs[1].data["thumbnail"],
                                tag: blogNotifier.blogs[1].data["tag"],
                                content: blogNotifier.blogs[1].data["content"],
                                isDesktop: isDesktop,
                              ), // Assuming BlogBox is a widget you've defined
                              // SizedBox(height: 30),
                              // BlogBox(
                              //   title: blogNotifier.blogs[0].data["title"],
                              //   description:
                              //       blogNotifier.blogs[0].data["description"],
                              //   image: blogNotifier.blogs[0].data["thumbnail"],
                              //   tag: blogNotifier.blogs[0].data["tag"],
                              //   content: blogNotifier.blogs[0].data["content"],
                              //   isDesktop: isDesktop,
                              // ),
                            ],
                          )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              }),
          // const SizedBox(height: 25),
          // ElevatedButton(
          //   onPressed: () {
          //     // Define what happens when the button is pressed
          //     // For example, navigate to a page showing client results
          //     Navigator.of(context)
          //         .pushNamed('/clientsResults'); // Adjust the route as needed
          //   },
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor:
          //         const Color(0xFFB4914C), // Background color of the button
          //     foregroundColor: Colors.white, // Text color of the button
          //   ),
          //   child: const Text('See our Clients Results'),
          // ),
        ],
      ),
    );
  }
}
