import 'package:bloc/bloc.dart';
import 'package:flutter_vroom/domain/exports.dart';
import 'package:flutter_vroom/presentation/bloc/car_events.dart';
import 'package:flutter_vroom/presentation/bloc/car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCars;

  CarBloc({required this.getCars}) : super(CarsLoading()) {
    on<LoadCars>((event, emit) async {
      emit(CarsLoading());
      try {
        final cars = await getCars.call();
        emit(CarsLoaded(cars));
      } catch (e) {
        emit(
          CarsLoadingFailure(
            e.toString(),
          ),
        );
      }
    });
  }
}
