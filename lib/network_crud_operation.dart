// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  // String baseurl = "http://c476-2409-4043-219f-ff15-6479-ade8-3251-54d4.ngrok.io";
  String baseurl = "http://6171-2409-4043-304-15e7-a101-a171-bdd-cae6.ngrok.io";
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
      log(response.body);

      return json.decode(response.body);
    }
    log(response.body);
    log(response.statusCode.toString());
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

  Future<http.Response> post1(String url, var body) async {
    String token = await storage.read(key: "token") ?? "n";
    url = formater(url);
    log(body);
    print("inside http ");

    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $token",
        'connection': 'keep-alive'
      },
      body: json.encode(body),
      // body:  body,
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
