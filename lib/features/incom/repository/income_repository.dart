import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masrofy_app/core/service/firebase_service.dart';
import 'package:masrofy_app/features/incom/data/income_entry_model.dart';

class IncomeRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  const IncomeRepository({
    required FirebaseFirestore fireStore,
    required FirebaseAuth auth,
  }) : _firestore = fireStore,
       _auth = auth;

  CollectionReference<Map<String, dynamic>> get _incomeCollection {
    final uid = _auth.currentUser!.uid;
    return _firestore.collection('users').doc(uid).collection('income_entries');
  }

  Future<List<IncomeEntryModel>> getIncomeEntries() async {
    final snapshot = await _incomeCollection.get();
    return snapshot.docs
        .map((doc) => IncomeEntryModel.fromMap(doc.id, doc.data()))
        .toList();
  }

  Future<void> addIncomeEntry(IncomeEntryModel entry) async {
    await _incomeCollection.add(entry.toMap());
  }

  Future<void> updateIncomeEntry(IncomeEntryModel entry) async {
    await _incomeCollection.doc(entry.id).update(entry.toMap());
  }

  Future<void> deleteIncomeEntry(String id) async {
    await _incomeCollection.doc(id).delete();
  }
}

final incomeRepositoryProvider = Provider<IncomeRepository>((ref) {
  return IncomeRepository(
    fireStore: ref.watch(firebaseFireStoreProvider),
    auth: ref.watch(firebaseAuthProvider),
  );
});
