import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

import '../auth.dart';

class TodoProvider extends ChangeNotifier {
  TodoProvider() {
    readTodos();
  }

  // we need our databaseId,CollectionId
  String databaseId = "64343d2ac12eddecff3f";
  String collectionId = "64343d86071cbb82ec2f";

  final Databases database = Databases(client);
  List<Document> _todos = [];

  //get all the todos
  List<Document> get allTodos => _todos;

  Future readTodos() async {
    try {
      final data = await database.listDocuments(
          databaseId: databaseId, collectionId: collectionId);

      _todos = data.documents;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

//create new task
  Future createNewTodo(String? title, String? description) async {
    final collection = await database.createDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: ID.unique(),
        data: {
          "title": title,
          "description": description,
          "isDone": false,
          'createdBy': "kitty@email.com"
        });

    readTodos();
    notifyListeners();
  }

  Future markCompleted(String id, bool isDone) async {
    final data = await database.updateDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: id,
        data: {"isDone": isDone});
    readTodos();
    notifyListeners();
  }

//update todos
  Future updateTodo(String title, String desc, String id) async {
    final data = await database.updateDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: id,
        data: {"title": title, "description": desc});
    readTodos();
    notifyListeners();
  }

//delete todos
  Future deleteTodo(String id) async {
    final data = database.deleteDocument(
        databaseId: databaseId, collectionId: collectionId, documentId: id);
    readTodos();
    notifyListeners();
  }
}
