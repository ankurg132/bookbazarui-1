// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:bookbazar/constants/location.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class WelComePage extends StatefulWidget {
  const WelComePage({Key? key}) : super(key: key);
  static const routeName = '/welcome';
  @override
  _WelComePageState createState() => _WelComePageState();
}

class _WelComePageState extends State<WelComePage> {
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(width: 200, height: 150, child: FlutterLogo()),
              ),
            ),
            googleAuth(mediaquery, context),
            SizedBox(height: mediaquery.height * 0.1),
            facebookAuth(mediaquery, context),
          ],
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
      width: mediaquery.width * 0.6,
      child: TextButton(
          child: Center(
            child: Row(
              children: [
                Spacer(
                  flex: 2,
                ),
                Lottie.asset(
                  Assets.cart,
                  width: mediaquery.width * 0.2,
                  height: mediaquery.width * 0.2,
                  fit: BoxFit.fill,
                ),
                Spacer(
                  flex: 1,
                ),
                Text('Google',
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
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                ))));
  }
}
