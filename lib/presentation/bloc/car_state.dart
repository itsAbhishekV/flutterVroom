import 'package:flutter_vroom/data/exports.dart';

sealed class CarState {}

class CarsLoading extends CarState {}

class CarsLoaded extends CarState {
  final List<Car> cars;

  CarsLoaded(this.cars);
}

class CarsLoadingFailure extends CarState {
  final String error;

  CarsLoadingFailure(this.error);
}
