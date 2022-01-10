// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:bookbazar/constants/colors.dart';
import 'package:bookbazar/models/book_model.dart';
import 'package:bookbazar/screens/seller_chat_screen.dart';
import 'package:zoom_widget/zoom_widget.dart';

class BookDetailWidget extends StatelessWidget {
  // const BookDetailWidget({Key? key}) : super(key: key);
  static const routeName = '/bookdetailwidget';

  const BookDetailWidget({Key? key}) : super(key: key);
  // BookModel book;
  // BookDetailWidget({
  //   Key? key,
  //   required this.book,
  // }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final data=Provider.of<Product>(context);
    String title = "dd";
    BookModel book = ModalRoute.of(context)!.settings.arguments as BookModel;
    log('-----book-------------------');
    // log("${book}");
    log('-----book-------------------');
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Detail'),
        backgroundColor: MyColors.primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'search',
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              bookImage(mediaQuery, book),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          book.price,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          book.title,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        heading('Description', mediaQuery),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: mediaQuery.width * 0.8,
                          child: Text(
                            book.description,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        heading('Seller Profile', mediaQuery),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              child: Text(
                                'A',
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                            Text(
                              '  Ankur Gupta',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Add to cart',
                        style: const TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.badge,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).pushNamed(
                  SellerChatPage.routeName,
                  // arguments: product.id
                ),
                child: Container(
                  color: MyColors.primaryColor,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Chat',
                          style: const TextStyle(fontSize: 20),
                        ),
                        // Icon(Icons.chat),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.chat,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }

  Text heading(String title, Size mediaQuery) {
    return Text(
      title,
      style: TextStyle(
          fontSize: mediaQuery.width * 0.05, fontWeight: FontWeight.bold),
    );
  }

  Center bookImage(Size mediaQuery, BookModel book) {
    return Center(
      child: SizedBox(
        width: mediaQuery.width * 0.9,
        height: mediaQuery.height * 0.3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
            book.bookImageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
