// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bookbazar/constants/colors.dart';
import 'package:bookbazar/pages/welcome_page.dart';
import 'package:bookbazar/screens/book_selling_form_screen.dart';
import 'package:bookbazar/screens/cart_screen.dart';
import 'package:bookbazar/screens/chat_screens.dart';
import 'package:bookbazar/widgets/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/homepage';
  // const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  HomePageWidget(),
                  HomePageWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: MyColors.primaryColor,
        onPressed: () {
          Navigator.of(context).pushNamed(
            BookSellingFormScreen.routeName,
            // arguments: product.id
          );
        },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: MyColors.primaryColor,
        icons: NavIcons.iconList,
        activeIndex: 1,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) {
          switch (index) {
            case 1:
              Navigator.of(context).pushNamed(
                UserChatScreen.routeName,
                // arguments: product.id
              );
              break;
            default:
              Navigator.of(context).pushNamed(
                HomePage.routeName,
                // arguments: product.id
              );
          }
        },
        //other params
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }

  void logout() async {
    await storage.delete(key: "token");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => WelComePage()),
        (route) => false);
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.primaryColor,
      actions: [
        IconButton(
          icon: const Icon(Icons.badge_sharp),
          tooltip: 'search',
          onPressed: () {
            Navigator.of(context).pushNamed(
              MyCart.routeName,
              // arguments: product.id
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.power_off),
          tooltip: 'logout',
          onPressed: () {
            Navigator.of(context).pushNamed(
              WelComePage.routeName,
              // arguments: product.id
            );
          },
        ),
      ],
    );
  }
}
