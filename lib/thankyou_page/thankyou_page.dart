import 'package:flutter/material.dart';
import 'package:hazob_card_app/hazob_form/hazob_page.dart';
import 'package:hazob_card_app/routes/routes.dart';
import 'dart:io';

class ThankYou extends StatelessWidget {
  const ThankYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: InkWell(
        child: Stack(
          alignment: AlignmentDirectional.center,
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
                      Container(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Image.asset(
                          'assets/img/logoHazob.png',
                          width: 200,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        "SAFETY YES!!\nACCIDENT NO!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: fontMainColor,
                          fontSize: 23,
                        ),
                      ),
                      const SizedBox(height: 80),
                      Text(
                        "Terima Kasih\nData Telah Terkirim",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: fontMainColor,
                          fontSize: 23,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size(200, 50)),
                      ),
                      child: const Text('Back'),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const HazobPage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size(200, 50)),
                        ),
                        onPressed: () => exit(0),
                        child: const Text('Exit Aplikasi'))
                  ],
                ),
                const SizedBox(height: 50)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
