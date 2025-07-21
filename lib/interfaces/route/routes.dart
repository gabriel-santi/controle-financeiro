import 'package:finapp/features/category/interfaces/category.page.dart';
import 'package:finapp/interfaces/page/add_transaction.page.dart';
import 'package:finapp/interfaces/page/edit_limit.page.dart';
import 'package:finapp/interfaces/page/edit_transaction.page.dart';
import 'package:finapp/interfaces/page/home.page.dart';
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
