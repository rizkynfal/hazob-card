import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hazob_card_app/hazob_form/hazob_page.dart';
import 'package:hazob_card_app/routes/routes.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
                        'assets/img/logoHazob.png',
                        width: 210,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "SAFETY YES!!\nACCIDENT NO!",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: fontMainColor,
                          fontSize: 20,
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
                    FutureBuilder<PackageInfo>(
                      future: PackageInfo.fromPlatform(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Version: ${snapshot.data!.version}',
                                style: TextStyle(
                                  color: fontMainColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const Text("Null");
                        }
                      },
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
