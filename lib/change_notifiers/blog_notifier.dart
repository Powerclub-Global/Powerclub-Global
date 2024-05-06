import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:pcg/appwrite.dart';
import 'package:pcg/constants.dart';

BlogNotifier blogNotifier = BlogNotifier();

class BlogNotifier extends ChangeNotifier {
  bool areBlogsFetched = false;
  List<Document> blogs = [];

  Future<void> fetchBlogs() async {
    print("fetching blogs");
    DocumentList list = await appwrite.databases
        .listDocuments(databaseId: DatabaseID, collectionId: CollectionID);
    print("Blogs fetched");
    blogs = list.documents;
    areBlogsFetched = true;
    notifyListeners();
  }
}
