# 🔐 Panduan Lengkap Login Firebase

## ❗ PENTING - Aktifkan Firebase Authentication Dulu!

### Langkah 1: Buka Firebase Console

1. Buka browser, pergi ke: https://console.firebase.google.com
2. Login dengan akun Google Anda
3. Pilih project **firebase-bootcamp-flutter**

### Langkah 2: Aktifkan Email/Password Authentication

1. Di sidebar kiri, klik **Build** → **Authentication**
2. Klik tombol **Get Started** (jika baru pertama kali)
3. Klik tab **Sign-in method**
4. Cari **Email/Password** di daftar
5. Klik **Email/Password**
6. **TOGGLE ON** switch yang bertuliskan "Enable"
7. Klik **Save**

**✅ Sekarang Firebase Authentication sudah aktif!**

---

## 🚀 Cara Menggunakan Aplikasi

### A. REGISTRASI (Daftar Akun Baru)

1. **Jalankan aplikasi:**

   ```bash
   cd /Users/mymacbook/Downloads/BootcampFlutter/firebase/firebase_
   flutter run -d chrome
   ```

2. **Di aplikasi:**
   - Klik **"Daftar"** di bagian bawah
   - Masukkan email (contoh: `test@example.com`)
   - Masukkan password (minimal 6 karakter, contoh: `123456`)
   - Klik tombol **"Daftar"**
   - Jika berhasil, Anda akan otomatis masuk ke HomePage

### B. LOGIN (Masuk dengan Akun yang Sudah Ada)

1. **Di halaman login:**
   - Masukkan email yang sudah didaftarkan
   - Masukkan password yang benar
   - Klik tombol **"Masuk"**
   - Jika berhasil, akan masuk ke HomePage

---

## 🐛 Troubleshooting - Jika Masih Tidak Bisa Login

### Error: "Email tidak ditemukan"

**Penyebab:** Email belum didaftar  
**Solusi:**

- Pastikan Anda sudah **Daftar** terlebih dahulu
- Atau cek di Firebase Console → Authentication → Users, apakah email sudah terdaftar

### Error: "Password salah"

**Penyebab:** Password yang dimasukkan salah  
**Solusi:**

- Coba ingat password yang digunakan saat daftar
- Password minimal 6 karakter

### Error: "Operasi tidak diizinkan"

**Penyebab:** Email/Password belum diaktifkan di Firebase Console  
**Solusi:**

- Ikuti **Langkah 2** di atas untuk mengaktifkan Email/Password

### Error: "Format email tidak valid"

**Penyebab:** Email tidak mengandung karakter @  
**Solusi:**

- Gunakan format email yang benar: `nama@domain.com`

---

## ✅ Validasi yang Sudah Ditambahkan

Aplikasi sekarang akan mengecek:

- ✅ Email tidak boleh kosong
- ✅ Email harus mengandung karakter @
- ✅ Password tidak boleh kosong
- ✅ Password minimal 6 karakter (saat registrasi)
- ✅ Pesan error yang jelas dan mudah dipahami

---

## 📝 Contoh Akun untuk Testing

Setelah mengaktifkan Authentication di Firebase Console, coba buat akun dengan:

- **Email:** `test@test.com`
- **Password:** `123456`

---

## 🔍 Cara Cek Akun yang Terdaftar

1. Buka Firebase Console: https://console.firebase.google.com
2. Pilih project **firebase-bootcamp-flutter**
3. Klik **Authentication** → **Users**
4. Di sini Anda bisa lihat semua akun yang sudah terdaftar

---

## 📱 Platform yang Didukung

- ✅ **Web (Chrome)** - Firebase sudah dikonfigurasi
- ✅ **Android** - Firebase sudah dikonfigurasi
- ❌ **macOS/iOS** - Perlu konfigurasi tambahan dengan `flutterfire configure`

---

## 🎯 Kesimpulan

**Langkah Cepat:**

1. Aktifkan Email/Password di Firebase Console
2. Jalankan app: `flutter run -d chrome`
3. Klik "Daftar" → Isi email & password → Daftar
4. Selesai! Anda sudah login

**Jika masih bingung, screenshot error yang muncul dan tanyakan lagi!**
