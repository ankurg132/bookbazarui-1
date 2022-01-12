// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import '/constants/colors.dart';
import '/pages/welcome_page.dart';
import 'package:flutter/material.dart';

AppBar appbar(BuildContext context, String title) {
  return
      // AppBar(
      //   title: Text(title),

      //   // backgroundColor: MyColors.primaryColor,
      //   backgroundColor: MyColors.primaryColor,
      //   actions: [
      //     // s,
      //     IconButton(
      //       icon: const Icon(Icons.cancel_outlined),
      //       tooltip: 'logout',
      //       onPressed: () {
      //         // Navigator.of(context).pushReplacementNamed(
      //         Navigator.of(context).pushNamed(
      //           WelComePage.routeName,
      //           // arguments: product.id
      //         );

      //       },
      //     ),
      //   ],
      // );
      AppBar(
    // centerTitle: true,
    title: const Text("Book Bazar"),
    flexibleSpace: Container(
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(gradient: linearGradient()),
    ),
    actions: [
      // s,
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search,
          size: 20,
          color: Colors.white,
        ),
      ),
      IconButton(
        icon: const Icon(Icons.cancel_outlined),
        tooltip: 'logout',
        onPressed: () {
          // Navigator.of(context).pushReplacementNamed(
          Navigator.of(context).pushNamed(
            WelComePage.routeName,
            // arguments: product.id
          );
        },
      ),
    ],
  );
}
