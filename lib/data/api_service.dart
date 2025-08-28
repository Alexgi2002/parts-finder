import 'dart:developer';

import 'package:dio/dio.dart';
import '../domain/models/site.dart';

class ApiService {
  final Dio _dio;

  ApiService({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<Site>> searchSites(String query) async {
    try {
      final response = await _dio.get(
        'http://10.76.7.124:3000/search',
        queryParameters: {'q': query},
        options: Options(
          sendTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(minutes: 5),
        )
      );
      log(response.statusCode.toString());
      log(response.data.toString());
      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        log(response.data['results'].toString());
        final result = response.data['results'] as List?;
        if (result == null) {
          throw Exception('Results is not a list');
        }

        return result
            .map((json) => Site.fromMap(json as Map<String, dynamic>))
            .toList();

      }
      else {
        throw Exception('Failed to load sites');
      }
    } catch (e) {
      log('Exception: $e');
      rethrow;
    }
  }
}
