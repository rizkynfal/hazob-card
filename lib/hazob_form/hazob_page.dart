import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hazob_card_app/api/sheets_api.dart';
import 'package:hazob_card_app/hazob_form/akses.dart';
import 'package:hazob_card_app/hazob_form/detail_hazob.dart';
import 'package:hazob_card_app/hazob_form/kamera.dart';
import 'package:hazob_card_app/hazob_form/penyimpanan.dart';
import 'package:hazob_card_app/hazob_form/perlengkapan_kerja.dart';
import 'package:hazob_card_app/hazob_form/perlindungan_diri.dart';
import 'package:hazob_card_app/hazob_form/posisi_kerja.dart';
import 'package:hazob_card_app/hazob_form/prosedur_kerja.dart';
import 'package:hazob_card_app/hazob_form/suasana_lingkungan.dart';
import 'package:hazob_card_app/model/hazob_field.dart';

import 'package:hazob_card_app/routes/routes.dart';
import 'package:intl/intl.dart';

List<CameraDescription> cameras = [];

class HazobPage extends StatefulWidget {
  const HazobPage({Key? key}) : super(key: key);

  @override
  State<HazobPage> createState() => _HazobPageState();
}

class _HazobPageState extends State<HazobPage> {
  final dateNow = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  late TextEditingController _namaPengamat;
  late TextEditingController _departemen;
  late bool tidakTersedia;
  late bool tidakLengkap;
  late bool tidakDipakai;
  late bool tidakCukup;
  late bool tidakSesuai;
  late bool rusak;
  late bool _keadaanAman;

  @override
  void initState() {
    super.initState();
    
    initHazob();
  }

  initHazob() {
    dateNow;
    _namaPengamat = TextEditingController();
    _departemen = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await availableCameras().then(
            (value) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraPage(
                  cameras: value,
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.camera_alt),
      ),
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
                  controller: _namaPengamat,
                  cursorColor: darkBlueColor,
                  decoration: InputDecoration(
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    labelText: "Nama Pengamat",
                    labelStyle: TextStyle(
                      color: fontMainColor,
                      fontSize: 15,
                      fontFamily: 'Lato',
                    ),
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
                    filled: true,
                    fillColor: darkOrangeColor,
                  ),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  style: TextStyle(color: fontMainColor, fontSize: 12),
                  initialValue: dateNow,
                  readOnly: true,
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
                    filled: true,
                    fillColor: darkOrangeColor,
                  ),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _departemen,
                  cursorColor: darkBlueColor,
                  decoration: InputDecoration(
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    labelText: "Departemen / Perusahaan",
                    labelStyle: TextStyle(
                      color: fontMainColor,
                      fontSize: 15,
                      fontFamily: 'Lato',
                    ),
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
                            value: _keadaanAman,
                            onChanged: (bool? value) {
                              setState(() {
                                _keadaanAman = value!;
                              });
                            },
                          ),
                          const Expanded(
                            child: Text(
                              "Jika Semua dalam keadaan aman / baik (pengamatan positif)",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lato'),
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
                      const PosisiKerja(),
                      const Akses(),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const DetailHazob(),
                const SizedBox(
                  height: 20,
                ),
                ButtonTheme(
                  buttonColor: Colors.white,
                  height: 60.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size(200, 40)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(darkOrangeColor)),
                    onPressed: () async {
                      final hazob1 = Hazob(
                        tglLaporan: dateNow,
                        namaPengamat: _namaPengamat.text,
                        departemen: _departemen.text,
                        positivCek: _keadaanAman,
                        perlindunganDiri: perlindunganDiriList.toString(),
                        prosedurKerja: "prosedurKerja",
                        perlengkapanKerja: "perlengkapanKerja",
                        penyimapanan: penyimpananList.toString(),
                        suasanaLingkungan: "suasanaLingkungan",
                        posisiKerja: "posisiKerja",
                        akses: "akses",
                        kegiatanDiamati: ,
                        tindakanAmanDiamati: _tindakanPositif,
                        tindakanNegatifDiamati: _tindakanNegatif,
                        potensiBahaya: _potensiBahaya,
                        perbaikanDilakukan: _perbaikanDilakukan,
                        perbaikanDiusulkan: _perbaikanDiusulkan,
                        tanggapan: _tanggapan,
                        apakahPerlu: _apakahPerlu,
                      );
                      await HazobSheetsApi.insert([hazob1.toJson()]);
                      penyimpananList.clear();
                      perlindunganDiriList.clear();
                    },
                    child: const Text("Submit"),
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
