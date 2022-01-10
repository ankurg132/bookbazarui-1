import 'package:bookbazar/models/book_model.dart';
import 'package:curved_drawer_fork/curved_drawer_fork.dart';
import 'package:flutter/material.dart';

class MyColors {
  // static const horizontalbarColor = Color.fromRGBO(165, 175, 24, 1);
  static const primaryColor = Color.fromRGBO(25, 54, 134, 1);
  // static const defaultpadding = const EdgeInsets.only(left: 20, right: 20);
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
static final List<DrawerItem> drawerItems = <DrawerItem>[
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
