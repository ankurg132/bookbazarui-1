// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bookbazar/constants/colors.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class UserChatScreen extends StatelessWidget {
  const UserChatScreen({Key? key}) : super(key: key);
  static const routeName = '/userchatscreen';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.primaryColor,
          title: const Text(
            'Chats',
          ),
          // ignore: prefer_const_constructors
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.white,
            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
              const Tab(
                text: 'All',
              ),
              const Tab(
                text: 'Selling',
              ),
              const Tab(
                text: 'Buying',
              ),
            ],
          ),
        ),
        // backgroundColor: Colors.black87,
        body: TabBarView(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.44),
                  Text(
                    'No Chats',
                    style: const TextStyle(fontSize: 25),
                  ),
                  Icon(
                    Icons.chat_outlined,
                    size: 40,
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.44),
                  Text(
                    'No Chats',
                    style: const TextStyle(fontSize: 25),
                  ),
                  Icon(
                    Icons.chat_outlined,
                    size: 40,
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.44),
                  Text(
                    'No Chats',
                    style: const TextStyle(fontSize: 25),
                  ),
                  Icon(
                    Icons.chat_outlined,
                    size: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: MyColors.primaryColor,
          onPressed: () {},
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
      ),
    );
  }
}
