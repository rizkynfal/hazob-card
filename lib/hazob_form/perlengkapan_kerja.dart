// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hazob_card_app/routes/routes.dart';

class PerlengkapanKerja extends StatefulWidget {
  const PerlengkapanKerja({Key? key}) : super(key: key);

  @override
  State<PerlengkapanKerja> createState() => _PerlengkapanKerjaState();
}

class _PerlengkapanKerjaState extends State<PerlengkapanKerja> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "PERLENGKAPAN KERJA",
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
                "Tidak Tersedia",
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
                "Tidak Benar Pemakaian",
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
                "Tidak Sesuai",
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
                "Tidak Lengkap",
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
                "Rusak",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          children: [
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
                "Tidak Cukup",
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
                "Tidak Berpelindung",
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
                "Pelindung Rusak",
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
