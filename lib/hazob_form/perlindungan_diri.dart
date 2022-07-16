import 'package:flutter/material.dart';

import '../routes/routes.dart';

class PerlindunganDiri extends StatefulWidget {
  const PerlindunganDiri({Key? key}) : super(key: key);

  @override
  State<PerlindunganDiri> createState() => _PerlindunganDiriState();
}

class _PerlindunganDiriState extends State<PerlindunganDiri> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "PERLENGKAPAN PERLINDUNGAN DIRI",
          textAlign: TextAlign.left,
          style: TextStyle(
              color: mainColor,
              fontSize: 13,
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold),
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
              flex: 2,
              child: Text(
                "Tidak Lengkap",
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
                "Tidak Dipakai",
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
                "Tidak Cukup",
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
