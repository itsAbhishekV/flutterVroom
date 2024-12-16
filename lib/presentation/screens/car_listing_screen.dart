import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vroom/presentation/bloc/car_bloc.dart';
import 'package:flutter_vroom/presentation/exports.dart';

class CarListingScreen extends StatefulWidget {
  static const routeName = 'car-listing';
  static const routePath = '/$routeName';

  const CarListingScreen({super.key});

  @override
  State<CarListingScreen> createState() => _CarListingScreenState();
}

class _CarListingScreenState extends State<CarListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose Car',
        ),
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is CarsLoading) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is CarsLoadingFailure) {
            return Center(
              child: Text('There was an error fetching the cars from DB'),
            );
          }
          if (state is CarsLoaded) {
            final cars = state.cars;
            return ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                final car = cars[index];
                return CarCard(
                  car: car,
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
