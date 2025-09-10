import 'mahasiswa.dart';

class Admin {
  String nama;
  List<Mahasiswa> daftarMahasiswa = [];

  Admin(this.nama);

  void login() {
    print("Admin $nama berhasil login.");
  }

  void tambahMahasiswa(Mahasiswa mhs) {
    daftarMahasiswa.add(mhs);
    print("Mahasiswa ${mhs.nama} ditambahkan.");
  }

  void hapusMahasiswa(String nim) {
    daftarMahasiswa.removeWhere((mhs) => mhs.nim == nim);
    print("Mahasiswa dengan NIM $nim dihapus.");
  }

  void lihatMahasiswa() {
    print("Daftar Mahasiswa:");
    for (var m in daftarMahasiswa) {
      print("- ${m.nama} (${m.nim})");
    }
  }
}
