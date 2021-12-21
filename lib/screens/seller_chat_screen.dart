// ignore_for_file: unused_field, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:emoji_picker/emoji_picker.dart';
import 'package:bookbazar/constants/colors.dart';
import 'package:flutter/material.dart';

class SellerChatPage extends StatefulWidget {
  static const routeName='/sellerchar';
  @override
  State<SellerChatPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<SellerChatPage> {
  bool showEmoji = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        leadingWidth: 79,
        leading: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon(Icons.arrow_back),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 20,
              ),
            ),
            CircleAvatar(
              radius: 15,
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ankur Gupta",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "last seen at 10:40",
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call),
            tooltip: 'phone call',
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.grey,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(
              children: [
                // OwnMessageCard(),
                // ReplyMessageCard(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        width: MediaQuery.of(context).size.width - 70,
                        child: TextFormField(
                          maxLines: 5,
                          minLines: 1,
                          decoration: InputDecoration(
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      print("satu");

                                      showModalBottomSheet(
                                          context: context,
                                          builder: (builder) => bottomSheet());
                                    },
                                    icon: Icon(
                                      Icons.attach_file,
                                      color: MyColors.primaryColor,
                                      size: 20,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: MyColors.primaryColor,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                              border: InputBorder.none,
                              prefixIcon: InkWell(
                                onTap: () {
                                  showEmoji = !showEmoji;
                                },
                                child: Icon(
                                  Icons.emoji_emotions,
                                  color: MyColors.primaryColor,
                                ),
                              ),
                              hintText: 'Type a message'),
                        )),
                  ),
                  CircleAvatar(
                    backgroundColor: MyColors.primaryColor,
                    child: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }

  Widget bottomSheet() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Card(
          margin: const EdgeInsets.all(10),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.document_scanner,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.image,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.image,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.document_scanner,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.image,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.image,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
  // Widget emojiSelect() {
  //   return EmojiPicker(
  //     rows: 3,
  //     columns: 7,
  //     buttonMode: ButtonMode.MATERIAL,
  //     recommendKeywords: ["racing", "horse"],
  //     numRecommended: 10,
  //     onEmojiSelected: (emoji, category) {
  //       print(emoji);
  //     },
  //   );
  // }
}
