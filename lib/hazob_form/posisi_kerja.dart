// ignore_for_file: unnecessary_import, unnecessary_this

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hazob_card_app/routes/routes.dart';

class PosisiKerja extends StatefulWidget {
  const PosisiKerja({Key? key}) : super(key: key);

  @override
  State<PosisiKerja> createState() => _PosisiKerjaState();
}

class _PosisiKerjaState extends State<PosisiKerja> {  final GlobalKey<FormState> _formPosisiKerja = GlobalKey<FormState>();
  late bool dalamBahaya;
  late bool tidakErgonomi;
  @override
  void initState() {
    super.initState();
    initPosisiKerja();
  }

  initPosisiKerja() {
    this.dalamBahaya = false;
    this.tidakErgonomi = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(key: _formPosisiKerja,
      child: Column(
        children: <Widget>[
          Text(
            "POSISI KERJA",
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
                value: dalamBahaya,
                onChanged: (bool? value) {
                  setState(() {
                    dalamBahaya = value!;
                  });
                },
              ),
              const Expanded(
                flex: 2,
                child: Text(
                  "Dalam Bahaya",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: tidakErgonomi,
                onChanged: (bool? value) {
                  setState(() {
                    tidakErgonomi = value!;
                  });
                },
              ),
              const Expanded(
                flex: 2,
                child: Text(
                  "Tidak Ergonomi",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
