//https://picsum.photos/200/300   //  ⌘ ñ
//use lint
//import '../widget/detailscreen.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:bookbazar/pages/welcome_page.dart';
import './screens/book_selling_form_screen.dart';
import './screens/cart_screen.dart';
import './screens/chat_screens.dart';
import './screens/seller_chat_screen.dart';
import './widgets/book_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/loading_page.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';


void main() {

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
  ));
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = LoadingPage();
  final storage = FlutterSecureStorage();
  @override
  void initState() { 
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    String token = await storage.read(key: "token") ?? "n";
    if (token != "n") {
      setState(() {
        page = HomePage();
      });
    } else {
      setState(() {
        page = WelComePage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'homepage',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // home: page,
      routes: {
        BookDetailWidget.routeName: (ctx) => const BookDetailWidget(),
        BookSellingFormScreen.routeName: (ctx) => const BookSellingFormScreen(),
        SellerChatPage.routeName: (ctx) => SellerChatPage(),
        MyCart.routeName: (ctx) => MyCart(),
        UserChatScreen.routeName: (ctx) => UserChatScreen(),
        HomePage.routeName: (ctx) => HomePage(),
        WelComePage.routeName: (ctx) => WelComePage(),
      },
    );
  }
}
