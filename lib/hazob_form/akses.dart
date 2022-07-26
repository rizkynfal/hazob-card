// ignore_for_file: unnecessary_import, unnecessary_this

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hazob_card_app/routes/routes.dart';

class Akses extends StatefulWidget {
  const Akses({Key? key}) : super(key: key);

  @override
  State<Akses> createState() => _AksesState();
}

class _AksesState extends State<Akses> {
  final GlobalKey<FormState> _formAkses = GlobalKey<FormState>();
  late bool rusak;
  late bool tidakAman;
  late bool terhalang;
  late bool terbatas;
  @override
  void initState() {
    super.initState();
    rusak = false;
    terhalang = false;
    tidakAman = false;
    terbatas = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formAkses,
      child: Column(
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
                value: rusak,
                onChanged: (bool? value) {
                  setState(() {
                    rusak = value!;
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
                value: terhalang,
                onChanged: (bool? value) {
                  setState(() {
                    terhalang = value!;
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
                value: terbatas,
                onChanged: (bool? value) {
                  setState(() {
                    terbatas = value!;
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
      ),
    );
  }
}
