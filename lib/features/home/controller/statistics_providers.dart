import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masrofy_app/features/depts/controller/debts_controller.dart';
import 'package:masrofy_app/features/expenses/controller/expense_controller.dart';
import 'package:masrofy_app/features/goals/controller/goal_controller.dart';
import 'package:masrofy_app/features/goals/models/progress_goal.dart';
import 'package:masrofy_app/features/incom/controller/income_controller.dart';

final thisMonthIncomProvider = Provider<double>((ref) {
  final icncomProvider = ref.watch(incomeControllerProvider);
  final currentMonth = DateTime.now().month;
  final currentYear = DateTime.now().year;
  return icncomProvider.maybeWhen(
    orElse: () => 0.0,
    data: (incoms) => incoms
        .where((e) => e.month == currentMonth && e.year == currentYear)
        .fold(0, (sum, e) => sum + e.amount),
  );
});

final thisMonthExpnseProvider = Provider<double>((ref) {
  final expenseProvider = ref.watch(expenseControllerProvider);
  final currentMonth = DateTime.now().month;
  final currentYear = DateTime.now().year;

  return expenseProvider.maybeWhen(
    orElse: () => 0.0,
    data: (expenses) => expenses
        .where((e) => e.month == currentMonth && e.year == currentYear)
        .fold(0, (sum, e) => sum + e.amount),
  );
});

final thisMonthBalanceProvider = Provider<double>((ref) {
  final income = ref.watch(thisMonthIncomProvider);
  final expense = ref.watch(thisMonthExpnseProvider);
  return income - expense;
});

final todyaExpenseProvider = Provider<double>((ref) {
  final expenseProvider = ref.watch(expenseControllerProvider);
  final today = DateTime.now().day;
  final currentMonth = DateTime.now().month;
  final currentYear = DateTime.now().year;

  return expenseProvider.maybeWhen(
    orElse: () => 0.0,
    data: (expenses) => expenses
        .where(
          (e) =>
              e.month == currentMonth &&
              e.year == currentYear &&
              e.date.day == today,
        )
        .fold(0, (sum, e) => sum + e.amount),
  );
});

final unpaidDebtsProvider = Provider<double>((ref) {
  final debtsProvider = ref.watch(debtsControllerProvider);
  return debtsProvider.maybeWhen(
    orElse: () => 0.0,
    data: (debts) => debts
        .where((d) => !d.isPaid)
        .fold(0, (sum, d) => sum + d.remainingAmount),
  );
});

final goalsProgressProvider = Provider<GoalsProgress>((ref) {
  final goalsProvider = ref.watch(goalsControllerProvider);
  return goalsProvider.maybeWhen(
    orElse: () => GoalsProgress(completed: 0, total: 0),
    data: (gaols) {
      final total = gaols.length;
      final completed = gaols.where((g) => !g.isActive).length;
      return GoalsProgress(completed: completed, total: total);
    },
  );
});
