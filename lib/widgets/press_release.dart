import 'package:flutter/material.dart';
import 'package:pcg/change_notifiers/blog_notifier.dart';
import 'package:pcg/widgets/blog_box.dart';

class PressReleaseSection extends StatelessWidget {
  const PressReleaseSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ListenableBuilder(
              listenable: blogNotifier,
              builder: (context, child) {
                return blogNotifier.areBlogsFetched
                    ? isDesktop
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BlogBox(
                                title: blogNotifier.blogs[3].data["title"],
                                description:
                                    blogNotifier.blogs[3].data["description"],
                                image: blogNotifier.blogs[3].data["thumbnail"],
                                tag: blogNotifier.blogs[3].data["tag"],
                                content: blogNotifier.blogs[3].data["content"],
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
                                title: blogNotifier.blogs[3].data["title"],
                                description:
                                    blogNotifier.blogs[3].data["description"],
                                image: blogNotifier.blogs[3].data["thumbnail"],
                                tag: blogNotifier.blogs[3].data["tag"],
                                content: blogNotifier.blogs[3].data["content"],
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
        ],
      ),
    );
  }
}
