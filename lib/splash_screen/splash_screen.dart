import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hazob_card_app/hazob_form/hazob_page.dart';
import 'package:hazob_card_app/routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _SplashScreen(),
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Lato'),
    );
  }
}

class _SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<_SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadSplashScreen();
  }

  _loadSplashScreen() {
    var duration = const Duration(seconds: 2);
    return Timer(duration, navigationToLogin);
  }

  void navigationToLogin() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const HazobPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/img/LogoTatelyNV.png',
                        width: 310,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "HAZOB CARD",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: fontMainColor,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "SAFETY YES!!\nACCIDENT NO!",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: fontMainColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                  children: <Widget>[
                    Container(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "1.0.0",
                          style: TextStyle(
                            color: fontMainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
