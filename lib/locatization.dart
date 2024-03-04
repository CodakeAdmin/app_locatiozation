import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocalizationManager {
  Locale _currentLocale = Locale('en', 'US');
  Locale _defaultLocale = Locale('en', 'US');
  Map<String, dynamic>? _localizedData;

  Locale get currentLocale => _currentLocale;
  Locale get defaultLocale => _defaultLocale;

  Future<void> loadJsonAsset() async {
    try {
      String assetPath =
          'assets/locale/${_currentLocale.languageCode}-${_currentLocale.countryCode}.json';
      String jsonContent = await rootBundle.loadString(assetPath);

      if (jsonContent.isEmpty) {
        throw Exception('JSON content is empty');
      }

      _localizedData = json.decode(jsonContent);

      print('Loaded JSON data: $_localizedData');
    } catch (e) {
      print('Error loading asset: $e');
    }
  }

  String translate(String key) {
    return _localizedData?[key] ?? key;
  }

  void changeLanguage(Locale newLocale) {
    _currentLocale = newLocale;
    loadJsonAsset();
  }

  void setDefaultLanguage(Locale defaultLocale) {
    _defaultLocale = defaultLocale;
  }
  
  Map<String, dynamic>? get localizedData => _localizedData;
}
