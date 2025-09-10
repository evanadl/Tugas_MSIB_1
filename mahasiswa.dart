class Mahasiswa {
  String nama;
  String nim;
  List<Map<String, String>> absensi = [];

  Mahasiswa(this.nama, this.nim);

  void login() {
    print("Mahasiswa $nama ($nim) berhasil login.");
  }

  void absen(String tanggal, String jam) {
    absensi.add({"tanggal": tanggal, "jam": jam});
    print("$nama absen pada $tanggal jam $jam");
  }

  void lihatAbsensi() {
    print("Riwayat Absensi $nama:");
    for (var a in absensi) {
      print("- ${a['tanggal']} | ${a['jam']}");
    }
  }
}
