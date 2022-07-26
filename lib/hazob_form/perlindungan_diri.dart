// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

import '../routes/routes.dart';

List<String> perlindunganDiriList = [];

class PerlindunganDiri extends StatefulWidget {
  const PerlindunganDiri({Key? key}) : super(key: key);

  @override
  State<PerlindunganDiri> createState() => _PerlindunganDiriState();
}

class _PerlindunganDiriState extends State<PerlindunganDiri> {
  late bool tidakTersedia;
  late bool tidakLengkap;
  late bool tidakDipakai;
  late bool tidakCukup;
  late bool tidakSesuai;
  late bool rusak;
  @override
  void initState() {
    super.initState();
    perlindunganDiriList;
    initPerlindunganDiri();
  }

  initPerlindunganDiri() {
    this.tidakTersedia = false;
    this.tidakDipakai = false;
    this.tidakLengkap = false;
    this.tidakCukup = false;
    this.tidakSesuai = false;
    this.rusak = false;
  }

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
              value: tidakTersedia,
              onChanged: (bool? value) {
                setState(() {
                  tidakTersedia = value!;
                  perlindunganDiriList.add("Tidak Tersedia");
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
              value: rusak,
              onChanged: (bool? value) {
                setState(() {
                  rusak = value!;
                  perlindunganDiriList.add("Rusak");
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
              value: tidakLengkap,
              onChanged: (bool? value) {
                setState(() {
                  tidakLengkap = value!;
                  perlindunganDiriList.add("Tidak Lengkap");
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
              value: tidakSesuai,
              onChanged: (bool? value) {
                setState(() {
                  tidakSesuai = value!;
                  perlindunganDiriList.add("Tidak Sesuai");
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
              value: tidakDipakai,
              onChanged: (bool? value) {
                setState(() {
                  tidakDipakai = value!;
                  perlindunganDiriList.add("Tidak Dipakai");
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
              value: tidakCukup,
              onChanged: (bool? value) {
                setState(() {
                  tidakCukup = value!;
                  perlindunganDiriList.add("Tidak Cukup");
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
