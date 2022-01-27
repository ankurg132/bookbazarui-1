// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unrelated_type_equality_checks

import 'package:bookbazar/pages/login_page.dart';
import 'package:bookbazar/services/auth/google_auth.dart';

import '/constants/colors.dart';
import '/pages/welcome_page.dart';
import 'package:flutter/material.dart';

AppBar appbar(BuildContext context, String title) {
  return AppBar(
    // centerTitle: true,
    title: const Text("Book Bazar"),
    flexibleSpace: Container(
      decoration: BoxDecoration(gradient: linearGradient()),
    ),
    // actions: [
    //   // s,
    //   IconButton(
    //     onPressed: () {},
    //     icon: const Icon(
    //       Icons.search,
    //       size: 20,
    //       color: Colors.white,
    //     ),
    //   ),
    //   googleuser == ""
    //       ? IconButton(
    //           icon: const Icon(Icons.login_outlined),
    //           tooltip: 'Login',
    //           onPressed: () {
    //             // Navigator.of(context).pushReplacementNamed(
    //             Navigator.of(context).pushNamed(
    //               LoginPage.routeName,
    //               // arguments: product.id
    //             );
    //           },
    //         )
    //       : IconButton(
    //           icon: const Icon(Icons.power_settings_new_rounded),
    //           tooltip: 'logout',
    //           onPressed: () async {
    //             await GoogleSignInApi.signout();
    //             googleuser.email = "";
    //             googleuser.photoUrl = "";
    //             googleuser.id = "";
    //             googleuser.displayName = "";
    //           },
    //         ),
    //   googleuser == ""
    //       ? IconButton(
    //           icon: const Icon(Icons.cancel_outlined),
    //           tooltip: 'Sinup',
    //           onPressed: () {
    //             // Navigator.of(context).pushReplacementNamed(
    //             Navigator.of(context).pushNamed(
    //               WelComePage.routeName,
    //               // arguments: product.id
    //             );
    //           },
    //         )
    //       : Text(
    //           '',
    //         ),
    // ],


  );
}
