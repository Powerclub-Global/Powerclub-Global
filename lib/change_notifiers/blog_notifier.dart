import 'dart:developer';

import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:pcg/appwrite.dart';
import 'package:pcg/constants.dart';

BlogNotifier blogNotifier = BlogNotifier();

class BlogNotifier extends ChangeNotifier {
  bool areBlogsFetched = false;
  Map<String, Document> blogs = {};
  Map<String, Document> pressReleases = {};

  Future<void> fetchBlogs() async {
    DocumentList list = await appwrite.databases
        .listDocuments(databaseId: databaseId, collectionId: collectionId);

    blogs = {
      for (var blogPost in list.documents
          .where((blogPost) => blogPost.data["isPress"] == false)
          .toList())
        blogPost.data['urlId']: blogPost
    };

    pressReleases = {
      for (var blogPost in list.documents
          .where((blogPost) => blogPost.data["isPress"] == true)
          .toList())
        blogPost.data['urlId']: blogPost
    };
    log("Fetched blogs", name: "BlogNotifier");
    log(blogs.toString(), name: "BlogNotifier");
    log(pressReleases.toString(), name: "BlogNotifier");

    areBlogsFetched = true;
    notifyListeners();
  }
}
