import 'package:dio/dio.dart';
import '../model/post_model.dart';

class PostController {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<List<PostModel>> getPosts() async {
    try {
      final response = await _dio.get('/posts');

      if (response.statusCode == 200) {
        final data = response.data as List;
        return data.map((json) => PostModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data. Code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Error Dio: ${e.message}');
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }
}