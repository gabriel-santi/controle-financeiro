import 'package:finapp/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get translatedString => AppLocalizations.of(this);
}
