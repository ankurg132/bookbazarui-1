// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bookbazar/constants/colors.dart';
import 'package:bookbazar/widgets/home_page_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  // const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final iconList = <IconData>[Icons.home, Icons.chat, Icons.location_off,Icons.person];
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        // title: Row(
        //   children: [
        //     TextFormField(
        //       //autovalidateMode: AutovalidateMode.always,
        //       //autocorrect: true,

        //     ),
        //   ],
        // ),
        actions: [
          IconButton(
            icon: const Icon(Icons.badge_sharp),
            tooltip: 'search',
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  // HomePageWidget(),
                  // HomePageWidget(),
                  // HomePageWidget(),
                  // HomePageWidget(),
                  // HomePageWidget(),
                  // HomePageWidget(),
                  HomePageWidget(),
                  HomePageWidget(),
                  HomePageWidget(),
                  HomePageWidget(),
                  HomePageWidget(),
                  HomePageWidget(),
                  HomePageWidget(),
                  HomePageWidget(),
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
        onPressed: () {},
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: MyColors.primaryColor,
        icons: iconList,
        activeIndex: 1,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}
