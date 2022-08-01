// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:hazob_card_app/routes/routes.dart';

List<String> prosedurkerjaList = [];

class ProsedurKerja extends StatefulWidget {
  const ProsedurKerja({Key? key}) : super(key: key);

  @override
  State<ProsedurKerja> createState() => _ProsedurKerjaState();
}

class _ProsedurKerjaState extends State<ProsedurKerja> {
  final GlobalKey<FormState> _formProsedurKerja = GlobalKey<FormState>();
  late bool tidakTersedia;
  late bool tidakDimengerti;
  late bool tidakDipatuhi;
  late bool tidakDiketahui;
  late bool tidakSesuai;

  @override
  void initState() {
    super.initState();
    prosedurkerjaList;
    initProsedurKerja();
  }

  initProsedurKerja() {
    this.tidakTersedia = false;
    this.tidakDimengerti = false;
    this.tidakDipatuhi = false;
    this.tidakDiketahui = false;
    this.tidakSesuai = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formProsedurKerja,
      child: Column(
        children: <Widget>[
          Text(
            "PROSEDUR KERJA",
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
              ),  const Spacer(flex: 2,),
          
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: tidakDiketahui,
                onChanged: (bool? value) {
                  setState(() {
                    tidakDiketahui = value!;
                    prosedurkerjaList.add('Tidak Tersedia');
                  });
                },
              ),
              const Expanded(
                flex: 2,
                child: Text(
                  "Tidak Diketahui",
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
                value: tidakDimengerti,
                onChanged: (bool? value) {
                  setState(() {
                    tidakDimengerti = value!;
                    prosedurkerjaList.add('Tidak Dimengerti');
                  });
                },
              ),
              const Expanded(
                flex: 2,
                child: Text(
                  "Tidak Dimengerti",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: tidakSesuai,
                onChanged: (bool? value) {
                  setState(() {
                    tidakSesuai = value!;
                    prosedurkerjaList.add('Tidak Sesuai');
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
                value: tidakDipatuhi,
                onChanged: (bool? value) {
                  setState(() {
                    tidakDipatuhi = value!;
                    prosedurkerjaList.add('Tidak Dipatuhi');
                  });
                },
              ),
              const Expanded(
                flex: 2,
                child: Text(
                  "Tidak Dipatuhi",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}
