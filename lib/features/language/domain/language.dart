import 'dart:ui';

enum Language {
  ingles("en", "US", "English"),
  portugues("pt", "BR", "Português"),
  espanhol("es", null, "Español"),
  frances("fr", null, "Français");

  final String languageCode;
  final String? countryCode;
  final String description;

  const Language(this.languageCode, this.countryCode, this.description);

  Locale get locale => Locale(languageCode, countryCode);
}
