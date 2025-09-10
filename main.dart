import 'dart:io';
import 'mahasiswa.dart';
import 'admin.dart';
import 'absensi.dart';

void main() {
  List<Mahasiswa> daftarMahasiswa = [
    Mahasiswa("22001", "Budi", "123"),
    Mahasiswa("22002", "Ani", "456"),
  ];

  Admin admin = Admin("admin", "admin123");
  Absensi absensi = Absensi(daftarMahasiswa);

  bool running = true;
  while (running) {
    print("\n===== Sistem Absensi Mahasiswa =====");
    print("1. Login Mahasiswa");
    print("2. Login Admin");
    print("3. Keluar");
    stdout.write("Pilih menu: ");
    var pilihan = stdin.readLineSync();

    switch (pilihan) {
      case "1":
        stdout.write("Masukkan NIM: ");
        var nim = stdin.readLineSync();
        stdout.write("Masukkan Password: ");
        var pass = stdin.readLineSync();

        var mhs = daftarMahasiswa.firstWhere(
          (m) => m.login(nim!, pass!),
          orElse: () => Mahasiswa("", "", ""),
        );

        if (mhs.nim != "") {
          print("Selamat datang, ${mhs.nama}!");
          stdout.write("Masukkan tanggal absensi: ");
          var tgl = stdin.readLineSync();
          mhs.absen(tgl!);
        } else {
          print("Login gagal!");
        }
        break;

      case "2":
        stdout.write("Masukkan Username: ");
        var user = stdin.readLineSync();
        stdout.write("Masukkan Password: ");
        var pwd = stdin.readLineSync();

        if (admin.login(user!, pwd!)) {
          bool adminMenu = true;
          while (adminMenu) {
            print("\n--- Menu Admin ---");
            print("1. Tambah Mahasiswa");
            print("2. Hapus Mahasiswa");
            print("3. Lihat Mahasiswa");
            print("4. Lihat Absensi");
            print("5. Cari Mahasiswa");
            print("6. Update Mahasiswa");
            print("7. Keluar");
            stdout.write("Pilih menu: ");
            var menu = stdin.readLineSync();

            switch (menu) {
              case "1":
                stdout.write("Masukkan NIM: ");
                var nim = stdin.readLineSync();
                stdout.write("Masukkan Nama: ");
                var nama = stdin.readLineSync();
                stdout.write("Masukkan Password: ");
                var pass = stdin.readLineSync();
                admin.tambahMahasiswa(daftarMahasiswa, Mahasiswa(nim!, nama!, pass!));
                break;
              case "2":
                stdout.write("Masukkan NIM yang ingin dihapus: ");
                var nim = stdin.readLineSync();
                admin.hapusMahasiswa(daftarMahasiswa, nim!);
                break;
              case "3":
                admin.lihatMahasiswa(daftarMahasiswa);
                break;
              case "4":
                absensi.lihatAbsensi();
                break;
              case "5":
                stdout.write("Masukkan NIM yang dicari: ");
                var nim = stdin.readLineSync();
                admin.cariMahasiswa(daftarMahasiswa, nim!);
                break;
              case "6":
                stdout.write("Masukkan NIM mahasiswa: ");
                var nim = stdin.readLineSync();
                stdout.write("Masukkan Nama baru: ");
                var nama = stdin.readLineSync();
                stdout.write("Masukkan Password baru: ");
                var pass = stdin.readLineSync();
                admin.updateMahasiswa(daftarMahasiswa, nim!, nama!, pass!);
                break;
              case "7":
                adminMenu = false;
                break;
              default:
                print("Menu tidak valid!");
            }
          }
        } else {
          print("Login Admin gagal!");
        }
        break;

      case "3":
        running = false;
        print("Terima kasih!");
        break;
      default:
        print("Pilihan tidak valid!");
    }
  }
}
