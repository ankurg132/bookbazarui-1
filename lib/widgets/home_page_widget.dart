// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bookbazar/constants/colors.dart';
import 'package:bookbazar/models/book_model.dart';
import 'package:bookbazar/widgets/book_detail_widget.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BookModel model = BookModel(
        title: 'Success',
        id: "123",
        description: "nice book ",
        subtitle: "ossum",
        author: "ankurGupta",
        bookImageUrl: "https://picsum.photos/200",
        price: "123",
        address: "Bhopal");
    var mediaQuery = MediaQuery.of(context).size;
    return Card(
      elevation: 10,
      child: InkWell(
        splashColor: MyColors.primaryColor,
        onTap: () => Navigator.of(context).pushNamed(
          BookDetailWidget.routeName,
        ),
        // arguments: product.id

        child: Container(
          height: mediaQuery.height * 0.3,
          decoration: BoxDecoration(
              border: Border.all(width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      model.bookImageUrl,
                      width: mediaQuery.width * 0.3,
                      height: mediaQuery.width * 0.3,
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.3,
                  width: mediaQuery.width * 0.4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            model.price,
                            style: const TextStyle(fontSize: 20),
                          ),
                          Spacer(
                              //flex: 2,
                              ),
                          Icon(Icons.shopping_basket)
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        model.description,
                        style: const TextStyle(fontSize: 15),
                      ),
                      Spacer(
                          //flex: 2,
                          ),
                      SizedBox(
                        width: mediaQuery.width * 0.35,
                        child: Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            Text(
                              model.address,
                              overflow: TextOverflow.fade,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
