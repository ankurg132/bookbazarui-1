import 'dart:developer';

import 'package:bookbazar/models/user_model.dart';
import 'package:flutter/material.dart';

import '../network_crud_operation.dart';

class BookProvider with ChangeNotifier {
  NetworkHandler networkHandler = NetworkHandler();
  var book;
  Future<void> loadBooks() async {
    book = await networkHandler.get("/book/getbooks");
    log('-----book-------------------');
    log("${book[0]}");
    log('-----title-------------------');
    notifyListeners();
  }
}
