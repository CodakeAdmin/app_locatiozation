import 'package:app_locatization/locatization.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final LocalizationManager _localizationManager = LocalizationManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Localization Example'),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () => _showLanguageBottomSheet(context),
          ),
        ],
      ),
      body: Center(
        child: _localizationManager.localizedData == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _localizationManager.translate('greeting'),
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(_localizationManager.translate('wordCountLabel')),
                ],
              )
            : Text('Error loading JSON asset'),
      ),
    );
  }

  Future<void> _showLanguageBottomSheet(BuildContext context) async {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildLanguageTile('English (US)', Locale('en', 'US'), context),
            _buildLanguageTile('Español (ES)', Locale('es', 'ES'), context),
            _buildLanguageTile('Français (FR)', Locale('fr', 'FR'), context),
            _buildLanguageTile('Hindi (hi)', Locale('hi', 'HI'), context),
            // Add more languages as needed
          ],
        );
      },
    );
  }

  ListTile _buildLanguageTile(String language, Locale locale, BuildContext context) {
    return ListTile(
      title: Text(language),
      onTap: () {
        _localizationManager.changeLanguage(locale);
        Navigator.pop(context);
      },
    );
  }
}
