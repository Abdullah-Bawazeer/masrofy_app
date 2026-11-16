import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masrofy_app/core/service/firebase_service.dart';
import 'package:masrofy_app/features/depts/models/debts_model.dart';

class DebtsRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  DebtsRepository({required this._firestore, required this._auth});

  CollectionReference<Map<String, dynamic>> get _debtsCollection {
    final uid = _auth.currentUser!.uid;

    return _firestore.collection("users").doc(uid).collection("debts");
  }

  // add debts
  Future<void> addDebt(DebtModel debt) async {
    await _debtsCollection.add(debt.toMap());
  }

  // update goal
  Future<void> updateDebts(DebtModel debt) async {
    await _debtsCollection.doc(debt.id).update(debt.toMap());
  }

  // delete
  Future<void> deleteDebt(String debtId) async {
    await _debtsCollection.doc(debtId).delete();
  }

  // get all goals
  Future<List<DebtModel>> getDebts() async {
    final snapshot = await _debtsCollection.get();
    return snapshot.docs
        .map((doc) => DebtModel.fromMap(doc.id, doc.data()))
        .toList();
  }
}

final debtsRepositoryProvider = Provider<DebtsRepository>(
  (ref) => DebtsRepository(
    firestore: ref.watch(firebaseFireStoreProvider),
    auth: ref.watch(firebaseAuthProvider),
  ),
);
