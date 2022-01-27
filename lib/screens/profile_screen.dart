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

import 'donate_screen.dart';
import 'home_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = '/profilepage';
  // const HomePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
  }

  // String email = "e";
  // String id = "e";
  // String photoUrl = "e";
  // String displayName = "e";
  // void getUser() async {
  //   email = await storage.read(key: "email") ?? "e";
  //   id = await storage.read(key: "id") ?? "e";
  //   photoUrl = await storage.read(key: "photoUrl") ?? "e";
  //   displayName = await storage.read(key: "displayName") ?? "e";
  //   // String? value = await storage.read(key: "displayName");
  // }

  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(context, 'Profile Page'),
      // backgroundColor: MyColors.primaryColor,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: const Icon(
                  Icons.person,
                  size: 20,
                ),
              ),
              Center(
                child: Container(
                  width: mediaquery.width * 0.8,
                  height: mediaquery.height * 0.8,
                  decoration: BoxDecoration(
                    color: MyColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(googleuser.photoUrl),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        googleuser.displayName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        googleuser.email,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
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
      activeIndex: 4,
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
