// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hazob_card_app/routes/routes.dart';

class Akses extends StatefulWidget {
  const Akses({Key? key}) : super(key: key);

  @override
  State<Akses> createState() => _AksesState();
}

class _AksesState extends State<Akses> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "AKSES",
          style: TextStyle(
              color: mainColor,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato'),
        ),
        const SizedBox(height: 15),
        Row(
          children: <Widget>[
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            const Expanded(
              flex: 1,
              child: Text(
                "Rusak",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            const Expanded(
              flex: 1,
              child: Text(
                "Tidak Aman",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            const Expanded(
              flex: 1,
              child: Text(
                "Terhalang",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            const Expanded(
              flex: 1,
              child: Text(
                "Terbatas",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
