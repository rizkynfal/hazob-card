// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hazob_card_app/routes/routes.dart';

class DetailHazob extends StatefulWidget {
  const DetailHazob({Key? key}) : super(key: key);

  @override
  State<DetailHazob> createState() => _DetailHazobState();
}

class _DetailHazobState extends State<DetailHazob> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        maxLines: 6,
        cursorColor: darkBlueColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red.shade600, width: 3),
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
          hintText: "Kegiatan/Keadaan Yang Sedang Diamati",
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
      TextField(
        maxLines: 6,
        cursorColor: darkBlueColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red.shade600, width: 3),
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
          hintText: "Tindakan Poisitf / Keadaan Aman yang Diamati",
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
      TextField(
        maxLines: 6,
        cursorColor: darkBlueColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red.shade600, width: 3),
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
          hintText: "Tindakan Negatif yang Diamati",
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
      TextField(
        maxLines: 6,
        cursorColor: darkBlueColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red.shade600, width: 3),
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
          hintText: "Keadaan Tidak Aman yang Diamati",
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
      TextField(
        maxLines: 6,
        cursorColor: darkBlueColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red.shade600, width: 3),
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
          hintText: "Potensi Bahaya dari Tindakan / Keadaan Tidak Aman diatas",
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
      TextField(
        maxLines: 6,
        cursorColor: darkBlueColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red.shade600, width: 3),
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
          hintText: "Perbaikan yang dilakukan",
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
      TextField(
        maxLines: 6,
        cursorColor: darkBlueColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red.shade600, width: 3),
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
          hintText: "Perbaikan yang  Diusulkan",
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
      TextField(
        maxLines: 6,
        cursorColor: darkBlueColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red.shade600, width: 3),
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
          hintText: "Tanggapan dari yang Diamati atas usulan perbaikan",
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
      TextField(
        maxLines: 6,
        cursorColor: darkBlueColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red.shade600, width: 3),
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
          hintText: "Apakah diperlukan tindakan lanjutan",
          hintStyle: TextStyle(
            fontSize: 15,
            color: fontMainColor,
          ),
          filled: true,
          fillColor: darkOrangeColor,
        ),
      ),
    ]);
  }
}
