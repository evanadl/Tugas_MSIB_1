import 'mahasiswa.dart';

class Admin {
  String username;
  String password;

  Admin(this.username, this.password);

  bool login(String userInput, String passInput) {
    return username == userInput && password == passInput;
  }

  void tambahMahasiswa(List<Mahasiswa> daftarMahasiswa, Mahasiswa mhs) {
    daftarMahasiswa.add(mhs);
    print("Mahasiswa ${mhs.nama} berhasil ditambahkan!");
  }

  void hapusMahasiswa(List<Mahasiswa> daftarMahasiswa, String nim) {
    daftarMahasiswa.removeWhere((mhs) => mhs.nim == nim);
    print("Mahasiswa dengan NIM $nim berhasil dihapus!");
  }

  void cariMahasiswa(List<Mahasiswa> daftarMahasiswa, String nim) {
    var mhs = daftarMahasiswa.where((m) => m.nim == nim).toList();
    if (mhs.isNotEmpty) {
      print("Mahasiswa ditemukan: ${mhs[0].nim} - ${mhs[0].nama}");
    } else {
      print("Mahasiswa dengan NIM $nim tidak ditemukan.");
    }
  }

  void updateMahasiswa(List<Mahasiswa> daftarMahasiswa, String nim, String namaBaru, String passwordBaru) {
    for (var mhs in daftarMahasiswa) {
      if (mhs.nim == nim) {
        mhs.nama = namaBaru;
        mhs.password = passwordBaru;
        print("Data mahasiswa $nim berhasil diupdate!");
        return;
      }
    }
    print("Mahasiswa dengan NIM $nim tidak ditemukan.");
  }

  void lihatMahasiswa(List<Mahasiswa> daftarMahasiswa) {
    print("\n--- Daftar Mahasiswa ---");
    if (daftarMahasiswa.isEmpty) {
      print("Belum ada data mahasiswa.");
    }
    for (var mhs in daftarMahasiswa) {
      print("${mhs.nim} - ${mhs.nama}");
    }
  }
}
