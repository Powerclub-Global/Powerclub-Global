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
                        spacing: 20.0,
                        runSpacing: 20.0,
                        alignment: WrapAlignment.center,
                        children: List.generate(blogNotifier.pressReleases.length, (index) {
                          return BlogBox(
                            title: blogNotifier.pressReleases[index].data["title"],
                            description:
                                blogNotifier.pressReleases[index].data["description"],
                            image: blogNotifier.pressReleases[index].data["thumbnail"],
                            tag: blogNotifier.pressReleases[index].data["tag"],
                            content: blogNotifier.pressReleases[index].data["content"],
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
