import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vroom/data/exports.dart';
import 'package:flutter_vroom/domain/exports.dart';
import 'package:flutter_vroom/presentation/bloc/car_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );

    getIt.registerLazySingleton<FirebaseDataSource>(
      () => FirebaseDataSource(
        firestore: getIt<FirebaseFirestore>(),
      ),
    );

    getIt.registerLazySingleton<CarRepository>(
      () => CarRepositoryImplementation(
        getIt<FirebaseDataSource>(),
      ),
    );

    getIt.registerLazySingleton<GetCars>(
      () => GetCars(
        getIt<CarRepository>(),
      ),
    );

    getIt.registerLazySingleton<CarBloc>(
      () => CarBloc(
        getCars: getIt<GetCars>(),
      ),
    );
  } catch (e) {
    debugPrint('There was error while injection: $e');
  }
}
