// ignore_for_file: prefer_const_declarations


class HazobFields {
  static final String tglLaporan = 'Tanggal';
  static final String namaPengamat = 'Nama Pengamat';
  static final String departemen = 'Departemen/Perusahaan';
  static final String positivCek =
      'Jika semua dalam keadaan aman/baik(pengamatan positif)';
  static final String perlindunganDiri = 'Perlengkapan Pelindung diri';

  static final String perlengkapanKerja = 'Perlengkapan Kerja';
  static final String prosedurKerja = 'Prosedur Kerja';
  static final String penyimapanan = 'Penyimapanan';
  static final String suasanaLingkungan = 'Suasana Lingkungan Sekitaran';
  static final String posisiKerja = 'Posisi Kerja';
  static final String akses = 'Akses';
  static final String kegiatanDiamati = 'Kegiatan/Keadaan Yang Sedang Diamati';
  static final String tindakanAmanDiamati =
      'Tindakan Poisitf / Keadaan Aman yang Diamati';
  static final String tindakanNegatifDiamati =
      'Tindakan / Keadaan  Negatif Tidak Aman yang Diamati';
  static final String potensiBahaya =
      'Potensi bahaya dari tindakan/keadaan tidak aman diatas';
  static final String perbaikanDilakukan = 'Perbaikan yang dilakukan';
  static final String perbaikanDiusulkan = 'Perbaikan yang diusulkan';
  static final String tanggapan =
      'Tanggapan dari yang diamati atas usulan perbaikan';
  static final String apakahPerlu = 'Apakah diperlukan tindakan lanjutan';
  static final String lampiranFoto = 'Lampiran Foto';


  static List<String> getFields() => [
        tglLaporan,
        namaPengamat,
        departemen,
        positivCek,
        perlindunganDiri,
        perlengkapanKerja,
        prosedurKerja,
        penyimapanan,
        suasanaLingkungan,
        posisiKerja,
        akses,
        kegiatanDiamati,
        tindakanAmanDiamati,
        tindakanNegatifDiamati,
        potensiBahaya,
        perbaikanDilakukan,
        perbaikanDiusulkan,
        tanggapan,
        apakahPerlu,
        lampiranFoto
      ];
}

class Hazob {
  final String tglLaporan;
  final String namaPengamat;
  final String departemen;
  final bool positivCek;
  final String perlindunganDiri;

  final String perlengkapanKerja;
  final String prosedurKerja;
  final String penyimapanan;
  final String suasanaLingkungan;
  final String posisiKerja;
  final String akses;
  final String kegiatanDiamati;
  final String tindakanAmanDiamati;
  final String tindakanNegatifDiamati;
  final String potensiBahaya;
  final String perbaikanDilakukan;
  final String perbaikanDiusulkan;
  final String tanggapan;
  final String apakahPerlu;
  final String lampiranFoto;

  const Hazob({
    required this.tglLaporan,
    required this.namaPengamat,
    required this.departemen,
    required this.positivCek,
    required this.perlindunganDiri,
    required this.perlengkapanKerja,
    required this.prosedurKerja,
    required this.penyimapanan,
    required this.suasanaLingkungan,
    required this.posisiKerja,
    required this.akses,
    required this.kegiatanDiamati,
    required this.tindakanAmanDiamati,
    required this.tindakanNegatifDiamati,
    required this.potensiBahaya,
    required this.perbaikanDilakukan,
    required this.perbaikanDiusulkan,
    required this.tanggapan,
    required this.apakahPerlu,
    required this.lampiranFoto
  });
  Map<String, dynamic> toJson() => {
        HazobFields.tglLaporan: tglLaporan,
        HazobFields.namaPengamat: namaPengamat,
        HazobFields.departemen: departemen,
        HazobFields.positivCek: positivCek,
        HazobFields.perlindunganDiri: perlindunganDiri,
        HazobFields.perlengkapanKerja: perlengkapanKerja,
        HazobFields.prosedurKerja: prosedurKerja,
        HazobFields.penyimapanan: penyimapanan,
        HazobFields.suasanaLingkungan: suasanaLingkungan,
        HazobFields.posisiKerja: posisiKerja,
        HazobFields.akses: akses,
        HazobFields.kegiatanDiamati: kegiatanDiamati,
        HazobFields.tindakanAmanDiamati: tindakanAmanDiamati,
        HazobFields.tindakanNegatifDiamati: tindakanNegatifDiamati,
        HazobFields.potensiBahaya: potensiBahaya,
        HazobFields.perbaikanDilakukan: perbaikanDilakukan,
        HazobFields.perbaikanDiusulkan: perbaikanDiusulkan,
        HazobFields.tanggapan: tanggapan,
        HazobFields.apakahPerlu: apakahPerlu,
        HazobFields.lampiranFoto: lampiranFoto,
      };
}


