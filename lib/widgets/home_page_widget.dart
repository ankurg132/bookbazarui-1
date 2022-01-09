// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:bookbazar/constants/colors.dart';
// import 'package:bookbazar/models/book_model.dart';
// import 'package:bookbazar/widgets/book_detail_widget.dart';
// import 'package:flutter/material.dart';

// class HomePageWidget extends StatelessWidget {
//   const HomePageWidget({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     BookModel model = BookModel(
//         // title: 'Success',
//         id: "123",
//         // description:
//         //     "Description of Book Lorem epsum Description of Book Lorem epsum Description of Book Lorem epsum Description of Book Lorem epsum  ",
//         // subtitle: "subtitle",
//         // author: "ankurGupta",
//         // bookImageUrl: "https://picsum.photos/200",
//         // price: "\$123",
//         // address: "Bhopal"
//         );
//     var mediaQuery = MediaQuery.of(context).size;
//     // var mediaquery;
//     return InkWell(
//       splashColor: MyColors.primaryColor,
//       onTap: () => Navigator.of(context).pushNamed(
//         BookDetailWidget.routeName,
//       ),
//       // arguments: product.id

//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           height: mediaQuery.height * 0.21,
//           decoration: BoxDecoration(
//             // color: MyColors.primaryColor,
//              color:  Colors.white,
//               border: Border.all(width: 2, style: BorderStyle.solid),
//               borderRadius: BorderRadius.circular(10)),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 bookImage(mediaQuery, model),
//                 bookDetails(mediaQuery, model),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   SizedBox bookDetails(Size mediaQuery, BookModel model) {
//     return SizedBox(
//                 height: mediaQuery.height * 0.3,
//                 width: mediaQuery.width * 0.4,
//                 child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           model.title,
//                           style: const TextStyle(fontSize: 20),
//                         ),
//                         Spacer(),
//                         Icon(Icons.shopping_basket)
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       model.description,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(fontSize: 10),
//                     ),
//                     Spacer(),
//                     SizedBox(
//                       width: mediaQuery.width * 0.35,
//                       child: Row(
//                         children: [
//                           Icon(Icons.location_on_outlined),
//                           Text(
//                             model.address,
//                             overflow: TextOverflow.fade,
//                             style: const TextStyle(fontSize: 12),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//   }

//   SizedBox bookImage(Size mediaQuery, BookModel model) {
//     return SizedBox(
//                 width: mediaQuery.width * 0.4,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(30),
//                   child: Image.network(
//                     model.bookImageUrl,
//                     fit: BoxFit.cover,
//                     // width: mediaQuery.width * 0.3,
//                     // height: mediaQuery.width * 0.3,
//                   ),
//                 ),
//               );
//   }
// }
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
      description:
          "Description of Book Lorem epsum Description of Book Lorem epsum Description of Book Lorem epsum Description of Book Lorem epsum  ",
      subtitle: "subtitle",
      author: "ankurGupta",
      bookImageUrl: "https://picsum.photos/200",
      price: "\$123",
      address: "Bhopal"
    );
    var mediaQuery = MediaQuery.of(context).size;
    // var mediaquery;
    return InkWell(
      splashColor: MyColors.primaryColor,
      onTap: () => Navigator.of(context).pushNamed(
        BookDetailWidget.routeName,
      ),
      // arguments: product.id

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: mediaQuery.height * 0.21,
          decoration: BoxDecoration(
              // color: MyColors.primaryColor,
              color: Colors.white,
              border: Border.all(width: 2, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bookImage(mediaQuery, model),
                bookDetails(mediaQuery, model),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox bookDetails(Size mediaQuery, BookModel model) {
    return SizedBox(
      height: mediaQuery.height * 0.3,
      width: mediaQuery.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "model.title",
                style: const TextStyle(fontSize: 20),
              ),
              Spacer(),
              Icon(Icons.shopping_basket)
            ],
          ),
          SizedBox(height: 10),
          Text(
            "model.description",
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 10),
          ),
          Spacer(),
          SizedBox(
            width: mediaQuery.width * 0.35,
            child: Row(
              children: [
                Icon(Icons.location_on_outlined),
                Text(
                  "model.address",
                  overflow: TextOverflow.fade,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox bookImage(Size mediaQuery, BookModel model) {
    return SizedBox(
      width: mediaQuery.width * 0.4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          "https://picsum.photos/200/300",
          fit: BoxFit.cover,
          // width: mediaQuery.width * 0.3,
          // height: mediaQuery.width * 0.3,
        ),
      ),
    );
  }
}
