// ignore_for_file: unnecessary_this, use_build_context_synchronously, unused_catch_clause, prefer_typing_uninitialized_variables
import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hazob_card_app/api/sheets_api.dart';
import 'package:hazob_card_app/hazob_form/akses.dart';

import 'package:hazob_card_app/hazob_form/penyimpanan.dart';
import 'package:hazob_card_app/hazob_form/perlengkapan_kerja.dart';
import 'package:hazob_card_app/hazob_form/perlindungan_diri.dart';
import 'package:hazob_card_app/hazob_form/posisi_kerja.dart';
import 'package:hazob_card_app/hazob_form/prosedur_kerja.dart';
import 'package:hazob_card_app/hazob_form/suasana_lingkungan.dart';
import 'package:hazob_card_app/model/hazob_field.dart';
import 'package:hazob_card_app/api/drive_api.dart';

import 'package:hazob_card_app/routes/routes.dart';
import 'package:hazob_card_app/thankyou_page/thankyou_page.dart';
import 'package:intl/intl.dart';

class HazobPage extends StatefulWidget {
  const HazobPage({Key? key}) : super(key: key);

  @override
  State<HazobPage> createState() => _HazobPageState();
}

class _HazobPageState extends State<HazobPage> {
  final drive = GoogleDrive();
  late var hazob1;
  File? img;
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  Future getImage(ImageSource source) async {
    try {
      final imagePick = await ImagePicker().pickImage(source: source);
      if (imagePick == null) return;

      final imageTemporary = File(imagePick.path);
      setState(() {
        this.img = imageTemporary;
      });
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Belum ada gambar')));
    }
  }

  final dateNow = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  late TextEditingController _namaPengamat;
  late TextEditingController _departemen;
  final TextEditingController _kegiatanDiamatiController =
      TextEditingController();
  final TextEditingController _tindakanPositifController =
      TextEditingController();
  final TextEditingController _tindakanNegatifController =
      TextEditingController();
  final TextEditingController _potensiBahayaController =
      TextEditingController();
  final TextEditingController _perbaikanDilakukanController =
      TextEditingController();
  final TextEditingController _perbaikanDiusulkanController =
      TextEditingController();
  final TextEditingController _tanggapanController = TextEditingController();
  final TextEditingController _apakahPerluController = TextEditingController();

  late bool _keadaanAman = false;

  @override
  void initState() {
    super.initState();
    drive.getAccessCredentials();
    dateNow;
    _namaPengamat = TextEditingController();
    _departemen = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        openCloseDial: isDialOpen,
        backgroundColor: Colors.green,
        overlayColor: Colors.grey,
        overlayOpacity: 0.5,
        spacing: 15,
        spaceBetweenChildren: 15,
        closeManually: true,
        children: [
          SpeedDialChild(
              child: const Icon(Icons.insert_photo),
              label: 'Image',
              backgroundColor: Colors.blue,
              onTap: () async {
                await getImage(ImageSource.gallery);
                if (img != null) {
                  drive.uploadFile(img!);
                }
              }),
          SpeedDialChild(
              backgroundColor: Colors.pink,
              child: const Icon(Icons.camera_alt),
              label: 'Camera',
              onTap: () async {
                await getImage(ImageSource.camera);
                if (img != null) {
                  drive.uploadFile(img!);
                }
              }),
        ],
      ),
      backgroundColor: mainColor,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/img/logoHazob.png',
                          width: 100,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "HAZARD OBSERVATION",
                          style: TextStyle(
                              color: fontMainColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Lato'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Data tidak boleh kosong';
                      }
                      return null;
                    },
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
                        borderSide:
                            BorderSide(color: darkBlueColor, width: 0.0),
                      ),
                      contentPadding: const EdgeInsets.only(left: 25),
                      filled: true,
                      fillColor: darkOrangeColor,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '* Data tidak boleh kosong';
                      }
                      return null;
                    },
                    style: TextStyle(color: fontMainColor, fontSize: 12),
                    initialValue: dateNow,
                    readOnly: true,
                    cursorColor: darkBlueColor,
                    decoration: InputDecoration(
                      helperText: "* Tanggal Otomatis Terisi",
                      helperStyle: const TextStyle(
                        color: Colors.green,
                      ),
                      labelText: "Tanggal",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: TextStyle(color: fontMainColor, fontSize: 20),
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
                        borderSide:
                            BorderSide(color: darkBlueColor, width: 0.0),
                      ),
                      contentPadding: const EdgeInsets.only(left: 25),
                      filled: true,
                      fillColor: darkOrangeColor,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Data tidak boleh kosong';
                      }
                      return null;
                    },
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
                        borderSide:
                            BorderSide(color: darkBlueColor, width: 0.0),
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
                  detailHazob(),
                  Row(
                    children: <Widget>[
                      Text(
                        'Review Foto : ',
                        style: TextStyle(color: fontMainColor, fontSize: 15),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      if (img != null)
                        Image.file(
                          img!,
                          width: 247,
                          height: 150,
                          fit: BoxFit.cover,
                        )
                      else
                        const Icon(
                          Icons.drive_folder_upload,
                          size: 150,
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all<Size>(const Size(200, 50)),
                    ),
                    onPressed: () async {
                      setState(() {
                        if (_formKey.currentState!.validate()) {
                          if (img != null) {
                            hazob1 = Hazob(
                              tglLaporan: dateNow,
                              namaPengamat: _namaPengamat.text,
                              departemen: _departemen.text,
                              positivCek: _keadaanAman,
                              perlindunganDiri: perlindunganDiriList
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                              perlengkapanKerja: perlengkapanKerjaList
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                              prosedurKerja: prosedurkerjaList
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                              penyimapanan: penyimpananList
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                              suasanaLingkungan: suasanaLingkunganList
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                              posisiKerja: prosedurkerjaList
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                              akses: aksesList
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                              kegiatanDiamati: _kegiatanDiamatiController.text,
                              tindakanAmanDiamati:
                                  _tindakanPositifController.text,
                              tindakanNegatifDiamati:
                                  _tindakanNegatifController.text,
                              potensiBahaya: _potensiBahayaController.text,
                              perbaikanDilakukan:
                                  _perbaikanDilakukanController.text,
                              perbaikanDiusulkan:
                                  _perbaikanDiusulkanController.text,
                              tanggapan: _tanggapanController.text,
                              apakahPerlu: _apakahPerluController.text,
                              lampiranFoto:
                                  "https://drive.google.com/file/d/${detailImg?['id'].toString()}/view?usp=sharing",
                            );
                          } else {
                            hazob1 = Hazob(
                              tglLaporan: dateNow,
                              namaPengamat: _namaPengamat.text,
                              departemen: _departemen.text,
                              positivCek: _keadaanAman,
                              perlindunganDiri: perlindunganDiriList
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                              perlengkapanKerja: perlengkapanKerjaList
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                              prosedurKerja: prosedurkerjaList
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                              penyimapanan: penyimpananList
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                              suasanaLingkungan: suasanaLingkunganList
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                              posisiKerja: prosedurkerjaList
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                              akses: aksesList
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                              kegiatanDiamati: _kegiatanDiamatiController.text,
                              tindakanAmanDiamati:
                                  _tindakanPositifController.text,
                              tindakanNegatifDiamati:
                                  _tindakanNegatifController.text,
                              potensiBahaya: _potensiBahayaController.text,
                              perbaikanDilakukan:
                                  _perbaikanDilakukanController.text,
                              perbaikanDiusulkan:
                                  _perbaikanDiusulkanController.text,
                              tanggapan: _tanggapanController.text,
                              apakahPerlu: _apakahPerluController.text,
                              lampiranFoto: "Tidak Melampirkan Foto",
                            );
                          }

                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                'Hazob Submission',
                                textAlign: TextAlign.center,
                              ),
                              content: const Text(
                                  'Apakah anda yakin mengirim data ini ?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(color: dangerColor),
                                  ),
                                ),
                                const SizedBox(width: 30),
                                TextButton(
                                  onPressed: () async {
                                    await HazobSheetsApi.insert(
                                        [hazob1.toJson()]);

                                    aksesList.clear();
                                    penyimpananList.clear();
                                    perlindunganDiriList.clear();
                                    suasanaLingkunganList.clear();
                                    perlengkapanKerjaList.clear();
                                    prosedurkerjaList.clear();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')),
                                    );
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const ThankYou(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "SUBMIT",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Ada data yang kosong")));
                        }
                      });
                    },
                    child: const Text("Submit"),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget detailHazob() {
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
        maxLines: 1,
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
