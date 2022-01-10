// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bookbazar/constants/colors.dart';
import 'package:bookbazar/widgets/book_detail_widget.dart';
import 'package:bookbazar/widgets/home_page_widget.dart';
import 'package:flutter/material.dart';

class MyCart extends StatelessWidget {
  MyCart({Key? key}) : super(key: key);
  static const routeName = '/mycart';
  int itemLenght = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: const Text('My Cart'),
      ),
      // ignore: prefer_const_constructors
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // ignore: prefer_const_constructors
        child: itemLenght > 0
            ? CircularProgressIndicator()
            : Center(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.44),
                    Text(
                      'No Item In your cart',
                      style: const TextStyle(fontSize: 25),
                    ),
                    Icon(
                      Icons.shop_2_outlined,
                      size: 40,
                    ),
                  ],
                ),
              ),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}
