import 'package:flutter_vroom/data/exports.dart';
import 'package:flutter_vroom/domain/exports.dart';

class GetCars {
  final CarRepository repository;

  GetCars(this.repository);

  Future<List<Car>> call() async {
    return await repository.getCars();
  }
}
