import 'package:flutter/material.dart';
import '../models/photo.dart';
import '../controllers/unsplash_service.dart';

class PhotoProvider extends ChangeNotifier {
  final UnsplashService _service = UnsplashService();
  final List<Photo> _photos = [];


  int _currentPage = 1;
  bool _isLoading = false;
  List<Photo> get photos => _photos;


  Future<void> fetchPhotos() async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();
    try {
      final newPhotos = await _service.fetchPhotos(_currentPage);
      _photos.addAll(newPhotos);
      _currentPage++;
    } catch (error) {
      print('Error fetching photos: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
