
import 'package:flutter/material.dart';
import 'package:hazob_card_app/routes/routes.dart';

class ProsedurKerja extends StatefulWidget {
  const ProsedurKerja({Key? key}) : super(key: key);

  @override
  State<ProsedurKerja> createState() => _ProsedurKerjaState();
}

class _ProsedurKerjaState extends State<ProsedurKerja> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Text(
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
                  "Tidak Diketahui",
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
                  "Tidak Dimengerti",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
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
              const Spacer(),
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
                  "Tidak Dipatuhi",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),],
    );
  }
}
