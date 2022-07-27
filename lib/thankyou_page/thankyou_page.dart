import 'package:flutter/material.dart';
import 'package:hazob_card_app/hazob_form/hazob_page.dart';
import 'package:hazob_card_app/routes/routes.dart';

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
                  ),
                ),
                ElevatedButton(
                  child: Text('es'),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const HazobPage(),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
