import 'package:bookbazar/models/book_model.dart';
import 'package:curved_drawer_fork/curved_drawer_fork.dart';
import 'package:flutter/material.dart';

class MyColors {
  static const primaryColor = Color.fromRGBO(147, 97, 255, 1);
 
}

class NavIcons {
  static final iconList = <IconData>[
    Icons.home,
    Icons.chat,
    Icons.location_off,
    Icons.person
  ];
}

dynamic changeTojson(BookModel data) {
  return <String, String>{
    "id": data.id,
    "title": data.title,
    "subtitle": data.subtitle,
    "price": data.price,
    "description": data.description,
    "address": data.address,
    "author": data.author,
    "bookImageUrl": data.bookImageUrl,
  };
}

LinearGradient linearGradient() {
  return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        // Colors.red,
        // Colors.blue,
        Color.fromRGBO(147, 97, 255, 1),
        Color.fromRGBO(114, 102, 255, 1),
      ]);
}

BookModel jsontoModelConverter(books) {
  return BookModel(
      title: books["title"],
      id: books["id"],
      description: books["description"],
      subtitle: books["subtitle"],
      author: books["author"],
      bookImageUrl: books["bookImageUrl"],
      price: books["price"],
      address: books["address"]);
}

class DrawerIcons {
  static final List<DrawerItem> drawerItems =<DrawerItem>[
    DrawerItem(icon: Icon(Icons.people), label: "People"),
    DrawerItem(icon: Icon(Icons.trending_up), label: "Trending"),
    DrawerItem(icon: Icon(Icons.tv)),
    DrawerItem(icon: Icon(Icons.work), label: "Work"),
    DrawerItem(icon: Icon(Icons.web)),
    DrawerItem(icon: Icon(Icons.videogame_asset)),
    DrawerItem(icon: Icon(Icons.book), label: "Book"),
    DrawerItem(icon: Icon(Icons.call), label: "Telephone")
  ];
}
