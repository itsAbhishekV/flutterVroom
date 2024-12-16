import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vroom/firebase_options.dart';
import 'package:flutter_vroom/injection_container.dart';
import 'package:flutter_vroom/presentation/bloc/car_bloc.dart';
import 'package:flutter_vroom/presentation/bloc/car_events.dart';

import 'core/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initInjection();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CarBloc>()..add(LoadCars()),
      child: MaterialApp.router(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        title: 'VroomVroom',
        routerConfig: routes,
      ),
    );
  }
}
