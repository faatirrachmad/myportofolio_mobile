# MyPortfolio Mobile

Aplikasi portofolio pribadi berbasis Flutter untuk menampilkan identitas pemilik portofolio dan menyediakan kartu aksi untuk proyek. Proyek ini melanjutkan aplikasi Flutter yang dibuat pada Tutorial 08 untuk Individual Assignment 7: Basic Flutter.

## Fitur

- Menampilkan NPM, nama lengkap, dan kelas pemilik portofolio.
- Menampilkan tiga kartu aksi: Lihat Proyek, Tambah Proyek, dan Logout.
- Menggunakan warna latar yang berbeda untuk setiap kartu aksi.
- Menampilkan `SnackBar` yang menyebut nama kartu ketika kartu aksi ditekan.
- Memisahkan bootstrap aplikasi pada `lib/main.dart` dari halaman utama serta widget portofolio pada `lib/menu.dart`.

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
├── main.dart   # bootstrap MyApp dan konfigurasi MaterialApp
└── menu.dart   # MyHomePage, InfoCard, ItemHomepage, dan ItemCard
```

`MyApp` mengatur tema dan halaman awal. `MyHomePage` menyusun informasi profil dan kartu aksi. `InfoCard` menampilkan satu informasi profil, sedangkan `ItemHomepage` menyimpan data kartu aksi yang digunakan oleh `ItemCard`.

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

ChatGPT Codex digunakan untuk membantu membaca dan merangkum rubrik, meninjau struktur Flutter yang sudah ada, serta menyusun dokumentasi dan jawaban reflektif di README ini. Implementasi halaman dasar Tugas 7—`main.dart`, `menu.dart`, kartu profil, kartu aksi, dan `SnackBar`—sudah ada pada commit Tutorial 08 sebelum bantuan ini. Fitur Tugas 8 yang sempat dibuat karena PDF yang keliru kemudian dihapus melalui commit koreksi cakupan Tugas 7; riwayat commit sebelumnya tetap dipertahankan.

Strategi prompting adalah memberikan PDF/rubrik sebagai acuan, meminta pemeriksaan terhadap kode yang tersedia, lalu memperbaiki ruang lingkup setelah dokumen tugas yang benar diberikan. Saya mencocokkan deskripsi di README dengan kode Tugas 7 dan tidak mengklaim formulir atau penyimpanan data sebagai fitur aplikasi ini. Jawaban reflektif dibuat sebagai penjelasan konsep dan dikaitkan dengan widget yang benar-benar dipakai proyek.

Ringkasan prompt:

- “Kerjakan sesuai ketentuan penilaian dari tugasnya yang lengkap.”
- “Harusnya aku ngasih file tugas 7 ini ... tugas 7 yang harusnya dikerjain.”
- Instruksi lanjutan meminta isi README yang masih membahas Tugas 8 diganti agar sesuai Tugas 7.

Analisis dan penyesuaian akhir tetap perlu dijalankan pada lingkungan Flutter pemilik proyek. Pada sesi ini, perintah Dart/Flutter tidak memberikan keluaran dan menggantung, sehingga hasil `flutter analyze` belum dapat dikonfirmasi.
