// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 10,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
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
                    'https://picsum.photos/200',width: 150,height: 250,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '\$122',
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
                      'loremloremloremloremloremloremloremloremloremloremloremloremloremloremlorem',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Spacer(
                    //flex: 2,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text(
                            'lorem lorem ',
                           overflow: TextOverflow.fade,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Row(
              //   children: [
              //     Text(
              //       ' \$ 12',
              //       style: const TextStyle(fontSize: 20),
              //     ),
              //     Spacer(
              //         //flex: 2,
              //         ),
              //     Icon(Icons.shop_2),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
