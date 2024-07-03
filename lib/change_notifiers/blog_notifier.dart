import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:pcg/appwrite.dart';
import 'package:pcg/constants.dart';

BlogNotifier blogNotifier = BlogNotifier();

class BlogNotifier extends ChangeNotifier {
  bool areBlogsFetched = false;
  List<Document> blogs = [];
  List<Document> pressReleases = [];

  Future<void> fetchBlogs() async {
    DocumentList list = await appwrite.databases
        .listDocuments(databaseId: DatabaseID, collectionId: CollectionID);

    blogs = list.documents
        .where((blogPost) => blogPost.data["isPress"] == false)
        .toList();

    pressReleases = list.documents
        .where((blogPost) => blogPost.data["isPress"] == true)
        .toList();

    areBlogsFetched = true;
    notifyListeners();
  }
}
