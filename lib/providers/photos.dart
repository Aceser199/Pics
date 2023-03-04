import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pics/models/photo.dart';

class Photos with ChangeNotifier {
  String apiBase = 'https://jsonplaceholder.typicode.com/photos';
  List<Photo> _photos = [];

  List<Photo> get photos {
    return [..._photos];
  }

  Photo getPhoto(int id) {
    return _photos.firstWhere((photo) => photo.id == id);
  }

  Future<void> fetchOnePhoto(int id) async {
    final response = await http.get(Uri.parse('$apiBase/$id'));
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final photo = Photo.fromJson(extractedData);
    _photos.add(photo);
    notifyListeners();
  }

  Future<void> fetchPhotos() async {
    final response = await http.get(Uri.parse(apiBase));
    final List<Photo> loadedPhotos = [];
    final extractedData = json.decode(response.body) as List<dynamic>;
    extractedData.asMap().forEach((_, photoData) {
      loadedPhotos.add(Photo.fromJson(photoData));
    });
    _photos = loadedPhotos;
    notifyListeners();
  }

  void addPhoto(Photo photo) {
    _photos.add(photo);
    notifyListeners();
  }
}
