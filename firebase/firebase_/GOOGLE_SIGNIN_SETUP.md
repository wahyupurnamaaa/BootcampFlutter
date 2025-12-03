# 🔐 Panduan Aktivasi Google Sign-In

## 📋 Langkah 1: Aktifkan Google Sign-In di Firebase Console

### A. Buka Firebase Console

1. Buka: https://console.firebase.google.com
2. Login dengan akun Google Anda
3. Pilih project **firebase-bootcamp-flutter**

### B. Aktifkan Google Provider

1. Di sidebar kiri, klik **Build** → **Authentication**
2. Klik tab **"Sign-in method"**
3. Cari **"Google"** di daftar Sign-in providers
4. **Klik** pada baris **"Google"**

### C. Konfigurasi Google Sign-In

Di popup yang muncul:

1. **Toggle ON** switch "Enable"
2. **Project support email:** Pilih email Anda dari dropdown
3. Klik tombol **"Save"**

✅ **Google Sign-In sudah aktif!**

---

## 🚀 Langkah 2: Jalankan Aplikasi

### Rebuild & Restart Aplikasi

```bash
cd /Users/mymacbook/Downloads/BootcampFlutter/firebase/firebase_
flutter run -d chrome
```

**PENTING:** Karena ada perubahan di `index.html`, Anda **HARUS restart** aplikasi!

---

## 🧪 Langkah 3: Test Google Sign-In

1. **Di aplikasi yang sudah running:**

   - Klik tombol **"Google"** (ada icon G merah)
   - Akan muncul **popup Google Sign-In**
   - Pilih akun Google Anda
   - Klik **"Allow"** atau **"Izinkan"**

2. **Jika berhasil:**
   - Popup akan tertutup
   - Anda akan otomatis masuk ke **HomePage**
   - Email Google Anda akan ditampilkan

---

## 🐛 Troubleshooting

### Error: "Operasi tidak diizinkan"

**Penyebab:** Google Sign-In belum diaktifkan di Firebase Console  
**Solusi:**

- Pastikan sudah mengikuti **Langkah 1** di atas
- Periksa apakah Google sudah "Enabled" di Sign-in method

### Error: "Unauthorized domain"

**Penyebab:** Domain localhost belum ditambahkan ke authorized domains  
**Solusi:**

1. Di Firebase Console → Authentication → Settings
2. Klik tab **"Authorized domains"**
3. Pastikan ada **"localhost"** di daftar
4. Jika tidak ada, klik **"Add domain"** dan masukkan `localhost`

### Popup Google tidak muncul

**Penyebab:** Browser memblokir popup  
**Solusi:**

- Izinkan popup untuk localhost di browser Anda
- Chrome: Klik icon 🔒 atau ⓘ di address bar → Site settings → Popups → Allow

### Error: "Login dengan Google dibatalkan"

**Penyebab:** Anda menutup popup sebelum memilih akun  
**Solusi:**

- Klik tombol Google lagi
- Pilih akun dan klik Allow

---

## ✅ Fitur yang Sudah Ditambahkan

1. ✅ Firebase Auth script untuk web
2. ✅ Support Google Sign-In dengan popup (Web)
3. ✅ Support Google Sign-In native (Android/iOS)
4. ✅ Error handling yang jelas
5. ✅ Auto-redirect ke HomePage setelah berhasil login

---

## 📱 Platform Support

- ✅ **Web (Chrome)** - Menggunakan Firebase Auth Popup
- ✅ **Android** - Perlu tambahan konfigurasi SHA-1
- ✅ **iOS** - Perlu tambahan konfigurasi di Info.plist
- ⚠️ **macOS** - Perlu konfigurasi tambahan

---

## 🎯 Cara Cepat

1. **Aktifkan Google di Firebase Console** (Langkah 1)
2. **Restart aplikasi:** `flutter run -d chrome`
3. **Klik tombol Google** di app
4. **Pilih akun** dan izinkan
5. ✅ **Selesai!** Anda masuk dengan akun Google

---

## 📝 Catatan Penting

### Untuk Platform Web:

- ✅ **Sudah siap digunakan** setelah mengaktifkan di Firebase Console
- Menggunakan Firebase Auth Popup
- Tidak perlu konfigurasi tambahan

### Untuk Platform Android:

Jika ingin menggunakan di Android, perlu:

1. Generate SHA-1 certificate
2. Tambahkan SHA-1 ke Firebase Console
3. Download ulang `google-services.json`

### Untuk Platform iOS/macOS:

Perlu konfigurasi tambahan di:

- Info.plist
- URL Schemes
- Capabilities

---

## 🔍 Verifikasi Login Berhasil

Setelah berhasil login dengan Google, cek di:

1. **Firebase Console:**

   - Authentication → Users
   - Akan muncul user baru dengan provider "Google"
   - Email akan sama dengan email Google Anda

2. **Di Aplikasi:**
   - Akan pindah ke HomePage
   - Menampilkan email Anda
   - Tombol Logout tersedia

---

## 🎬 Demo Flow

```
Klik tombol "Google"
  ↓
Popup Google muncul
  ↓
Pilih akun Google
  ↓
Klik "Allow/Izinkan"
  ↓
Popup tertutup
  ↓
✅ Masuk ke HomePage!
```

---

**Selamat mencoba! Jika ada masalah, screenshot error dan tanyakan! 🚀**
