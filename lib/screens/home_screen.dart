// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bookbazar/constants/colors.dart';
import 'package:bookbazar/models/appbar.dart';
import 'package:bookbazar/models/drawer.dart';
import 'package:bookbazar/pages/welcome_page.dart';
import 'package:bookbazar/screens/book_selling_form_screen.dart';
import 'package:bookbazar/screens/cart_screen.dart';
import 'package:bookbazar/screens/chat_screens.dart';
import 'package:bookbazar/widgets/home_page_widget.dart';
import 'package:curved_drawer_fork/curved_drawer_fork.dart';
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
var mediaquery=MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(context),
      // backgroundColor: MyColors.primaryColor,
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: mediaquery.height * 0.83,
                  width: mediaquery.width*0.95,
                  child: ListView(
                    children: [
                      HomePageWidget(),
                      HomePageWidget(),
                      HomePageWidget(),
                      HomePageWidget(),
                      HomePageWidget(),
                      HomePageWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(
        drawerItems: DrawerIcons.drawerItems,
      ),
      floatingActionButton: floatingactionbutton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: navbar(context),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }

  AnimatedBottomNavigationBar navbar(BuildContext context) {
    return AnimatedBottomNavigationBar(
      backgroundColor: MyColors.primaryColor,
      icons: NavIcons.iconList,
      activeIndex: 1,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
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
    );
  }

  FloatingActionButton floatingactionbutton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: MyColors.primaryColor,
      onPressed: () {
        Navigator.of(context).pushNamed(
          BookSellingFormScreen.routeName,
          // arguments: product.id
        );
      },
      //params
    );
  }

  void logout() async {
    await storage.delete(key: "token");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => WelComePage()),
        (route) => false);
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.badge_sharp),
      tooltip: 'search',
      onPressed: () {
        Navigator.of(context).pushNamed(
          MyCart.routeName,
          // arguments: product.id
        );
      },
    );
  }
}
