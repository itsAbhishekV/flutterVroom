import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vroom/firebase_options.dart';

import 'core/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final user = {
      'name': 'Abhishek',
      'age': 30,
    };
    db
        .collection('users')
        .add(user)
        .then((DocumentReference doc) => debugPrint('Doc - ${doc.id}'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'VroomVroom',
      routerConfig: routes,
    );
  }
}
