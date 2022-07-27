// ignore_for_file: unnecessary_import, unnecessary_this

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hazob_card_app/routes/routes.dart';

List<String> suasanaLingkunganList = [];

class LingkunganSekitar extends StatefulWidget {
  const LingkunganSekitar({Key? key}) : super(key: key);

  @override
  State<LingkunganSekitar> createState() => _LingkunganSekitarState();
}

class _LingkunganSekitarState extends State<LingkunganSekitar> {
  late bool bising;
  late bool kotor;
  late bool asap;
  late bool terang;
  late bool basah;
  late bool panas;
  @override
  void initState() {
    super.initState();
    suasanaLingkunganList;
    initLingkungan();
  }

  initLingkungan() {
    this.asap = false;
    this.kotor = false;
    this.terang = false;
    this.basah = false;
    this.panas = false;
    this.bising = false;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "SUASANA LINGKUNGAN SEKITARAN",
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
              value: bising,
              onChanged: (bool? value) {
                setState(() {
                  bising = value!;
                  suasanaLingkunganList.add('Bising');
                });
              },
            ),
            const Expanded(
              flex: 2,
              child: Text(
                "Bising",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: asap,
              onChanged: (bool? value) {
                setState(() {
                  asap = value!;
                  suasanaLingkunganList.add('Asap/Api/Kabut');
                });
              },
            ),
            const Expanded(
              flex: 2,
              child: Text(
                "Asap / Api / Kabut",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: kotor,
              onChanged: (bool? value) {
                setState(() {
                  kotor = value!;
                  suasanaLingkunganList.add('Berdebu / Kotor');
                });
              },
            ),
            const Expanded(
              flex: 2,
              child: Text(
                "Berdebu / Kotor",
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
              value: terang,
              onChanged: (bool? value) {
                setState(() {
                  terang = value!;
                  suasanaLingkunganList.add('Sangat Terang / Gelap');
                });
              },
            ),
            const Expanded(
              flex: 2,
              child: Text(
                "Sangat terang/Gelap",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: panas,
              onChanged: (bool? value) {
                setState(() {
                  panas = value!;
                  suasanaLingkunganList.add('Sangat Panas / Dingin');
                });
              },
            ),
            const Expanded(
              flex: 2,
              child: Text(
                "Sangat panas/dingin",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: basah,
              onChanged: (bool? value) {
                setState(() {
                  basah = value!;
                  suasanaLingkunganList.add('Basah / banjir /licin');
                });
              },
            ),
            const Expanded(
              flex: 2,
              child: Text(
                "Basah / Banjir/ Licin",
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
