/* import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Localization Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic>? jsonData;
  Locale _currentLocale = Locale('en', 'US');

  @override
  void initState() {
    super.initState();
    loadJsonAsset();
  }

  Future<void> loadJsonAsset() async {
    try {
      String assetPath =
          'assets/locale/${_currentLocale.languageCode}-${_currentLocale.countryCode}.json';
      String jsonContent = await rootBundle.loadString(assetPath);

      if (jsonContent.isEmpty) {
        throw Exception('JSON content is empty');
      }

      setState(() {
        jsonData = json.decode(jsonContent);
      });

      print('Loaded JSON data: $jsonData');
    } catch (e) {
      print('Error loading asset: $e');
    }
  }

  Future<void> _showLanguageBottomSheet() async {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildLanguageTile('English (US)', Locale('en', 'US')),
            _buildLanguageTile('Español (ES)', Locale('es', 'ES')),
            _buildLanguageTile('Français (FR)', Locale('fr', 'FR')),
            _buildLanguageTile('Hindi (hi)', Locale('hi', 'HI')),
            // Add more languages as needed
          ],
        );
      },
    );
  }

  ListTile _buildLanguageTile(String language, Locale locale) {
    return ListTile(
      title: Text(language),
      onTap: () {
        _changeLanguage(locale);
        Navigator.pop(context);
      },
    );
  }

  void _changeLanguage(Locale newLocale) {
    setState(() {
      _currentLocale = newLocale;
    });
    loadJsonAsset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Localization Example'),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: _showLanguageBottomSheet,
          ),
        ],
      ),
      body: Center(
        child: jsonData != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // You can display other localized strings here
                  Text(
                    jsonData!['greeting'],
                    style: TextStyle(fontSize: 20),
                  ),

                  Text(jsonData!['wordCountLabel'])
                ],
              )
            : Text('Error loading JSON asset'),
      ),
    );
  }
}
 */



import 'package:app_locatization/home_page.dart';
import 'package:app_locatization/locatization.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LocalizationManager _localizationManager = LocalizationManager();

  MyApp() {
    _localizationManager.setDefaultLanguage(Locale('en', 'US'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Localization Example',
      locale: _localizationManager.currentLocale,
      localizationsDelegates: [
        // Add your localizations delegates here
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('fr', 'FR'),
        Locale('hi', 'IN'),
        // Add more supported locales
      ],
      home: MyHomePage(),
    );
  }
}
