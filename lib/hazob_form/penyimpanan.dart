// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hazob_card_app/routes/routes.dart';

class Penyimpanan extends StatefulWidget {
  const Penyimpanan({Key? key}) : super(key: key);

  @override
  State<Penyimpanan> createState() => _PenyimpananState();
}

class _PenyimpananState extends State<Penyimpanan> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "PENYIMPANAN",
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
              flex: 2,
              child: Text(
                "Tidak Ada Label / Register",
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
              flex: 2,
              child: Text(
                "Tidak Tersusun Rapih",
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
              flex: 2,
              child: Text(
                "Rak Tidak Aman",
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
              flex: 2,
              child: Text(
                "Tidak ada Akses",
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
