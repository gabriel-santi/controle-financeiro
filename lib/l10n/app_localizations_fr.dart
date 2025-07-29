import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get requiredField => 'Veuillez remplir ce champ';

  @override
  String get askName => 'Comment souhaitez-vous être appelé ?';

  @override
  String get save => 'Enregistrer';

  @override
  String get cancel => 'Annuler';

  @override
  String get next => 'Suivant';

  @override
  String get select => 'Sélectionner';

  @override
  String get create => 'Créer';

  @override
  String get delete => 'Supprimer';

  @override
  String get deleteCategory => 'Supprimer la catégorie ?';

  @override
  String get deleteConfirmation => 'Êtes-vous sûr de vouloir supprimer ?';

  @override
  String nCategory(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Catégories',
      one: 'Catégorie',
      zero: 'Aucune catégorie trouvée',
    );
    return '$_temp0';
  }

  @override
  String get editCategory => 'Modifier la catégorie';

  @override
  String get newCategory => 'Nouvelle catégorie';

  @override
  String get categoryDeleteSuccess => 'Catégorie supprimée avec succès';

  @override
  String get categoryDeleteFailure => 'Impossible de supprimer la catégorie';

  @override
  String get categorySaveSuccess => 'Catégorie enregistrée avec succès';

  @override
  String get categorySaveFailure => 'Impossible d\'enregistrer la catégorie';

  @override
  String get transaction => 'Transaction';

  @override
  String get newTransaction => 'Nouvelle transaction';

  @override
  String get editTransaction => 'Modifier la transaction';

  @override
  String get transactionDeleteSuccess => 'Transaction supprimée avec succès';

  @override
  String get transactionDeleteFailure => 'Impossible de supprimer la transaction';

  @override
  String get transactionSaveSuccess => 'Transaction enregistrée avec succès';

  @override
  String get transactionSaveFailure => 'Impossible d\'enregistrer la transaction';

  @override
  String get allTransactionsLinkedWillBeAffected => 'Toutes les transactions liées à cette catégorie seront affectées';

  @override
  String get selectColor => 'Sélectionnez une couleur';

  @override
  String get selectLanguage => 'Sélectionnez la langue';

  @override
  String get color => 'Couleur';

  @override
  String get description => 'Description';

  @override
  String get value => 'Montant';

  @override
  String get earn => 'Revenu';

  @override
  String get spent => 'Dépense';

  @override
  String get welcome => 'Bienvenue, ';

  @override
  String get moves => 'Mouvements';

  @override
  String get percentageExpenses => 'Pourcentage des dépenses';

  @override
  String get selectedMonth => 'Mois sélectionné';
}
