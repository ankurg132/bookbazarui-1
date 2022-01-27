// ignore_for_file: prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bookbazar/constants/location.dart';
import 'package:bookbazar/models/appbar.dart';
import 'package:bookbazar/screens/home_screen.dart';
import 'package:bookbazar/services/auth/google_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../network_crud_operation.dart';
import 'welcome_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/loginpage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  NetworkHandler networkhandler = NetworkHandler();
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(context, "BookBazer"),
      body: SizedBox(
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
                  Text('Login with Google',
                      style: TextStyle(
                        fontSize: mediaquery.width * 0.05,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
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
              var response = await networkhandler.googleAuthPost(
                  "/user/login", googleuser);
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
                  btnOkOnPress: () {},
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
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}
