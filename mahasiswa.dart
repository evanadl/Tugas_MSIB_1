class Mahasiswa {
  String nim;
  String nama;
  String password;
  List<String> absensi = [];

  Mahasiswa(this.nim, this.nama, this.password);

  bool login(String inputNim, String inputPassword) {
    return nim == inputNim && password == inputPassword;
  }

  void absen(String tanggal) {
    absensi.add(tanggal);
    print("$nama berhasil absen pada $tanggal");
  }
}
