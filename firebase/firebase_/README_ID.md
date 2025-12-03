# Firebase Authentication - Flutter

Aplikasi login dan register dengan Firebase Authentication seperti pada gambar yang diberikan.

## ✨ Fitur yang Sudah Diimplementasikan

✅ **Halaman Login** - Email & Password, Google Sign-In  
✅ **Halaman Register** - Email & Password, Google Sign-In  
✅ **Halaman Home** - Menampilkan info user yang login  
✅ **Auth Service** - Service untuk handle semua operasi autentikasi  
✅ **Auto Login** - Otomatis login jika user sudah pernah login sebelumnya  
✅ **Logout** - Logout dari aplikasi

## 📋 Langkah Setup Firebase

### Sebelum menjalankan aplikasi, Anda perlu setup Firebase terlebih dahulu:

1. **Install Firebase CLI dan FlutterFire**

   ```bash
   npm install -g firebase-tools
   dart pub global activate flutterfire_cli
   ```

2. **Login ke Firebase**

   ```bash
   firebase login
   ```

3. **Konfigurasi Firebase untuk project ini**

   ```bash
   cd /Users/mymacbook/Downloads/BootcampFlutter/firebase/firebase_
   flutterfire configure
   ```

   - Pilih project Firebase Anda (atau buat baru)
   - Pilih platform yang ingin didukung (Android, iOS, dll)
   - FlutterFire akan otomatis generate file konfigurasi

4. **Enable Authentication di Firebase Console**

   - Buka [Firebase Console](https://console.firebase.google.com/)
   - Pilih project Anda
   - Klik **Authentication** → **Sign-in method**
   - Enable **Email/Password**
   - Enable **Google**

5. **Untuk Google Sign-In di Android** (tambahan)
   - Dapatkan SHA-1 fingerprint:
     ```bash
     cd android
     ./gradlew signingReport
     ```
   - Copy SHA-1 dan tambahkan di Firebase Console → Project Settings → Your Android App

## 🚀 Menjalankan Aplikasi

```bash
# Install dependencies (sudah dilakukan)
flutter pub get

# Run aplikasi
flutter run
```

## 📁 Struktur Code

```
lib/
├── main.dart                    # Entry point, auth state management
├── firebase_options.dart        # Firebase config (auto-generated)
├── pages/
│   ├── login_page.dart         # Halaman login
│   ├── register_page.dart      # Halaman register
│   └── home_page.dart          # Halaman home
└── services/
    └── auth_service.dart       # Service Firebase Auth
```

## 🎨 UI Sesuai Gambar

- **Login Page**: Email field, password field (dengan show/hide), tombol "Masuk", tombol Google Sign-In, link ke register
- **Register Page**: Email field, password field (dengan show/hide), "Lupa password?" link, tombol "Masuk", tombol Google Sign-In, link kembali ke login
- **Home Page**: Menampilkan email user dan tombol logout

## 📝 Cara Pakai

1. Jalankan aplikasi, akan muncul **halaman login**
2. Klik **"Daftar"** untuk membuat akun baru
3. Isi email dan password, klik **"Masuk"** untuk register
4. Atau klik tombol **"Google"** untuk sign in dengan Google
5. Setelah berhasil, akan masuk ke **halaman home**
6. Klik icon **logout** di AppBar untuk keluar

## ⚠️ Catatan Penting

- File `firebase_options.dart` akan di-generate otomatis oleh `flutterfire configure`
- Jangan commit file konfigurasi Firebase ke repository publik
- Pastikan internet aktif untuk Firebase Authentication

## 🔧 Troubleshooting

**Error: No Firebase App**
→ Jalankan `flutterfire configure` terlebih dahulu

**Google Sign-In tidak berfungsi di Android**
→ Tambahkan SHA-1 fingerprint di Firebase Console

**Build error**
→ Jalankan `flutter clean && flutter pub get`

Untuk troubleshooting lengkap, lihat file `SETUP_GUIDE.md`.
