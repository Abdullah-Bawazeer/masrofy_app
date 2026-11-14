import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:masrofy_app/app.dart';
import 'package:masrofy_app/firebase_options.dart';

const _googleServerClientId =
    '480426059105-baofsufhe44u85bkchb9dadi133fba3g.apps.googleusercontent.com';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleSignIn.instance.initialize(serverClientId: _googleServerClientId);
  runApp(ProviderScope(child: const MasrofyApp()));
}
