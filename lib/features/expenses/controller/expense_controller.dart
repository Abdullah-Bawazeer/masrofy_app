import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masrofy_app/features/expenses/models/expense_entry_model.dart';
import 'package:masrofy_app/features/expenses/repository/expense_repo.dart';

class ExpenseController extends AsyncNotifier<List<ExpenseEntryModel>> {
  late final ExpenseRepository _repository;
  @override
  FutureOr<List<ExpenseEntryModel>> build() async {
    _repository = ref.read(expenseRepositoryProvider);
    return _getExpense();
  }

  Future<List<ExpenseEntryModel>> _getExpense() {
    return _repository.getExpensesEntries();
  }

  Future<void> addExpense(ExpenseEntryModel expense) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.addExpenseEntry(expense);
      return _getExpense();
    });
  }

  Future<void> updateExpense(ExpenseEntryModel expense) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.updateExpense(expense);
      return _getExpense();
    });
  }

  Future<void> deleteExpense(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.deleteExpense(id);
      return _getExpense();
    });
  }
}

final expenseControllerProvider =
    AsyncNotifierProvider<ExpenseController, List<ExpenseEntryModel>>(
      ExpenseController.new,
    );
