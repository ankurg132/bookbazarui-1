// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bookbazar/constants/colors.dart';
import 'package:bookbazar/models/user_model.dart';
import 'package:bookbazar/network_crud_operation.dart';
import 'package:bookbazar/pages/login_page.dart';
import 'package:bookbazar/provider/users.dart';
import 'package:bookbazar/screens/home_screen.dart';
import 'package:bookbazar/services/auth/google_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '/constants/location.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

GoogleUser googleuser =
    GoogleUser(displayName: "", email: "", id: "", photoUrl: "");

class WelComePage extends StatefulWidget {
  const WelComePage({Key? key}) : super(key: key);
  static const routeName = '/welcome';
  @override
  _WelComePageState createState() => _WelComePageState();
}

class _WelComePageState extends State<WelComePage> {
  // Auth auth = Auth();
  NetworkHandler networkHandler = NetworkHandler();
  Future googleSignIn() async {
    final user = await GoogleSignInApi.login();
    log("gauth: $user");
    await user!.authentication.then((googleKey) async {
      log('-----title-------------------');
      // log("${title}");
      log("gauth: ${googleKey.accessToken}");
      // var response = await networkHandler.googleAuthPost(
      //     "/auth/google", googleKey.accessToken.toString());
      log('-----title-------------------');

      log('-----title-------------------');
      if (200 == 200) {
        AwesomeDialog(
          context: context, showCloseIcon: true,
          dialogType: DialogType.SUCCES,
          animType: AnimType.BOTTOMSLIDE, //awesome_dialog: ^2.1.1
          title: "Success",
          // desc: 'Dialog description here.............',
          // btnCancelOnPress: () {},
          // btnOkText: 'Login',
        ).show();
        Navigator.of(context).pushNamed(
          HomePage.routeName,
          // arguments: product.id
        );
      }

      log('-----title-------------------');
      log("gauth: ${googleKey.idToken}");
    }).onError((error, stackTrace) {
      AwesomeDialog(
        context: context, showCloseIcon: true,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE, //awesome_dialog: ^2.1.1
        title: error.toString(),
        // desc: 'Dialog description here.............',
        btnCancelOnPress: () {},
      ).show();
    });
  }

  bool isLoading = false;
  NetworkHandler networkhandler = NetworkHandler();
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: linearGradient(),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Center(
                        child: SizedBox(
                            width: 200, height: 150, child: FlutterLogo()),
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
      width: mediaquery.width * 0.6,
      child: TextButton(
          child: Center(
            child: Row(
              children: [
                Spacer(
                  flex: 2,
                ),
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
          onPressed: () async {
            // await networkhandler.post("/auth/register");
          }),
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
                Text('Sinup with Google',
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
            // await googleSignIn();
            final user = await GoogleSignInApi.login();

            // final storage = FlutterSecureStorage();
            googleuser.displayName = user!.displayName!;
            googleuser.email = user.email;
            googleuser.id = user.id;
            googleuser.photoUrl = user.photoUrl!;
            setState(() {
              isLoading = true;
            });
            var response = await networkHandler.googleAuthPost(
                "/user/register", googleuser);
            setState(() {
              isLoading = false;
            });
            if (response.statusCode == 200) {
              AwesomeDialog(
                context: context, showCloseIcon: true,
                dialogType: DialogType.SUCCES,
                animType: AnimType.BOTTOMSLIDE, //awesome_dialog: ^2.1.1
                title: user.toString(),
                // desc: 'Dialog description here.............',
                btnCancelOnPress: () async {
                  await GoogleSignInApi.signout();
                },
                btnOkText: 'Goto Home Page',
                btnOkColor: Theme.of(context).primaryColor,
                btnOkOnPress: () {
                  Navigator.of(context).pushNamed(
                    HomePage.routeName,
                    // arguments: product.id
                  );
                },
              ).show();
            } else {
              AwesomeDialog(
                context: context, showCloseIcon: true,
                dialogType: DialogType.ERROR,
                animType: AnimType.BOTTOMSLIDE, //awesome_dialog: ^2.1.1
                title: response.body.toString(),
                // desc: 'Dialog description here.............',
                // btnCancelOnPress: () async {
                //   // await GoogleSignInApi.signout();
                // },
                btnOkText: 'ok',
                // btnOkColor: Theme.of(context).primaryColor,
                btnOkOnPress: () {
                  Navigator.of(context).pushNamed(
                    LoginPage.routeName,
                    // arguments: product.id
                  );
                },
              ).show();
            }
            // if (user == null) {
            //   AwesomeDialog(
            //     context: context, showCloseIcon: true,
            //     dialogType: DialogType.ERROR,
            //     animType: AnimType.BOTTOMSLIDE, //awesome_dialog: ^2.1.1
            //     title: "Error",
            //     // desc: 'Dialog description here.............',
            //     btnCancelOnPress: () {},
            //     // btnOkText: 'Login',
            //     // btnOkColor: Theme.of(context).primaryColor,
            //     // btnOkOnPress: () {},
            //   ).show();
            // } else {
            //   // Navigator.of(context).pushReplacementNamed(
            //   //   HomePage.routeName,
            //   //   // arguments: product.id
            //   // );
          }

          // await auth.googleSignIn.signIn();
          ),
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
