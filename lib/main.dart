import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_backend_on_flask/screens/start_page_screen.dart';
import 'package:test_backend_on_flask/view_model/view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ViewModel(),
      child: const MyApp(),
    ),
  );
}
