// import 'dart:js';

import 'package:bookbazar/constants/location.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
    required this.mediaquery,
  }) : super(key: key);

  final Size mediaquery;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: mediaquery.height * 0.6,
      width: mediaquery.width * 0.9,
      child: Lottie.asset(
        Assets.loading,
        // width: mediaquery.width * 0.15,
        // height: mediaquery.width * 0.15,
        // width: 200,
        // height: 200,
        fit: BoxFit.fill,
      ),
    ));
  }
}
