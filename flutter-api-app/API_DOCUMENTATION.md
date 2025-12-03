# API Documentation - DummyJSON

## Base URL

```
https://dummyjson.com
```

## 📍 Endpoints yang Digunakan

### 1. Login (POST)

```
POST https://dummyjson.com/auth/login
```

**Request Body:**

```json
{
  "username": "emilys",
  "password": "emilyspass",
  "expiresInMins": 30
}
```

**Response:**

```json
{
  "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "id": 1,
  "username": "emilys",
  "email": "emily.johnson@x.dummyjson.com",
  "firstName": "Emily",
  "lastName": "Johnson",
  "gender": "female",
  "image": "https://dummyjson.com/icon/emilys/128"
}
```

**Test dengan curl:**

```bash
curl -X POST https://dummyjson.com/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"emilys","password":"emilyspass"}'
```

---

### 2. Get Users (GET)

```
GET https://dummyjson.com/users?limit=10
```

**Response:**

```json
{
  "users": [
    {
      "id": 1,
      "firstName": "Emily",
      "lastName": "Johnson",
      "email": "emily.johnson@x.dummyjson.com",
      "image": "https://dummyjson.com/icon/emilys/128"
    },
    ...
  ],
  "total": 208,
  "skip": 0,
  "limit": 10
}
```

**Test dengan curl:**

```bash
curl https://dummyjson.com/users?limit=10
```

---

### 3. Get Single User (GET)

```
GET https://dummyjson.com/users/{id}
```

**Response:**

```json
{
  "id": 1,
  "firstName": "Emily",
  "lastName": "Johnson",
  "email": "emily.johnson@x.dummyjson.com",
  "image": "https://dummyjson.com/icon/emilys/128"
}
```

**Test dengan curl:**

```bash
curl https://dummyjson.com/users/1
```

---

## 🔐 Test Credentials

| Username | Password     |
| -------- | ------------ |
| emilys   | emilyspass   |
| michaelw | michaelwpass |
| sophiab  | sophiabpass  |
| jamesd   | jamesdpass   |

---

## 🛠️ Cara Melihat/Monitor API

### 1. **Menggunakan Browser**

Buka langsung di browser:

- https://dummyjson.com/users?limit=10
- https://dummyjson.com/users/1

### 2. **Menggunakan curl (Terminal)**

```bash
# Login
curl -X POST https://dummyjson.com/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"emilys","password":"emilyspass"}'

# Get users
curl https://dummyjson.com/users?limit=5

# Get single user
curl https://dummyjson.com/users/2
```

### 3. **Menggunakan Postman/Insomnia**

1. Download Postman: https://www.postman.com/downloads/
2. Import endpoints di atas
3. Test API secara visual

### 4. **Menggunakan Flutter DevTools**

```bash
# Jalankan aplikasi
flutter run -d macos

# Buka DevTools di browser (lihat link di terminal)
# Network tab akan menampilkan semua API calls
```

### 5. **Melihat Log di Aplikasi Flutter**

Saya sudah menambahkan logging di `api_service.dart`:

```dart
print('🔵 Attempting login with username: $username');
print('🔵 Login response status: ${response.statusCode}');
print('🔵 Login response body: ${response.body}');
```

Log akan muncul di terminal saat menjalankan `flutter run`

---

## 📚 Dokumentasi Lengkap API

https://dummyjson.com/docs

---

## 🧪 Test Script

Jalankan test script yang sudah saya buat:

```bash
cd /Users/mymacbook/Downloads/api-/api
dart test_api.dart
```
