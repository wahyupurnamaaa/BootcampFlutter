import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  print('Testing DummyJSON API...');
  
  // Test login
  try {
    print('\n1. Testing login...');
    final loginResponse = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'username': 'emilys',
        'password': 'emilyspass',
        'expiresInMins': 30,
      }),
    );
    
    print('Login Status: ${loginResponse.statusCode}');
    print('Login Response: ${loginResponse.body}\n');
    
    if (loginResponse.statusCode == 200) {
      final data = json.decode(loginResponse.body);
      print('✅ Login successful!');
      print('Token: ${data['accessToken']}\n');
    } else {
      print('❌ Login failed!');
    }
  } catch (e) {
    print('❌ Login error: $e\n');
  }
  
  // Test get users
  try {
    print('2. Testing get users...');
    final usersResponse = await http.get(
      Uri.parse('https://dummyjson.com/users?limit=3'),
    );
    
    print('Users Status: ${usersResponse.statusCode}');
    
    if (usersResponse.statusCode == 200) {
      final data = json.decode(usersResponse.body);
      final users = data['users'] as List;
      print('✅ Got ${users.length} users');
      
      for (var user in users) {
        print('  - ${user['firstName']} ${user['lastName']} (${user['email']})');
      }
    } else {
      print('❌ Get users failed!');
    }
  } catch (e) {
    print('❌ Get users error: $e');
  }
}
