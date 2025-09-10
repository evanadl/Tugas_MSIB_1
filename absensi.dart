import 'mahasiswa.dart';

class Absensi {
  List<Mahasiswa> daftarMahasiswa;

  Absensi(this.daftarMahasiswa);

  void lihatAbsensi() {
    print("\n--- Rekap Absensi ---");
    for (var mhs in daftarMahasiswa) {
      print("${mhs.nim} - ${mhs.nama}: ${mhs.absensi.join(", ")}");
    }
  }
}
