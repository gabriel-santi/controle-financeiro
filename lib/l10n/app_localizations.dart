import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('pt')
  ];

  /// No description provided for @requiredField.
  ///
  /// In pt, this message translates to:
  /// **'Preencha este campo'**
  String get requiredField;

  /// No description provided for @askName.
  ///
  /// In pt, this message translates to:
  /// **'Como gostaria de ser chamado?'**
  String get askName;

  /// No description provided for @save.
  ///
  /// In pt, this message translates to:
  /// **'Salvar'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In pt, this message translates to:
  /// **'Cancelar'**
  String get cancel;

  /// No description provided for @next.
  ///
  /// In pt, this message translates to:
  /// **'Avançar'**
  String get next;

  /// No description provided for @select.
  ///
  /// In pt, this message translates to:
  /// **'Selecionar'**
  String get select;

  /// No description provided for @create.
  ///
  /// In pt, this message translates to:
  /// **'Criar'**
  String get create;

  /// No description provided for @delete.
  ///
  /// In pt, this message translates to:
  /// **'Excluir'**
  String get delete;

  /// No description provided for @deleteCategory.
  ///
  /// In pt, this message translates to:
  /// **'Excluir categoria?'**
  String get deleteCategory;

  /// No description provided for @deleteConfirmation.
  ///
  /// In pt, this message translates to:
  /// **'Deseja mesmo excluir?'**
  String get deleteConfirmation;

  /// No description provided for @nCategory.
  ///
  /// In pt, this message translates to:
  /// **'{count, plural, =0{Nenhuma categoria encontrada} =1{Categoria} other{Categorias}}'**
  String nCategory(num count);

  /// No description provided for @editCategory.
  ///
  /// In pt, this message translates to:
  /// **'Editar categoria'**
  String get editCategory;

  /// No description provided for @newCategory.
  ///
  /// In pt, this message translates to:
  /// **'Nova categoria'**
  String get newCategory;

  /// No description provided for @categoryDeleteSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Categoria excluída com sucesso'**
  String get categoryDeleteSuccess;

  /// No description provided for @categoryDeleteFailure.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível excluir categoria'**
  String get categoryDeleteFailure;

  /// No description provided for @categorySaveSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Categoria salva com sucesso'**
  String get categorySaveSuccess;

  /// No description provided for @categorySaveFailure.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível salvar categoria'**
  String get categorySaveFailure;

  /// No description provided for @transaction.
  ///
  /// In pt, this message translates to:
  /// **'Transação'**
  String get transaction;

  /// No description provided for @newTransaction.
  ///
  /// In pt, this message translates to:
  /// **'Nova transação'**
  String get newTransaction;

  /// No description provided for @editTransaction.
  ///
  /// In pt, this message translates to:
  /// **'Editar transação'**
  String get editTransaction;

  /// No description provided for @transactionDeleteSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Transação excluída com sucesso'**
  String get transactionDeleteSuccess;

  /// No description provided for @transactionDeleteFailure.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível excluir transação'**
  String get transactionDeleteFailure;

  /// No description provided for @transactionSaveSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Transação salva com sucesso'**
  String get transactionSaveSuccess;

  /// No description provided for @transactionSaveFailure.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível salvar transação'**
  String get transactionSaveFailure;

  /// No description provided for @allTransactionsLinkedWillBeAffected.
  ///
  /// In pt, this message translates to:
  /// **'Todas as transações vinculadas a essa categoria serão afetadas'**
  String get allTransactionsLinkedWillBeAffected;

  /// No description provided for @selectColor.
  ///
  /// In pt, this message translates to:
  /// **'Selecione uma cor'**
  String get selectColor;

  /// No description provided for @selectLanguage.
  ///
  /// In pt, this message translates to:
  /// **'Selecione o idioma'**
  String get selectLanguage;

  /// No description provided for @color.
  ///
  /// In pt, this message translates to:
  /// **'Cor'**
  String get color;

  /// No description provided for @description.
  ///
  /// In pt, this message translates to:
  /// **'Descrição'**
  String get description;

  /// No description provided for @value.
  ///
  /// In pt, this message translates to:
  /// **'Valor'**
  String get value;

  /// No description provided for @earn.
  ///
  /// In pt, this message translates to:
  /// **'Ganho'**
  String get earn;

  /// No description provided for @spent.
  ///
  /// In pt, this message translates to:
  /// **'Gasto'**
  String get spent;

  /// No description provided for @welcome.
  ///
  /// In pt, this message translates to:
  /// **'Seja bem-vindo(a), {username}'**
  String welcome(Object username);

  /// No description provided for @moves.
  ///
  /// In pt, this message translates to:
  /// **'Movimentações'**
  String get moves;

  /// No description provided for @percentageExpenses.
  ///
  /// In pt, this message translates to:
  /// **'Percentual de Gastos'**
  String get percentageExpenses;

  /// No description provided for @selectedMonth.
  ///
  /// In pt, this message translates to:
  /// **'Mês selecionado'**
  String get selectedMonth;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'fr', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
