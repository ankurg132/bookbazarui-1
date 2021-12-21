// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bookbazar/constants/colors.dart';
import 'package:flutter/material.dart';

class BookSellingFormScreen extends StatelessWidget {
  const BookSellingFormScreen({Key? key}) : super(key: key);
  static const routeName = '/booksellingformscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: const Text('Fill your details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                //autovalidateMode: AutovalidateMode.always,
                //autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'title',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.primaryColor)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide:
                        BorderSide(color: MyColors.primaryColor, width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Discription',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                //autovalidateMode: AutovalidateMode.always,
                //autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'discription',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.primaryColor)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide:
                        BorderSide(color: MyColors.primaryColor, width: 2),
                  ),
                ),
                maxLines: 5,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: TextFormField(
                          //autovalidateMode: AutovalidateMode.always,
                          //autocorrect: true,
                          decoration: InputDecoration(
                            hintText: 'price',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: MyColors.primaryColor)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: MyColors.primaryColor, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Location',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: TextFormField(
                          //autovalidateMode: AutovalidateMode.always,
                          //autocorrect: true,
                          decoration: InputDecoration(
                            hintText: 'Location',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: MyColors.primaryColor)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: MyColors.primaryColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Center(
                child: Container(
                  // width: double.infinity,
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 50,
                  child: TextButton(
                      child:
                          Text('Submit', style: const TextStyle(fontSize: 16)),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(8)),
                          // foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).errorColor,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(width: 3,
                                        color: MyColors.primaryColor,
                                      )))),
                      onPressed: () {}),
                ),
              )
            ],
          ),
        ),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}
