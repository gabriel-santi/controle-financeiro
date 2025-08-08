import 'package:finapp/features/category/data/category_repository.dart';
import 'package:finapp/features/transaction/data/transaction_repository.dart';
import 'package:finapp/features/user/data/user_repo.dart';
import 'package:mocktail/mocktail.dart';

class MockTransactionRepo extends Mock implements TransactionRepo {}

class MockCategoryRepo extends Mock implements CategoryRepo {}

class MockUserRepo extends Mock implements UserRepo {}
