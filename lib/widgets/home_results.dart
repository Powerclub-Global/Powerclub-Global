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
                                urlId: blogNotifier.blogs.keys.elementAt(1),
                                title: blogNotifier
                                    .blogs[
                                        blogNotifier.blogs.keys.elementAt(1)]!
                                    .data["title"],
                                description: blogNotifier
                                    .blogs[
                                        blogNotifier.blogs.keys.elementAt(1)]!
                                    .data["description"],
                                image: blogNotifier
                                    .blogs[
                                        blogNotifier.blogs.keys.elementAt(1)]!
                                    .data["thumbnail"],
                                tag: blogNotifier
                                    .blogs[
                                        blogNotifier.blogs.keys.elementAt(1)]!
                                    .data["tag"],
                                content: blogNotifier
                                    .blogs[
                                        blogNotifier.blogs.keys.elementAt(1)]!
                                    .data["content"],
                                isDesktop: isDesktop,
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              BlogBox(
                                urlId: blogNotifier.blogs.keys.elementAt(1),
                                title: blogNotifier
                                    .blogs[
                                        blogNotifier.blogs.keys.elementAt(1)]!
                                    .data["title"],
                                description: blogNotifier
                                    .blogs[
                                        blogNotifier.blogs.keys.elementAt(1)]!
                                    .data["description"],
                                image: blogNotifier
                                    .blogs[
                                        blogNotifier.blogs.keys.elementAt(1)]!
                                    .data["thumbnail"],
                                tag: blogNotifier
                                    .blogs[
                                        blogNotifier.blogs.keys.elementAt(1)]!
                                    .data["tag"],
                                content: blogNotifier
                                    .blogs[
                                        blogNotifier.blogs.keys.elementAt(1)]!
                                    .data["content"],
                                isDesktop: isDesktop,
                              ),
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
