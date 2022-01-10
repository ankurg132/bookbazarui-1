import '/constants/colors.dart';
import '/pages/welcome_page.dart';
import 'package:flutter/material.dart';

AppBar appbar(BuildContext context) {
  return AppBar(
    backgroundColor: MyColors.primaryColor,
    actions: [
      // s,
      IconButton(
        icon: const Icon(Icons.cancel_outlined),
        tooltip: 'logout',
        onPressed: () {
          // Navigator.of(context).pushNamed(
          //   WelComePage.routeName,
          //   // arguments: product.id
          // );
          
        },
      ),
    ],
  );
}
