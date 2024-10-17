import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:pcg/widgets/appbar.dart';
import 'package:pcg/widgets/drawer.dart';
import 'package:pcg/widgets/footer.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogPage extends StatelessWidget {
  const BlogPage(
      {super.key,
      required this.image,
      required this.title,
      required this.content});
  final String image;
  final String title;
  final String content;
  @override
  Widget build(
    BuildContext context,
  ) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    bool isWideScreen = MediaQuery.of(context).size.width >= 800;
    ScrollController scrollController = ScrollController();
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          scaffoldKey: scaffoldKey,
        ),
      ),
      drawer: const CustomDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = MediaQuery.of(context).size.width > 786;
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 400,
                          child: Image.network(
                            image,
                            fit: BoxFit.contain,
                            width: 1440,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: isDesktop
                                  ? 0.2 * MediaQuery.sizeOf(context).width
                                  : 20,
                              vertical: 15),
                          child: Text(
                            title,
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: isDesktop
                                    ? 0.2 * MediaQuery.sizeOf(context).width
                                    : 40),
                            child: MarkdownBody(
                              selectable: true,
                              data: content,
                              onTapLink: (text, href, title) {
                                launchUrl(Uri.parse(href!));
                              },
                              imageBuilder:
                                  (Uri uri, String? title, String? alt) {
                                return Center(
                                  child: Image.network(uri.toString()),
                                );
                              },
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                        isWideScreen ? const SizedBox() : const Footer(),
                      ],
                    )),
              ),
              isWideScreen ? const Footer() : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
