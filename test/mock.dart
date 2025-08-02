import 'package:finapp/features/category/data/category_repository.dart';
import 'package:finapp/features/transaction/data/transaction_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockTransactionRepository extends Mock implements TransactionRepo {}

class MockCategoryRepo extends Mock implements CategoryRepo {}
