import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:pcg/appwrite.dart';
import 'package:pcg/constants.dart';
import 'package:pcg/widgets/appbar.dart';
import 'package:pcg/widgets/drawer.dart';
import 'package:pcg/widgets/footer.dart';
import 'package:url_launcher/url_launcher.dart';

class DirectBlogPage extends StatefulWidget {
  const DirectBlogPage({super.key, required this.urlId});
  final String urlId;

  @override
  State<DirectBlogPage> createState() => _DirectBlogPageState();
}

class _DirectBlogPageState extends State<DirectBlogPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      DocumentList list = await appwrite.databases
          .listDocuments(databaseId: databaseId, collectionId: collectionId);
      Document blogPost = list.documents.where((blogPost) {
        return blogPost.data['urlId'] == widget.urlId;
      }).first;
      setState(() {
        image = blogPost.data['thumbnail'];
        title = blogPost.data['title'];
        content = blogPost.data['content'];
      });
    });
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ScrollController scrollController = ScrollController();
  String? image;
  String? title;
  String? content;

  @override
  Widget build(
    BuildContext context,
  ) {
    bool isWideScreen = MediaQuery.of(context).size.width >= 800;
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          scaffoldKey: scaffoldKey,
        ),
      ),
      drawer: const CustomDrawer(),
      body: image == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : LayoutBuilder(
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
                                  image ?? "",
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
                                  title ?? "",
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
                                          ? 0.2 *
                                              MediaQuery.sizeOf(context).width
                                          : 40),
                                  child: MarkdownBody(
                                    selectable: true,
                                    data: content ?? "",
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
