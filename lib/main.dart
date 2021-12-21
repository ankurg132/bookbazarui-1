//https://picsum.photos/200/300   //  ⌘ ñ
//use lint
//import '../widget/detailscreen.dart';
// ignore_for_file: prefer_const_constructors

import 'package:bookbazar/screens/book_selling_form_screen.dart';
import 'package:bookbazar/screens/cart_screen.dart';
import 'package:bookbazar/screens/chat_screens.dart';
import 'package:bookbazar/screens/seller_chat_screen.dart';
import 'package:bookbazar/widgets/book_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'homepage',
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      routes: {
        BookDetailWidget.routeName: (ctx) => const BookDetailWidget(),
        SellerChatPage.routeName: (ctx) => SellerChatPage(),
        MyCart.routeName: (ctx) => MyCart(),
        UserChatScreen.routeName: (ctx) => UserChatScreen(),
        HomePage.routeName: (ctx) => HomePage(),
      },
    );
  }
}
