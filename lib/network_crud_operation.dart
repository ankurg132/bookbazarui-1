// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:bookbazar/models/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'constants/colors.dart';

class NetworkHandler with ChangeNotifier {
  // String baseurl = "http://c476-2409-4043-219f-ff15-6479-ade8-3251-54d4.ngrok.io";
  // String baseurl = "http://6171-2409-4043-304-15e7-a101-a171-bdd-cae6.ngrok.io";
  // String baseurl = "http://localhost:3000";
  List<BookModel> bookmodels = [
     BookModel(
        title: 'Success',
        id: 'id',
        description: 'Book based on success ',
        subtitle: 'How to become success?',
        author: 'Ankur Gupta',
        bookImageUrl: "https://picsum.photos/200/300",
        price: '123 Rs',
        address: 'RGPV Bhopal'),
  ];
  List<BookModel> get bookmodel {
    return [...bookmodels];
  }

  String baseurl =
      "http://dfd3-2409-4043-2c9a-9544-2ce7-308e-e6fa-91c2.ngrok.io";
  FlutterSecureStorage storage = FlutterSecureStorage();

  Future get(String url) async {
    String? token = await storage.read(key: "token");
    url = formater(url);
    // /user/register
    var response = await http.get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      // var data = response.body;
      final data = await json.decode(response.body) as Map<String, dynamic>;
      // log(data.toString());
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

      return json.decode(response.body);
    }
    // log(response.body);
    // log(response.statusCode.toString());
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
