import 'package:finapp/features/category/interfaces/category.page.dart';
import 'package:finapp/features/transaction/interfaces/add_transaction.page.dart';
import 'package:finapp/features/transaction/interfaces/edit_limit.page.dart';
import 'package:finapp/features/transaction/interfaces/edit_transaction.page.dart';
import 'package:finapp/features/transaction/interfaces/home.page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (_) => const HomePage(),
    '/transaction/create': (_) => const AddTransactionPage(),
    '/transaction/edit': (_) => const EditTransactionPage(),
    '/limit': (_) => const EditLimitPage(),
    '/category': (_) => const CategoryPage(),
  };
}
