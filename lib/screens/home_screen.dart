// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks, prefer_final_fields, prefer_typing_uninitialized_variables, must_be_immutable, unused_local_variable

// import 'dart:convert';
import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bookbazar/pages/login_page.dart';
import 'package:bookbazar/provider/book_provider.dart';
import 'package:bookbazar/services/auth/google_auth.dart';
import 'package:curved_drawer_fork/curved_drawer_fork.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

// import 'package:bookbazar/constants/location.dart';
import 'package:bookbazar/widgets/loding.dart';

import '/constants/colors.dart';
import '/models/appbar.dart';
import '/models/book_model.dart';
import '/models/drawer.dart';
import '/network_crud_operation.dart';
// import '/pages/loading_page.dart';
import '/pages/welcome_page.dart';
import '/screens/book_selling_form_screen.dart';
import '/screens/cart_screen.dart';
import '/screens/chat_screens.dart';
import '/widgets/home_page_widget.dart';

import 'donate_screen.dart';
import 'profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/homepage';
  // const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final storage = FlutterSecureStorage();
  NetworkHandler networkHandler = NetworkHandler();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var dd = Provider.of<BookProvider>(context).loadBooks();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Bazar"),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: linearGradient()),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<BookProvider>(
                builder: (context, snapshot, child) {
                 
                  return AllBooksDetails(
                    mediaquery: mediaquery,
                    books: snapshot.book,
                  );
                },
              ),
              // FutureBuilder(
              //   future: networkHandler.get("/book/getbooks"),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return AllBooksDetails(
              //         mediaquery: mediaquery,
              //         books: snapshot.data,
              //       );
              //     } else if (snapshot.hasError) {
              //       return Text("${snapshot.error}");
              //     }
              //     return Loading(mediaquery: mediaquery);
              //   },
              // ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer2(),
      floatingActionButton: floatingactionbutton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: navbar(context),
    );
  }

  AnimatedBottomNavigationBar navbar(BuildContext context) {
    return AnimatedBottomNavigationBar(
      backgroundColor: Color.fromRGBO(147, 97, 255, 1),
      icons: NavIcons.iconList,
      activeIndex: 1,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index) {
        switch (index) {
          case 1:
            {
              Navigator.of(context).pushReplacementNamed(
                UserChatScreen.routeName,
                // arguments: product.id
              );
              break;
            }
          case 2:
            {
              Navigator.of(context).pushReplacementNamed(
                DonatePage.routeName,
                // arguments: product.id
              );
              break;
            }
          case 3:
            {
              Navigator.of(context).pushReplacementNamed(
                ProfilePage.routeName,
                // arguments: product.id
              );
              break;
            }
          default:
            Navigator.of(context).pushReplacementNamed(
              HomePage.routeName,
              // arguments: product.id
            );
            break;
        }
      },
      //other params
    );
  }

  FloatingActionButton floatingactionbutton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Color.fromRGBO(114, 102, 255, 1),
      onPressed: () {
        Navigator.of(context).pushNamed(
          BookSellingFormScreen.routeName,
          // arguments: product.id
        );
      },
      //params
    );
  }

  void logout() async {
    await storage.delete(key: "token");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => WelComePage()),
        (route) => false);
  }
}

class AllBooksDetails extends StatelessWidget {
  final Size mediaquery;

  var books;
  AllBooksDetails({
    Key? key,
    required this.mediaquery,
    required this.books,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('-----books.length-------------------');
    log("${books.length}");
    log('-----books.length-------------------');
    return Center(
        child: SizedBox(
      height: mediaquery.height * 0.83,
      width: mediaquery.width * 0.95,
      child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: books.length,
          itemBuilder: (ctx, index) => HomePageWidget(
                model: books[index],
              )),
    ));
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.badge_sharp),
      tooltip: 'search',
      onPressed: () {
        Navigator.of(context).pushNamed(
          MyCart.routeName,
          // arguments: product.id
        );
      },
    );
  }
}
