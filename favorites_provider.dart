import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<String> _favoriteRaagas = [
    'Natakapriya',
    'Roopavathi',
    'Gayakapriya',
    'Dhenuka',
    'Ganamurti',
  ];

  List<String> get favoriteRaagas => _favoriteRaagas;

  void addRaaga(String raagaName) {
    if (!_favoriteRaagas.contains(raagaName)) {
      _favoriteRaagas.add(raagaName);
      notifyListeners();
    }
  }

  void removeRaaga(String raagaName) {
    _favoriteRaagas.remove(raagaName);
    notifyListeners();
  }

  bool isFavorite(String raagaName) {
    return _favoriteRaagas.contains(raagaName);
  }
}
