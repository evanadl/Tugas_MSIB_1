import 'mahasiswa.dart';
import 'admin.dart';

void main() {
  var admin = Admin("Bapak Dosen");
  admin.login();

  var mhs1 = Mahasiswa("Evan", "123");
  var mhs2 = Mahasiswa("Adi", "124");
  admin.tambahMahasiswa(mhs1);
  admin.tambahMahasiswa(mhs2);

  admin.lihatMahasiswa();

  mhs1.login();
  mhs1.absen("2025-09-10", "08:00");
  mhs1.lihatAbsensi();

  admin.hapusMahasiswa("124");
  admin.lihatMahasiswa();
}
