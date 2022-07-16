import 'package:flutter/material.dart';
import 'package:hazob_card_app/hazob_form/akses.dart';
import 'package:hazob_card_app/hazob_form/penyimpanan.dart';
import 'package:hazob_card_app/hazob_form/perlengkapan_kerja.dart';
import 'package:hazob_card_app/hazob_form/perlindungan_diri.dart';
import 'package:hazob_card_app/hazob_form/prosedur_kerja.dart';
import 'package:hazob_card_app/hazob_form/suasana_lingkungan.dart';

import 'package:hazob_card_app/routes/routes.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class HazobPage extends StatefulWidget {
  const HazobPage({Key? key}) : super(key: key);

  @override
  State<HazobPage> createState() => _HazobPageState();
}

class _HazobPageState extends State<HazobPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(backgroundColor: mainColor, fontFamily: 'Lato'),
      home: _buildContext(context),
    );
  }

  Widget _buildContext(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "HAZARD OBSERVATION",
                        style: TextStyle(
                            color: fontMainColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Lato'),
                      ),
                      Image.asset(
                        'assets/img/LogoTatelyNV.png',
                        width: 250,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                TextFormField(
                  cursorColor: darkBlueColor,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: Colors.red.shade600, width: 3),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: darkBlueColor, width: 3),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: darkBlueColor, width: 0.0),
                    ),
                    contentPadding: const EdgeInsets.only(left: 25),
                    hintText: "Nama Pengamat",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: fontMainColor,
                    ),
                    filled: true,
                    fillColor: darkOrangeColor,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 172,
                      child: TextFormField(
                        readOnly: true,
                        cursorColor: darkBlueColor,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: Colors.red.shade600, width: 3),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: darkBlueColor, width: 3),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: darkBlueColor, width: 0.0),
                          ),
                          contentPadding: const EdgeInsets.only(left: 25),
                          hintText: "Tgl. Dilaporkan",
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: fontMainColor,
                          ),
                          filled: true,
                          fillColor: darkOrangeColor,
                        ),
                      ),
                    ),
                    const Spacer(),
                    ButtonTheme(
                      buttonColor: Colors.white,
                      minWidth: 15.0,
                      height: 40.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                fontMainColor)),
                        onPressed: () {
                          DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime.now().subtract(
                              const Duration(days: 10),
                            ),
                            maxTime: DateTime.now(),
                            currentTime: DateTime.now(),
                            locale: LocaleType.id,
                            onChanged: (date) {},
                            onConfirm: (date) {
                              setState(() {});
                            },
                          );
                        },
                        child: Icon(
                          Icons.date_range_outlined,
                          size: 40,
                          color: mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                TextFormField(
                  cursorColor: darkBlueColor,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: Colors.red.shade600, width: 3),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: darkBlueColor, width: 3),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: darkBlueColor, width: 0.0),
                    ),
                    contentPadding: const EdgeInsets.only(left: 25),
                    hintText: "Departemen / Perusahaan",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: fontMainColor,
                    ),
                    filled: true,
                    fillColor: darkOrangeColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: fontMainColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 15),
                      Text(
                        "OBSERVATION FORM",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: <Widget>[
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          const Expanded(
                            child: Text(
                              "Jika Semua dalam keadaan aman / baik (pengamatan positif)",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const PerlindunganDiri(),
                      const PerlengkapanKerja(),
                      const ProsedurKerja(),
                      const Penyimpanan(),
                      const LingkunganSekitar(),
                      const Akses(),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                ButtonTheme(
                  buttonColor: Colors.white,
                  height: 60.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size(200, 30)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(darkOrangeColor)),
                    onPressed: () {},
                    child: const Text("Selanjutnya"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
