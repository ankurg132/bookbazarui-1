// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '/constants/colors.dart';
import '/models/appbar.dart';
import '/pages/welcome_page.dart';
import '/screens/book_selling_form_screen.dart';
import '/screens/cart_screen.dart';
import '/screens/chat_screens.dart';
import '/widgets/home_page_widget.dart';
import 'package:curved_drawer_fork/curved_drawer_fork.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'home_screen.dart';
import 'profile_screen.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({Key? key}) : super(key: key);
  static const routeName = '/donate';
  // const HomePage({Key? key}) : super(key: key);
  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  final storage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(context, 'Donate Books'),
      // backgroundColor: MyColors.primaryColor,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: mediaquery.height * 0.3,
                width: mediaquery.width,
                child: Text('To do here: A list of NGOs,local libraries and a way to directly reach to them to donate your books'),
              ),
            ],
          ),
        ),
      ),
      // drawer: MyDrawer(
      //   drawerItems: DrawerIcons.drawerItems,
      // ),
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
      activeIndex: 3,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index) {
        switch (index) {
          case 1:
            {
              Navigator.of(context).pushReplacementNamed(
                UserChatScreen.routeName,
                // arguments: product.id
              );
              break;
            }
          case 2:
            {
              Navigator.of(context).pushReplacementNamed(
                DonatePage.routeName,
                // arguments: product.id
              );
              break;
            }
          case 3:
            {
              Navigator.of(context).pushReplacementNamed(
                ProfilePage.routeName,
                // arguments: product.id
              );
              break;
            }
          default:
            Navigator.of(context).pushReplacementNamed(
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
