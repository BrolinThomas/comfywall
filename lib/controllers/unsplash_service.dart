import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/photo.dart';

class UnsplashService {
  final String _baseUrl = 'https://api.unsplash.com';
  final String _apiKey = '3lPBDRQ3hHIVqt4MHkYblc9yzdVacxonRKh-5ZtI8kY';

  Future<List<Photo>> fetchPhotos(int page) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/photos?page=$page'),
      headers: {'Authorization': 'Client-ID $_apiKey'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
