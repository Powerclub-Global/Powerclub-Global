import 'package:appwrite/models.dart';
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
                    ? Wrap(
                        spacing: 45,
                        runSpacing: 45,
                        alignment: WrapAlignment.center,
                        children: List.generate(
                            blogNotifier.pressReleases.length, (index) {
                          Document? post = blogNotifier.pressReleases[
                              blogNotifier.pressReleases.keys.elementAt(index)];
                          return BlogBox(
                            urlId: blogNotifier.pressReleases.keys
                                .elementAt(index),
                            title: post!.data["title"],
                            description: post.data["description"],
                            image: post.data["thumbnail"],
                            tag: post.data["tag"],
                            content: post.data["content"],
                            isDesktop: isDesktop,
                          );
                        }),
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
