// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'dart:developer';

// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:bookbazar/constants/colors.dart';
// import 'package:bookbazar/models/appbar.dart';
// import 'package:bookbazar/models/book_model.dart';
// import 'package:bookbazar/models/drawer.dart';
// import 'package:bookbazar/network_crud_operation.dart';
// import 'package:bookbazar/pages/loading_page.dart';
// import 'package:bookbazar/pages/welcome_page.dart';
// import 'package:bookbazar/screens/book_selling_form_screen.dart';
// import 'package:bookbazar/screens/cart_screen.dart';
// import 'package:bookbazar/screens/chat_screens.dart';
// import 'package:bookbazar/widgets/home_page_widget.dart';
// import 'package:curved_drawer_fork/curved_drawer_fork.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:provider/provider.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//   static const routeName = '/homepage';
//   // const HomePage({Key? key}) : super(key: key);
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final storage = FlutterSecureStorage();
//   NetworkHandler networkHandler = NetworkHandler();
//   // var books;
//   late List<BookModel> books = [
//     BookModel(
//         title: 'title',
//         id: 'id',
//         description: 'description',
//         subtitle: 'subtitle',
//         author: 'author',
//         bookImageUrl: "https://picsum.photos/200/300",
//         price: 'price',
//         address: 'address'),
//     BookModel(
//         title: 'title',
//         id: 'id',
//         description: 'description',
//         subtitle: 'subtitle',
//         author: 'author',
//         bookImageUrl: "https://picsum.photos/200/300",
//         price: 'price',
//         address: 'address'),
//   ];
//   @override
//   void initState() {
//     super.initState();
//     networkHandler.get("/book/getbooks");
//     loadBooks().then((value) {
//       books = Provider.of<NetworkHandler>(context,listen: false).bookmodel;

//       setState(() {});
//     });
//   }

//   // late  books;

//   Future<void> loadBooks() async {
//     await networkHandler.get("/book/getbooks");
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     var mediaquery = MediaQuery.of(context).size;
//     log("------------------");
//     log(books.length.toString());
//     log("------------------");
//     return Scaffold(
//       appBar: appbar(context),
//       // backgroundColor: MyColors.primaryColor,
//       backgroundColor: Colors.grey,
//       body: RefreshIndicator(
//         onRefresh: () {
//           return Future.delayed(Duration(seconds: 1), () {
//             networkHandler.get("/book/getbooks");
//             setState(() {});
//           });
//         },
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Center(
//                     child: SizedBox(
//                   height: mediaquery.height * 0.83,
//                   width: mediaquery.width * 0.95,
//                   child: ListView.builder(
//                       physics: ClampingScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: books.length,
//                       // itemCount: 0,
//                       itemBuilder: (ctx, index) => HomePageWidget(
//                             model: books[index],
//                           )),
//                 )),
//               ],
//             ),
//           ),
//         ),
//       ),
//       drawer: MyDrawer(
//         drawerItems: DrawerIcons.drawerItems,
//       ),
//       floatingActionButton: floatingactionbutton(context),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: navbar(context),
//       // floatingActionButton: FloatingActionButton(onPressed: (){},),
//     );
//   }

//   AnimatedBottomNavigationBar navbar(BuildContext context) {
//     return AnimatedBottomNavigationBar(
//       backgroundColor: MyColors.primaryColor,
//       icons: NavIcons.iconList,
//       activeIndex: 1,
//       gapLocation: GapLocation.center,
//       notchSmoothness: NotchSmoothness.softEdge,
//       leftCornerRadius: 32,
//       rightCornerRadius: 32,
//       onTap: (index) {
//         switch (index) {
//           case 1:
//             Navigator.of(context).pushNamed(
//               UserChatScreen.routeName,
//               // arguments: product.id
//             );
//             break;
//           default:
//             Navigator.of(context).pushNamed(
//               HomePage.routeName,
//               // arguments: product.id
//             );
//         }
//       },
//       //other params
//     );
//   }

//   FloatingActionButton floatingactionbutton(BuildContext context) {
//     return FloatingActionButton(
//       child: Icon(Icons.add),
//       backgroundColor: MyColors.primaryColor,
//       onPressed: () {
//         Navigator.of(context).pushNamed(
//           BookSellingFormScreen.routeName,
//           // arguments: product.id
//         );
//       },
//       //params
//     );
//   }

//   void logout() async {
//     await storage.delete(key: "token");
//     Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (context) => WelComePage()),
//         (route) => false);
//   }
// }

// class SearchButton extends StatelessWidget {
//   const SearchButton({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.badge_sharp),
//       tooltip: 'search',
//       onPressed: () {
//         Navigator.of(context).pushNamed(
//           MyCart.routeName,
//           // arguments: product.id
//         );
//       },
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bookbazar/constants/location.dart';
import 'package:bookbazar/widgets/loding.dart';
import 'package:curved_drawer_fork/curved_drawer_fork.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '/constants/colors.dart';
import '/models/appbar.dart';
import '/models/book_model.dart';
import '/models/drawer.dart';
import '/network_crud_operation.dart';
import '/pages/loading_page.dart';
import '/pages/welcome_page.dart';
import '/screens/book_selling_form_screen.dart';
import '/screens/cart_screen.dart';
import '/screens/chat_screens.dart';
import '/widgets/home_page_widget.dart';

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
  // var books;
  late List<BookModel> books = [
    // BookModel(
    //     title: 'title',
    //     id: 'id',
    //     description: 'description',
    //     subtitle: 'subtitle',
    //     author: 'author',
    //     bookImageUrl: "https://picsum.photos/200/300",
    //     price: 'price',
    //     address: 'address'),
  ];
  @override
  void initState() {
    super.initState();
     
  }

  

  Future<void> loadBooks() async {
    var data1 = await networkHandler.get("/book/getbooks");
    
    final data = await json.decode(data1) as Map<String, dynamic>;
    log(data.toString());
    await data["data"].forEach((books1) {
      books.add(jsontoModelConverter(books1));
    });
    log('-------------------------');
    log(books.length.toString());
    log('-------------------------');
  }

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    log("------------------");
    log(books.length.toString());
    log("------------------");
    return Scaffold(
      appBar: appbar(context),
      // backgroundColor: MyColors.primaryColor,
      backgroundColor: Colors.grey,
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 1), () {
            networkHandler.get("/book/getbooks");
            setState(() {});
          });
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Futurebuilder(
                    networkHandler: networkHandler, mediaquery: mediaquery),
              ],
            ),
          ),
        ),
      ),
      drawer: MyDrawer(
        drawerItems: DrawerIcons.drawerItems,
      ),
      floatingActionButton: floatingactionbutton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: navbar(context),
    );
  }

  AnimatedBottomNavigationBar navbar(BuildContext context) {
    return AnimatedBottomNavigationBar(
      backgroundColor: MyColors.primaryColor,
      icons: NavIcons.iconList,
      activeIndex: 1,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index) {
        switch (index) {
          case 1:
            Navigator.of(context).pushNamed(
              UserChatScreen.routeName,
              // arguments: product.id
            );
            break;
          default:
            Navigator.of(context).pushNamed(
              HomePage.routeName,
              // arguments: product.id
            );
        }
      },
      //other params
    );
  }

  FloatingActionButton floatingactionbutton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: MyColors.primaryColor,
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

class Futurebuilder extends StatelessWidget {
  const Futurebuilder({
    Key? key,
    required this.networkHandler,
    required this.mediaquery,
  }) : super(key: key);

  final NetworkHandler networkHandler;
  final Size mediaquery;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: networkHandler.get("/book/getbooks"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AllBooksDetails(mediaquery: mediaquery);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Loading(mediaquery: mediaquery);
        },
      ),
    );
  }
}

class AllBooksDetails extends StatelessWidget {
  final Size mediaquery;
  List<BookModel> books = [];
  AllBooksDetails({
    Key? key,
    required this.mediaquery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    books = Provider.of<NetworkHandler>(context).bookmodels;
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
          // itemCount: 0,
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
