import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get requiredField => 'Preencha este campo';

  @override
  String get askName => 'Como gostaria de ser chamado?';

  @override
  String get save => 'Salvar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get next => 'Avançar';

  @override
  String get select => 'Selecionar';

  @override
  String get create => 'Criar';

  @override
  String get delete => 'Excluir';

  @override
  String get deleteCategory => 'Excluir categoria?';

  @override
  String get deleteConfirmation => 'Deseja mesmo excluir?';

  @override
  String nCategory(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Categorias',
      one: 'Categoria',
      zero: 'Nenhuma categoria encontrada',
    );
    return '$_temp0';
  }

  @override
  String get editCategory => 'Editar categoria';

  @override
  String get newCategory => 'Nova categoria';

  @override
  String get categoryDeleteSuccess => 'Categoria excluída com sucesso';

  @override
  String get categoryDeleteFailure => 'Não foi possível excluir categoria';

  @override
  String get categorySaveSuccess => 'Categoria salva com sucesso';

  @override
  String get categorySaveFailure => 'Não foi possível salvar categoria';

  @override
  String get transaction => 'Transação';

  @override
  String get newTransaction => 'Nova transação';

  @override
  String get editTransaction => 'Editar transação';

  @override
  String get transactionDeleteSuccess => 'Transação excluída com sucesso';

  @override
  String get transactionDeleteFailure => 'Não foi possível excluir transação';

  @override
  String get transactionSaveSuccess => 'Transação salva com sucesso';

  @override
  String get transactionSaveFailure => 'Não foi possível salvar transação';

  @override
  String get allTransactionsLinkedWillBeAffected => 'Todas as transações vinculadas a essa categoria serão afetadas';

  @override
  String get selectColor => 'Selecione uma cor';

  @override
  String get selectLanguage => 'Selecione o idioma';

  @override
  String get color => 'Cor';

  @override
  String get description => 'Descrição';

  @override
  String get value => 'Valor';

  @override
  String get earn => 'Ganho';

  @override
  String get spent => 'Gasto';

  @override
  String welcome(Object username) {
    return 'Seja bem-vindo(a), $username';
  }

  @override
  String get moves => 'Movimentações';

  @override
  String get percentageExpenses => 'Percentual de Gastos';

  @override
  String get selectedMonth => 'Mês selecionado';
}
