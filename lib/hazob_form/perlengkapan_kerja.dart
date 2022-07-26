// ignore_for_file: unnecessary_import, unnecessary_this

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hazob_card_app/routes/routes.dart';

class PerlengkapanKerja extends StatefulWidget {
  const PerlengkapanKerja({Key? key}) : super(key: key);

  @override
  State<PerlengkapanKerja> createState() => _PerlengkapanKerjaState();
}

class _PerlengkapanKerjaState extends State<PerlengkapanKerja> {  final GlobalKey<FormState> _formPerlengkapanKerja = GlobalKey<FormState>();
  late bool tidakTersedia ;
  late bool tidakLengkap;
  late bool tidakBenarPakai;
  late bool tidakCukup;
  late bool tidakSesuai;
  late bool rusak;
  late bool tidakBerpelindung;
  late bool pelindungRusak;
  @override
  void initState() {
    super.initState();
    initPerlengkapanKerja();
  }

  initPerlengkapanKerja() {
    this.tidakTersedia = false;
    this.tidakLengkap = false;
    this.tidakBenarPakai = false;
    this.tidakCukup = false;
    this.tidakSesuai = false;
    this.rusak = false;
    this.tidakBerpelindung = false;
    this.pelindungRusak = false;
  }

  @override
  Widget build(BuildContext context) {
    return  Form(key: _formPerlengkapanKerja,
      child: Column(
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
                value: tidakTersedia,
                onChanged: (bool? value) {
                  setState(() {
                    tidakTersedia = value!;
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
                value: tidakBenarPakai,
                onChanged: (bool? value) {
                  setState(() {
                    tidakBenarPakai = value!;
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
                value: tidakSesuai,
                onChanged: (bool? value) {
                  setState(() {
                    tidakSesuai = value!;
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
                value: tidakLengkap,
                onChanged: (bool? value) {
                  setState(() {
                    tidakLengkap = value!;
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
                value: rusak,
                onChanged: (bool? value) {
                  setState(() {
                    rusak = value!;
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
                value: tidakCukup,
                onChanged: (bool? value) {
                  setState(() {
                    tidakCukup = value!;
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
                value: tidakBerpelindung,
                onChanged: (bool? value) {
                  setState(() {
                    tidakBerpelindung = value!;
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
                value: pelindungRusak,
                onChanged: (bool? value) {
                  setState(() {
                    pelindungRusak = value!;
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
      ),
    );
  }
}
