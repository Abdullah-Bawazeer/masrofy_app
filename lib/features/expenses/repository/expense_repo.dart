import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masrofy_app/core/service/firebase_service.dart';
import 'package:masrofy_app/features/expenses/models/expense_entry_model.dart';

class ExpenseRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  const ExpenseRepository({
    required FirebaseFirestore fireStore,
    required FirebaseAuth auth,
  }) : _firestore = fireStore,
       _auth = auth;

  CollectionReference<Map<String, dynamic>> get _expenseCollection {
    final uid = _auth.currentUser!.uid;
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('expense_entries');
  }

  Future<void> addExpenseEntry(ExpenseEntryModel expense) async {
    await _expenseCollection.add(expense.toMap());
  }

  Future<List<ExpenseEntryModel>> getExpensesEntries() async {
    final snapshot = await _expenseCollection
        .orderBy('date', descending: true)
        .get();
    return snapshot.docs
        .map((doc) => ExpenseEntryModel.fromMap(doc.id, doc.data()))
        .toList();
  }

  Future<void> updateExpense(ExpenseEntryModel expense) async {
    await _expenseCollection.doc(expense.id).update(expense.toMap());
  }

  Future<void> deleteExpense(String id) async {
    await _expenseCollection.doc(id).delete();
  }
}

final expenseRepositoryProvider = Provider<ExpenseRepository>((ref) {
  return ExpenseRepository(
    fireStore: ref.watch(firebaseFireStoreProvider),
    auth: ref.watch(firebaseAuthProvider),
  );
});
