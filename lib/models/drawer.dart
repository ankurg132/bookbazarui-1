// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bookbazar/pages/login_page.dart';
import 'package:bookbazar/pages/welcome_page.dart';
import 'package:bookbazar/services/auth/google_auth.dart';

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

class MyDrawer2 extends StatefulWidget {
  // static const routeName = '/Drawer2';

  @override
  _MyDrawer2State createState() => _MyDrawer2State();
}

class _MyDrawer2State extends State<MyDrawer2> {
  @override
  Widget build(BuildContext context) {
    //  var  TextStyle = const  TextStyle(color: Colors.black, fontSize: 15);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: MyColors.primaryColor,
            ),
            child: Row(
              children: [],
            ),
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    LoginPage.routeName,
                    // arguments: product.id
                  );
                },
                child: ListTile(
                  leading: const Icon(
                    Icons.login_rounded,
                    color: MyColors.primaryColor,
                  ),
                  title: Text(
                    'Login',
                    // style: const  TextStyle,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    WelComePage.routeName,
                    // arguments: product.id
                  );
                },
                child: ListTile(
                  leading: const Icon(
                    Icons.signal_cellular_no_sim,
                    color: MyColors.primaryColor,
                  ),
                  title: Text(
                    'Sinup',
                    // style: const  TextStyle,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  AwesomeDialog(
                    context: context, showCloseIcon: true,
                    dialogType: DialogType.QUESTION,
                    animType: AnimType.LEFTSLIDE, //awesome_dialog: ^2.1.1
                    title: 'Want to Logout?',
                    // desc: 'Dialog description here.............',
                    btnCancelOnPress: () {},
                    btnOkText: 'OK',
                    btnOkColor: Theme.of(context).primaryColor,
                    btnOkOnPress: () async {
                      await GoogleSignInApi.signout();
                    },
                  ).show();
                },
                child: ListTile(
                  leading: const Icon(
                    Icons.power_settings_new_rounded,
                    color: Colors.red,
                  ),
                  title: Text(
                    'Logout',
                    // style: const  TextStyle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
