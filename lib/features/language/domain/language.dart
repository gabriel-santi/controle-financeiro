import 'dart:ui';

enum Language {
  ingles("en", "US"),
  portugues("pt", "BR"),
  espanhol("es", null),
  frances("fr", null);

  final String languageCode;
  final String? countryCode;

  const Language(this.languageCode, this.countryCode);

  Locale get locale => Locale(languageCode, countryCode);
}
