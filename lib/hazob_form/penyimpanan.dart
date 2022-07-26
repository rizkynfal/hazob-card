// ignore_for_file: unnecessary_import, unnecessary_this

import 'package:flutter/material.dart';
import 'package:hazob_card_app/routes/routes.dart';

List<String> penyimpananList = [];

class Penyimpanan extends StatefulWidget {
  const Penyimpanan({Key? key}) : super(key: key);

  @override
  State<Penyimpanan> createState() => _PenyimpananState();
}

class _PenyimpananState extends State<Penyimpanan> {
  late bool tidakAdaLabel = false;
  late bool rakTakaman = false;
  late bool tidakRapih = false;
  late bool tidakAkses = false;

  @override
  void initState() {
    super.initState();
    penyimpananList;
  }

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
              value: tidakAdaLabel,
              onChanged: (bool? value) {
                setState(() {
                  tidakAdaLabel = value!;
                  penyimpananList.add("Tidak Ada Label");
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
              value: tidakRapih,
              onChanged: (bool? value) {
                setState(() {
                  tidakRapih = value!;
                  penyimpananList.add("Tidak Rapih");
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
              value: rakTakaman,
              onChanged: (bool? value) {
                setState(() {
                  rakTakaman = value!;
                  penyimpananList.add("Rak Tidak Aman");
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
              value: tidakAkses,
              onChanged: (bool? value) {
                setState(() {
                  tidakAkses = value!;
                  penyimpananList.add("Tidak ada Akses");
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
