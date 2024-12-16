import 'package:flutter_vroom/data/exports.dart';

abstract class CarRepository {
  Future<List<Car>> getCars();
}
