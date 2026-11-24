import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:masrofy_app/core/service/firebase_service.dart';
import 'package:masrofy_app/features/auth/models/user_model.dart';

class AuthRepository {
  // call firestore , auth,google signin
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    required this._auth,
    required this._firestore,
    required this._googleSignIn,
  });

  // build signin fun
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.authenticate();
      final googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      final userCredential = await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        _saveUserToFireStore(userCredential.user!);
      }
      return userCredential;
    } catch (e, st) {
      //log("error $e St $st");
    }
  }

  // get user
  User? get currentUser => _auth.currentUser;

  CollectionReference<Map<String, dynamic>> get _userColliction =>
      _firestore.collection('users');
  // save user to firestor
  Future<void> _saveUserToFireStore(User user) async {
    final userModel = UserModel.fromFirebaseUser(user);
    await _userColliction.doc(user.uid).set(userModel.toMap());
  }

  // signout

  Future<void> signOut() async {
    await Future.wait([_auth.signOut(), _googleSignIn.signOut()]);
  }
}

final authRepoProvider = Provider(
  (ref) => AuthRepository(
    auth: ref.watch(firebaseAuthProvider),
    firestore: ref.watch(firebaseFireStoreProvider),
    googleSignIn: ref.watch(googleSignInProvider),
  ),
);
