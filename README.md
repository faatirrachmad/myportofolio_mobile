# MyPortfolio Mobile

Aplikasi portofolio pribadi berbasis Flutter untuk mencatat riwayat edukasi, pengalaman, dan sertifikasi. Aplikasi ini dibuat sebagai kelanjutan proyek portofolio mobile pada mata kuliah Pemrograman Berbasis Platform.

## Fitur

- Halaman utama menampilkan identitas mahasiswa dan kartu aksi.
- Formulir tambah proyek dapat dibuka dari kartu aksi maupun drawer.
- Formulir menerima kategori, nama proyek atau posisi, institusi, tanggal, deskripsi, dan URL opsional.
- Validasi menolak kolom wajib yang kosong atau hanya berisi spasi, membatasi panjang teks, dan memeriksa URL HTTP/HTTPS.
- Tanggal dipilih melalui date picker. Setelah semua isian valid, dialog menampilkan ringkasan data.
- Drawer yang sama tersedia di halaman utama dan formulir. Opsi Home kembali ke halaman utama.

## Menjalankan aplikasi

Pastikan Flutter SDK sudah terpasang dan tersedia di `PATH`, lalu jalankan dari direktori proyek:

```bash
flutter pub get
flutter run
```

Untuk memeriksa analisis statis:

```bash
flutter analyze
```

## Struktur utama

```text
lib/
├── main.dart
├── screens/
│   ├── home_page.dart
│   └── project_form_page.dart
└── widgets/
    ├── action_card.dart
    ├── app_drawer.dart
    └── info_card.dart
```

Halaman utama dan formulir dipisahkan di `screens/`. Komponen drawer dan kartu yang dipakai ulang berada di `widgets/`.

## Jawaban reflektif

### Tugas 8

1. `Navigator.push()` menambahkan halaman baru ke atas navigation stack, sehingga halaman sebelumnya tetap tersedia saat tombol kembali ditekan. `Navigator.pushReplacement()` mengganti halaman saat ini dengan halaman baru, sedangkan `Navigator.pop()` menutup halaman teratas dan kembali ke halaman sebelumnya. Kartu Tambah Proyek memakai `push` agar formulir dapat ditutup dan pengguna kembali ke halaman utama. Opsi Home pada drawer menutup drawer lalu mengembalikan stack ke halaman utama.

2. `Scaffold` memberi struktur halaman yang konsisten, termasuk `AppBar`, `Drawer`, dan area konten. Drawer dibuat sebagai widget bersama agar identitas serta opsi navigasi sama pada halaman utama dan formulir. Tema `ColorScheme` aplikasi digunakan oleh komponen Material, sehingga warna tombol, ikon, dan elemen antarmuka mengikuti tema portofolio yang sama.

3. Formulir menggunakan `SingleChildScrollView` dengan susunan vertikal dan jarak antar input. Pada layar sempit maupun saat keyboard muncul, pengguna dapat menggulir halaman sampai tombol Simpan. `SafeArea` menjaga konten dari area sistem seperti notch dan navigation bar.

4. `GlobalKey<FormState>` memberi akses ke state `Form`; setiap `TextFormField` dan `FormField` menyediakan `validator`, lalu tombol Simpan memanggil `validate()`. Contohnya, nama yang kosong atau hanya berisi spasi ditolak, dan URL harus memakai skema HTTP atau HTTPS. `DropdownButtonFormField` membatasi kategori ke pilihan yang tersedia, sedangkan tanggal dipilih dengan date picker agar format tanggal tidak bergantung pada input teks bebas.

## Disclosure penggunaan AI

Saya menggunakan ChatGPT Codex untuk membantu mengimplementasikan pemisahan halaman dan widget, navigasi drawer, formulir, validasi, dialog ringkasan, dan penyusunan dokumentasi. Strategi prompting yang digunakan adalah memberikan instruksi tugas beserta rubrik, lalu mengerjakan fitur dalam tahap kecil dengan commit terpisah agar perubahan dapat ditinjau sebelum melanjutkan.

Saya meninjau dan menyesuaikan hasilnya terhadap struktur proyek Flutter yang tersedia, terutama alur `push`/`pop`, validasi kolom, dan navigasi Home dari drawer. AI tidak menjalankan aplikasi di perangkat saya. Formulir saat ini hanya menampilkan ringkasan setelah disimpan; data belum disimpan ke database atau dipertahankan setelah aplikasi ditutup. Karena itu, hasil dialog bukan penyimpanan persisten.

Ringkasan prompt yang digunakan:

- “Kerjakan sesuai ketentuan penilaian dari tugasnya yang lengkap.”
- “Pisah menjadi beberapa commit; kerjakan satu tahap, berikan pesan commit, lalu lanjut setelah saya commit. README jadikan commit terakhir.”
- Saat menindaklanjuti fitur: minta formulir proyek, validasi, dialog ringkasan, dan akses melalui kartu beranda serta drawer.
