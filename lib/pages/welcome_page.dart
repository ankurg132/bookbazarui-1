// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bookbazar/constants/colors.dart';
import 'package:bookbazar/screens/home_screen.dart';
import 'package:bookbazar/services/auth/google_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '/constants/location.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class WelComePage extends StatefulWidget {
  const WelComePage({Key? key}) : super(key: key);
  static const routeName = '/welcome';
  @override
  _WelComePageState createState() => _WelComePageState();
}

class _WelComePageState extends State<WelComePage> {
  Auth auth = Auth();
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: linearGradient(),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   title: Text("Welcome"),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child:
                      SizedBox(width: 200, height: 150, child: FlutterLogo()),
                ),
              ),
              Center(
                child: Text(
                  'Sign In',
                  style: const TextStyle(),
                ),
              ),
              googleAuth(mediaquery, context),
              SizedBox(height: mediaquery.height * 0.1),
              // facebookAuth(mediaquery, context),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox facebookAuth(Size mediaquery, BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      width: mediaquery.width * 0.6,
      // color: Colors.blue,
      child: TextButton(
          child: Center(
            child: Row(
              children: [
                Spacer(
                  flex: 2,
                ),
                // FlutterLogo(),
                Lottie.asset(
                  Assets.facebook,
                  width: mediaquery.width * 0.15,
                  height: mediaquery.width * 0.15,
                  // width: 200,
                  // height: 200,
                  fit: BoxFit.fill,
                ),
                Spacer(
                  flex: 1,
                ),
                Text('FaceBook',
                    style: TextStyle(fontSize: mediaquery.width * 0.05)),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
          style: buttonStyle(context),
          onPressed: () {}),
    );
  }

  SizedBox googleAuth(Size mediaquery, BuildContext context) {
    return SizedBox(
      width: mediaquery.width * 0.9,
      child: TextButton(
          child: Center(
            child: Row(
              children: [
                Spacer(
                  flex: 2,
                ),
                Lottie.asset(
                  Assets.google,
                  width: mediaquery.width * 0.2,
                  height: mediaquery.width * 0.2,
                  fit: BoxFit.fill,
                ),
                Spacer(
                  flex: 1,
                ),
                Text('Login Using Google',
                    style: TextStyle(
                      fontSize: mediaquery.width * 0.05,
                      color: Colors.black,
                    )),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
          style: buttonStyle(context),
          onPressed: () async {
            // var _googleSignIn = GoogleSignIn();
            // await auth.handleSignIn();
            var user = await googleSignIn.signIn();
            final storage = FlutterSecureStorage();
            await storage.write(key: "email", value: user!.email);
            await storage.write(key: "id", value: user.id);
            await storage.write(key: "photoUrl", value: user.photoUrl);
            await storage.write(key: "displayName", value: user.displayName);
            String? value = await storage.read(key: "displayName");
            // AwesomeDialog(
            //   context: context, showCloseIcon: true,
            //   dialogType: DialogType.INFO_REVERSED,
            //   animType: AnimType.BOTTOMSLIDE, //awesome_dialog: ^2.1.1
            //   title: user.toString(),
            //   // desc: 'Dialog description here.............',
            //   // btnCancelOnPress: () {},
            //   btnOkText: value,
            //   btnOkColor: Theme.of(context).primaryColor,
            //   btnOkOnPress: () {},
            // ).show();

            if (user == null) {
              AwesomeDialog(
                context: context, showCloseIcon: true,
                dialogType: DialogType.ERROR,
                animType: AnimType.BOTTOMSLIDE, //awesome_dialog: ^2.1.1
                title: "Error",
                // desc: 'Dialog description here.............',
                btnCancelOnPress: () {},
                // btnOkText: 'Login',
                // btnOkColor: Theme.of(context).primaryColor,
                // btnOkOnPress: () {},
              ).show();
            } else {
              // Navigator.of(context).pushReplacementNamed(
              //   HomePage.routeName,
              //   // arguments: product.id
              // );
              AwesomeDialog(
                context: context, showCloseIcon: true,
                dialogType: DialogType.INFO_REVERSED,
                animType: AnimType.BOTTOMSLIDE, //awesome_dialog: ^2.1.1
                title: user.toString(),
                // desc: 'Dialog description here.............',
                // btnCancelOnPress: () {},
                btnOkText: 'Login',
                btnOkColor: Theme.of(context).primaryColor,
                btnOkOnPress: () {},
              ).show();

            }

            // await auth.googleSignIn.signIn();
          }),
    );
  }

  ButtonStyle buttonStyle(BuildContext context) {
    return ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(8)),
        // foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        // foregroundColor: MaterialStateProperty.all<Color>(
        //   Theme.of(context).errorColor,
        // ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          // side: BorderSide(
          //   color: Theme.of(context).primaryColor,
          //   width: 0,
          // )
        )));
  }
}
