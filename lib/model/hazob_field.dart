// ignore_for_file: prefer_const_declarations

class HazobFields {
  static final String tglLaporan = 'Tanggal';
  static final String namaPengamat = 'Nama Pengamat';
  static final String departemen = 'Departemen/Perusahaan';
  static final String positivCek =
      'Jika semua dalam keadaan aman/baik(pengamatan positif)';
  static final String perlindunganDiri = 'Perlengkapan Pelindung diri';
  static final String prosedurKerja = 'Prosedur Kerja';
  static final String perlengkapanKerja = 'Perlengkapan Kerja';
  static final String penyimapanan = 'Penyimapanan';
  static final String suasanaLingkungan = 'Suasana Lingkungan Sekitaran';
  static final String posisiKerja = 'Posisi Kerja';
  static final String akses = 'Akses';
  static final String kegiatanDiamati = 'Kegiatan/Keadaan Yang Sedang Diamati';
  static final String tindakanAmanDiamati =
      'Tindakan Poisitf / Keadaan Aman yang Diamati';
  static final String tindakanNegatifDiamati = 'Tindakan Negatif yang Diamati';
  static final String kegiatanTidakAman = 'Keadaan Tidak Aman yang Diamat';

  static List<String> getFields() => [
        tglLaporan,
        namaPengamat,
        departemen,
        positivCek,
        perlindunganDiri,
        prosedurKerja,
        perlengkapanKerja,
        penyimapanan,
        suasanaLingkungan,
        posisiKerja,
        akses,
        kegiatanDiamati,
        tindakanAmanDiamati,
        tindakanNegatifDiamati,
        kegiatanTidakAman
      ];
}

class Hazob {
  final String tglLaporan;
  final String namaPengamat;
  final String departemen;
  final bool positivCek;
  final String perlindunganDiri;
  final String prosedurKerja;
  final String perlengkapanKerja;
  final String penyimapanan;
  final String suasanaLingkungan;
  final String posisiKerja;
  final String akses;
  final String kegiatanDiamati;
  final String tindakanAmanDiamati;
  final String tindakanNegatifDiamati;
  final String kegiatanTidakAman;

  const Hazob({
    required this.tglLaporan,
    required this.namaPengamat,
    required this.departemen,
    required this.positivCek,
    required this.perlindunganDiri,
    required this.prosedurKerja,
    required this.perlengkapanKerja,
    required this.penyimapanan,
    required this.suasanaLingkungan,
    required this.posisiKerja,
    required this.akses,
    required this.kegiatanDiamati,
    required this.tindakanAmanDiamati,
    required this.tindakanNegatifDiamati,
    required this.kegiatanTidakAman,
  });
  Map<String, dynamic> toJson() => {
        HazobFields.tglLaporan: tglLaporan,
        HazobFields.namaPengamat: namaPengamat,
        HazobFields.departemen: departemen,
        HazobFields.positivCek: positivCek,
        HazobFields.perlindunganDiri: perlindunganDiri,
        HazobFields.prosedurKerja: prosedurKerja,
        HazobFields.perlengkapanKerja: perlengkapanKerja,
        HazobFields.penyimapanan: penyimapanan,
        HazobFields.suasanaLingkungan: suasanaLingkungan,
        HazobFields.posisiKerja: posisiKerja,
        HazobFields.akses: akses,
        HazobFields.kegiatanDiamati: kegiatanDiamati,
        HazobFields.tindakanAmanDiamati: tindakanAmanDiamati,
        HazobFields.tindakanNegatifDiamati: tindakanNegatifDiamati,
        HazobFields.kegiatanTidakAman: kegiatanTidakAman,
      };
}
