import 'package:bookbazar/pages/welcome_page.dart';

import '/constants/colors.dart';
import 'package:curved_drawer_fork/curved_drawer_fork.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
    required List<DrawerItem> drawerItems,
    // required List<DrawerItem> drawerIcons,
  })  : _drawerItems = drawerItems,
        super(key: key);

  final List<DrawerItem> _drawerItems;

  @override
  Widget build(BuildContext context) {
    return CurvedDrawer(
      color: Colors.white,
      animationCurve: Curves.fastLinearToSlowEaseIn,
      labelColor: MyColors.primaryColor,
      width: 100.0,
      items: _drawerItems,
      onTap: (index) {
        switch (index) {
          case 1:
            Navigator.of(context).pushNamed(
              WelComePage.routeName,
              // arguments: product.id
            );

            break;
          default:
        }
      },
    );
  }
}
