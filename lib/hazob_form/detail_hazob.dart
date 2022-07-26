import 'package:flutter/material.dart';

import 'package:hazob_card_app/routes/routes.dart';

TextEditingController _kegiatanDiamatiController = TextEditingController();
TextEditingController _tindakanPositifController = TextEditingController();
TextEditingController _tindakanNegatifController = TextEditingController();
TextEditingController _potensiBahayaController = TextEditingController();
TextEditingController _perbaikanDilakukanController = TextEditingController();
TextEditingController _perbaikanDiusulkanController = TextEditingController();
TextEditingController _tanggapanController = TextEditingController();
TextEditingController _apakahPerluController = TextEditingController();
String? _kegiatanDiamati;

class DetailHazob extends StatefulWidget {
  const DetailHazob({Key? key}) : super(key: key);

  @override
  State<DetailHazob> createState() => _DetailHazobState();
}

class _DetailHazobState extends State<DetailHazob> {
  @override
  void initState() {
    super.initState();
    setState(() {
      _kegiatanDiamati = _kegiatanDiamatiController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        controller: _kegiatanDiamatiController,
        maxLines: 6,
        cursorColor: darkBlueColor,
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Kegiatan/Keadaan \nyang sedang diamati",
          labelStyle: TextStyle(
              color: fontMainColor, fontSize: 23, fontWeight: FontWeight.bold),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white, width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: darkBlueColor, width: 3),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: darkBlueColor, width: 0.0),
          ),
          contentPadding: const EdgeInsets.only(
            left: 25,
            top: 50,
          ),
          filled: true,
          fillColor: darkOrangeColor,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      TextField(
        onEditingComplete: () => setState(() {
          _kegiatanDiamati = _tindakanPositifController.text;
        }),
        controller: _tindakanPositifController,
        maxLines: 6,
        cursorColor: darkBlueColor,
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Tindakan Positif/Keadaan \nTidak Aman yang Diamati",
          labelStyle: TextStyle(
              color: fontMainColor, fontSize: 23, fontWeight: FontWeight.bold),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white, width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: darkBlueColor, width: 3),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: darkBlueColor, width: 0.0),
          ),
          contentPadding: const EdgeInsets.only(
            left: 25,
            top: 50,
          ),
          filled: true,
          fillColor: darkOrangeColor,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      TextField(
        controller: _tindakanNegatifController,
        maxLines: 6,
        cursorColor: darkBlueColor,
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Tindakan negatif/Keadaan \nTidak Aman yang Diamati",
          labelStyle: TextStyle(
              color: fontMainColor, fontSize: 23, fontWeight: FontWeight.bold),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white, width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: darkBlueColor, width: 3),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: darkBlueColor, width: 0.0),
          ),
          contentPadding: const EdgeInsets.only(
            left: 25,
            top: 50,
          ),
          filled: true,
          fillColor: darkOrangeColor,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      TextField(
        controller: _potensiBahayaController,
        maxLines: 6,
        cursorColor: darkBlueColor,
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText:
              "Potensi bahaya dari tindakan / \nkeadaan tidak aman diatas",
          labelStyle: TextStyle(
              color: fontMainColor, fontSize: 23, fontWeight: FontWeight.bold),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white, width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: darkBlueColor, width: 3),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: darkBlueColor, width: 0.0),
          ),
          contentPadding: const EdgeInsets.only(
            left: 25,
            top: 50,
          ),
          filled: true,
          fillColor: darkOrangeColor,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      TextField(
        controller: _perbaikanDilakukanController,
        maxLines: 6,
        cursorColor: darkBlueColor,
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Perbaikan yang dilakukan",
          labelStyle: TextStyle(
              color: fontMainColor, fontSize: 23, fontWeight: FontWeight.bold),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white, width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: darkBlueColor, width: 3),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: darkBlueColor, width: 0.0),
          ),
          contentPadding: const EdgeInsets.only(
            left: 25,
            top: 50,
          ),
          filled: true,
          fillColor: darkOrangeColor,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      TextField(
        controller: _perbaikanDiusulkanController,
        maxLines: 6,
        cursorColor: darkBlueColor,
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Perbaikan yang diusulkan",
          labelStyle: TextStyle(
              color: fontMainColor, fontSize: 23, fontWeight: FontWeight.bold),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white, width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: darkBlueColor, width: 3),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: darkBlueColor, width: 0.0),
          ),
          contentPadding: const EdgeInsets.only(
            left: 25,
            top: 50,
          ),
          filled: true,
          fillColor: darkOrangeColor,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      TextField(
        controller: _tanggapanController,
        maxLines: 6,
        cursorColor: darkBlueColor,
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Tanggapan dari yang diamati \n atas usulan perbaikan",
          labelStyle: TextStyle(
              color: fontMainColor, fontSize: 23, fontWeight: FontWeight.bold),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white, width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: darkBlueColor, width: 3),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: darkBlueColor, width: 0.0),
          ),
          contentPadding: const EdgeInsets.only(
            left: 25,
            top: 50,
          ),
          filled: true,
          fillColor: darkOrangeColor,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      TextField(
        controller: _apakahPerluController,
        maxLines: 6,
        cursorColor: darkBlueColor,
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Apakah diperlukan \ntindakan lanjutan",
          labelStyle: TextStyle(
              color: fontMainColor, fontSize: 23, fontWeight: FontWeight.bold),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white, width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: darkBlueColor, width: 3),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: darkBlueColor, width: 0.0),
          ),
          contentPadding: const EdgeInsets.only(
            left: 25,
            top: 50,
          ),
          filled: true,
          fillColor: darkOrangeColor,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ]);
  }
}
