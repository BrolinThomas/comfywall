
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/photo.dart';


class UnsplashService {
  final String _baseUrl = 'https://api.unsplash.com';
  final String? _apiKey = dotenv.env['API_KEY'];

  Future<List<Photo>> fetchPhotos(int page) async {
    if (_apiKey == null || _apiKey.isEmpty) {
      throw Exception('API_KEY is not defined or empty in .env');
    }

    final response = await http.get(
      Uri.parse('$_baseUrl/photos?page=$page'),
      headers: {'Authorization': 'Client-ID $_apiKey'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos. Status code: ${response.statusCode}');
    }
  }
}
