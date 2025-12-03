# Firebase Authentication Flutter App

Aplikasi Flutter dengan Firebase Authentication yang mendukung login/register menggunakan Email & Password serta Google Sign-In.

## Fitur

- ✅ Login dengan Email & Password
- ✅ Register akun baru dengan Email & Password
- ✅ Google Sign-In
- ✅ Logout
- ✅ Auth State Management

## Setup Firebase

### 1. Buat Project Firebase

1. Kunjungi [Firebase Console](https://console.firebase.google.com/)
2. Klik "Add project" atau "Create a project"
3. Ikuti langkah-langkah untuk membuat project baru

### 2. Enable Authentication

1. Di Firebase Console, pilih project Anda
2. Klik "Authentication" di menu kiri
3. Klik tab "Sign-in method"
4. Enable **Email/Password**
5. Enable **Google** sign-in provider

### 3. Install Firebase CLI & FlutterFire

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login ke Firebase
firebase login

# Install FlutterFire CLI
dart pub global activate flutterfire_cli
```

### 4. Configure Firebase untuk Flutter

Jalankan perintah berikut di root project:

```bash
flutterfire configure
```

Pilih project Firebase Anda dan platform yang ingin didukung (Android, iOS, Web, dll).

Perintah ini akan:

- Membuat/update file `firebase_options.dart`
- Mengkonfigurasi Firebase untuk setiap platform

### 5. Setup Platform-Specific

#### Android

1. File `google-services.json` sudah otomatis ditambahkan oleh FlutterFire
2. Pastikan di `android/build.gradle.kts` sudah ada:

```kotlin
dependencies {
    classpath("com.google.gms:google-services:4.4.0")
}
```

3. Di `android/app/build.gradle.kts`, tambahkan di bagian bawah:

```kotlin
apply(plugin = "com.google.gms.google-services")
```

#### iOS

1. File `GoogleService-Info.plist` sudah otomatis ditambahkan
2. Buka `ios/Runner.xcworkspace` di Xcode
3. Update Bundle Identifier sesuai dengan yang ada di Firebase Console
4. Untuk Google Sign-In, tambahkan URL Scheme:
   - Buka `GoogleService-Info.plist`
   - Copy nilai `REVERSED_CLIENT_ID`
   - Buka `Info.plist` dan tambahkan:

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>REVERSED_CLIENT_ID_VALUE_HERE</string>
        </array>
    </dict>
</array>
```

### 6. Install Dependencies

```bash
flutter pub get
```

## Menjalankan Aplikasi

```bash
# Run di emulator/device
flutter run

# Build untuk production
flutter build apk  # Android
flutter build ios  # iOS
```

## Struktur Project

```
lib/
├── main.dart                 # Entry point & auth state management
├── firebase_options.dart     # Firebase configuration
├── pages/
│   ├── login_page.dart      # Halaman login
│   ├── register_page.dart   # Halaman register
│   └── home_page.dart       # Halaman home (setelah login)
└── services/
    └── auth_service.dart    # Firebase Auth service
```

## Troubleshooting

### Google Sign-In tidak berfungsi di Android

1. Pastikan SHA-1 fingerprint sudah ditambahkan di Firebase Console:

```bash
# Debug SHA-1
cd android
./gradlew signingReport
```

2. Copy SHA-1 fingerprint dan tambahkan di:
   Firebase Console → Project Settings → Your Android App → Add fingerprint

### Error: MissingPluginException

```bash
flutter clean
flutter pub get
cd android && ./gradlew clean
cd ios && pod install
```

### Error saat build iOS

```bash
cd ios
pod install --repo-update
cd ..
flutter clean
flutter pub get
```

## Catatan Penting

⚠️ **JANGAN commit file konfigurasi Firebase ke repository publik:**

- `google-services.json` (Android)
- `GoogleService-Info.plist` (iOS)
- `firebase_options.dart` (jika berisi kredensial sensitif)

Tambahkan ke `.gitignore`:

```
**/google-services.json
**/GoogleService-Info.plist
```

## Lisensi

MIT License
