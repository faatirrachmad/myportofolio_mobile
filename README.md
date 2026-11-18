# MyPortfolio Mobile

Aplikasi portofolio pribadi berbasis Flutter untuk menampilkan identitas pemilik portofolio, menavigasi halaman, dan mengisi formulir proyek. Proyek ini melanjutkan aplikasi Flutter Tutorial 08 dengan materi Tutorial 09: Flutter Navigation, Layouts, Forms, and Input Elements.

## Fitur

- Menampilkan NPM, nama lengkap, dan kelas pemilik portofolio.
- Menampilkan tiga kartu aksi: Lihat Proyek, Tambah Proyek, dan Logout.
- Menggunakan warna latar yang berbeda untuk setiap kartu aksi.
- Menampilkan `SnackBar` yang menyebut nama kartu ketika kartu aksi ditekan.
- Menyediakan drawer untuk berpindah ke halaman utama atau formulir tambah proyek.
- Menavigasikan kartu Tambah Proyek ke formulir dengan `Navigator.push()`.
- Memvalidasi nama dan deskripsi proyek, lalu menampilkan kategori, teknologi, dan tautan yang diisi pada dialog konfirmasi.
- Memisahkan halaman di `lib/screens/` dan widget bersama di `lib/widgets/`.

## Menjalankan aplikasi

Pastikan Flutter SDK sudah terpasang dan tersedia di `PATH`. Jalankan perintah berikut dari direktori proyek:

```bash
flutter pub get
flutter run
```

Jalankan analisis statis dari direktori utama proyek:

```bash
flutter analyze
```

## Struktur proyek

```text
lib/
├── main.dart                  # bootstrap MyApp dan konfigurasi MaterialApp
├── screens/
│   ├── menu.dart              # halaman utama dan InfoCard
│   └── project_form.dart      # formulir proyek dan dialog konfirmasi
└── widgets/
    ├── left_drawer.dart       # navigasi halaman utama dan formulir
    └── project_card.dart     # model ItemHomepage dan kartu aksi
```

`MyApp` mengatur tema dan halaman awal. `MyHomePage` menyusun informasi profil dan kartu aksi. `ProjectFormPage` menangani input dan validasi proyek. `LeftDrawer` menyediakan navigasi dari kedua halaman.

## Jawaban reflektif

### Tugas 7

1. **Apa itu widget tree dan bagaimana hubungan induk-anak bekerja?**

   Widget tree adalah susunan widget Flutter yang saling membungkus dan memiliki hubungan parent-child. Pada aplikasi ini, `MyApp` membangun `MaterialApp`, yang menampilkan `MyHomePage`. Di dalam halaman tersebut, `Scaffold` menjadi kerangka layar dan memiliki `AppBar` serta `body`. `body` berisi `SafeArea`, `SingleChildScrollView`, dan `Column`; kolom itu menyusun kartu profil serta `GridView` kartu aksi. Parent menentukan tata letak dan menyediakan konteks bagi child, sementara child membentuk bagian antarmuka yang lebih kecil.

2. **Widget apa saja yang digunakan dan apa fungsinya?**

   `MyApp`, `MyHomePage`, `InfoCard`, dan `ItemCard` adalah widget buatan aplikasi. `MaterialApp` mengatur tema dan halaman awal. `Scaffold` menyediakan struktur halaman, `AppBar` menampilkan judul, dan `SafeArea` menjaga konten dari area sistem. `SingleChildScrollView` memungkinkan halaman digulir; `Column` dan `Row` mengatur susunan vertikal dan horizontal. `GridView.count` menata kartu aksi dalam grid. `InfoCard` membungkus informasi profil dengan `Card`, `SizedBox`, `Padding`, dan `Text`. `ItemCard` memakai `Material`, `InkWell`, `Container`, `Center`, `Column`, `Icon`, dan `Text` untuk kartu aksi yang dapat ditekan. `SizedBox` juga dipakai untuk memberi jarak. `SnackBar` menampilkan umpan balik melalui `ScaffoldMessenger` saat kartu ditekan. `ItemHomepage` adalah model data, bukan widget.

3. **Apa fungsi `MaterialApp` dan mengapa digunakan sebagai root widget?**

   `MaterialApp` menyiapkan fitur tingkat aplikasi untuk antarmuka bergaya Material, termasuk tema dan navigator. Widget ini menjadi root agar pengaturan tersebut tersedia bagi halaman-halaman turunannya. Di aplikasi ini, `MyApp` mengatur `ColorScheme` melalui `ThemeData` dan menunjuk `MyHomePage` sebagai halaman awal. Dengan begitu, widget anak dapat memakai tema yang sama melalui `Theme.of(context)`.

4. **Apa perbedaan `StatelessWidget` dan `StatefulWidget`, dan kapan digunakan?**

   `StatelessWidget` menggambarkan antarmuka dari konfigurasi yang diberikan dan tidak mengelola state yang berubah di dalam widget tersebut. `StatefulWidget` dipakai ketika tampilan perlu berubah selama widget hidup, dengan state yang dikelola oleh objek `State` dan diperbarui, misalnya, menggunakan `setState()`. Halaman dan kartu pada proyek ini menggunakan `StatelessWidget` karena tidak menyimpan data yang berubah. Saat kartu ditekan, `ScaffoldMessenger` menampilkan `SnackBar`; aplikasi tidak perlu mengubah state halaman untuk itu.

5. **Apa itu `BuildContext` dan bagaimana digunakan di `build`?**

   `BuildContext` menunjukkan posisi sebuah widget di dalam widget tree dan memungkinkan widget mencari layanan atau konfigurasi dari ancestor-nya. Pada `build`, context digunakan untuk membaca warna tema melalui `Theme.of(context)` dan ukuran layar melalui `MediaQuery.of(context)`. Context pada `ItemCard` juga dipakai oleh `ScaffoldMessenger.of(context)` untuk menemukan scaffold terdekat dan menampilkan `SnackBar`. Karena itu context harus berasal dari bagian tree yang berada di bawah layanan yang ingin digunakan.

6. **Apa perbedaan hot reload dan hot restart? Kapan perlu restart penuh?**

   Hot reload memasukkan perubahan kode Dart ke aplikasi yang sedang berjalan dan mempertahankan state saat ini bila memungkinkan. Hot restart menjalankan ulang kode aplikasi dari awal sehingga state di memori dibuat ulang. Restart penuh diperlukan jika perubahan tidak dapat diterapkan oleh hot reload, misalnya perubahan kode native/platform, konfigurasi plugin, atau inisialisasi yang hanya berjalan saat aplikasi mulai. Untuk perubahan tampilan Dart biasa, hot reload biasanya cukup; untuk memeriksa alur inisialisasi dari keadaan awal, gunakan hot restart.

## Disclosure penggunaan AI

ChatGPT Codex digunakan untuk membaca Tutorial 09 beserta rubrik prasyaratnya, meninjau kode awal, menerapkan navigasi, drawer, formulir, validasi, dialog konfirmasi, dan refactoring folder. Implementasi mengikuti [Tutorial 09 PBP UI](https://pbp.cs.ui.ac.id/tutorial/tutorial-9.html). Formulir hanya menampilkan konfirmasi dan belum menyimpan data proyek ke database, sesuai langkah tutorial.
