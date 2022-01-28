// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bookbazar/models/book_model.dart';
import 'package:bookbazar/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'constants/colors.dart';

class NetworkHandler with ChangeNotifier {
  List<BookModel> bookmodels = [];
  List<BookModel> get bookmodel {
    return [...bookmodels];
  }

  String baseurl =
      "http://ac9e-2409-4043-2b09-6608-b95a-5c8-65c2-9231.ngrok.io";
  FlutterSecureStorage storage = FlutterSecureStorage();

  Future get(String url) async {
    String? token = await storage.read(key: "token");
    url = formater(url);

    log('----- before googel auth callesd-------------------');
    var response = await http.get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $token"},
    );
    log('----- after googel auth called-------------------');
    if (response.statusCode == 200 || response.statusCode == 201) {
      // var data = response.body;
      log("is side 200");
      final data = await json.decode(response.body) as Map<String, dynamic>;
      // log(data.toString());
      log(data.toString());
      bookmodels.clear();
      await data["data"].forEach((books) {
        bookmodels.add(jsontoModelConverter(books));
        log('-----------------------------------------');
        // log("${title}");
        log(jsontoModelConverter(books).toJson());
        log('------------------------------------------------');
      });
      log('-----length-------------------');
      // log("${title}");
      log(bookmodels.length.toString());
      log('-----length-------------------');
      notifyListeners();

      // return json.decode(response.body);
      return bookmodels;
    }
    notifyListeners();
    // log(response.body);
    // log(response.statusCode.toString());
  }

  Future<http.Response> googleAuthPost(String url, GoogleUser user) async {
    String token = await storage.read(key: "token") ?? "n";
    url = formater(url);
    log(user.displayName.toString());
    var response = await http.post(Uri.parse(url),
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: json.encode(
          {
            "displayName": user.displayName,
            "photoUrl": user.photoUrl,
            "email": user.email,
            "id": user.id,
          },
        ));
    if (response.statusCode == 200) {
      log('-----success-------------------');
      log("success}");
      log('-----success-------------------');
    } else {}
    return response;
  }

  Future<http.Response> post(String url, Map<String, String> body) async {
    String token = await storage.read(key: "token") ?? "n";
    url = formater(url);
    log(body.toString());
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> patch(String url, Map<String, String> body) async {
    String token = await storage.read(key: "token") ?? "n";
    url = formater(url);
    log(body.toString());
    var response = await http.patch(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: json.encode(body),
    );
    return response;
  }

  // Future<http.Response> post1(String url, var body) async {
  Future<http.Response> post1(String url, BookModel body) async {
    String token = await storage.read(key: "token") ?? "n";
    url = formater(url);
    // log(body);
    print("inside http ");

    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        // "Content-type": "text/html",
        "Authorization": "Bearer $token"
        // 'connection': 'keep-alive'
      },
      // body: json.encode(<String, String>{"id": body.id, "title": body.title}),
      body: json.encode(changeTojson(body)),
    );
    print("+++++++++|||||||||||||||||||||||||||||||||||+++++++++++++++++");
    print("$response ");
    print("+++++++++|||||||||||||||||||||||||||||||||||+++++++++++++++++");

    return response;
  }

  Future<http.StreamedResponse> patchImage(String url, String filepath) async {
    url = formater(url);
    String token = await storage.read(key: "token") ?? "n";
    var request = http.MultipartRequest('PATCH', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath("img", filepath));
    request.headers.addAll({
      "Content-type": "multipart/form-data",
      "Authorization": "Bearer $token"
    });
    var response = request.send();
    return response;
  }

  String formater(String url) {
    return baseurl + url;
  }

  NetworkImage getImage(String imageName) {
    String url = formater("/uploads//$imageName.jpg");
    return NetworkImage(url);
  }
}
