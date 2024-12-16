import 'package:flutter_vroom/data/exports.dart';
import 'package:flutter_vroom/domain/exports.dart';

class CarRepositoryImplementation implements CarRepository {
  final FirebaseDataSource dataSource;

  CarRepositoryImplementation(this.dataSource);

  @override
  Future<List<Car>> getCars() async {
    return dataSource.getCarsData();
  }
}
