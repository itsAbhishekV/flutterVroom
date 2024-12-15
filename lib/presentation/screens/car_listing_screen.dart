import 'package:flutter/material.dart';
import 'package:flutter_vroom/data/exports.dart';
import 'package:flutter_vroom/presentation/widgets/car_card.dart';

class CarListingScreen extends StatefulWidget {
  static const routeName = 'car-listing';
  static const routePath = '/$routeName';

  const CarListingScreen({super.key});

  @override
  State<CarListingScreen> createState() => _CarListingScreenState();
}

class _CarListingScreenState extends State<CarListingScreen> {
  List<Car> cars = [
    Car(
      model: 'Toyota Corolla',
      distance: 1200.5,
      fuelCapacity: 50.0,
      pricePerHour: 25.0,
    ),
    Car(
      model: 'Honda Civic',
      distance: 850.3,
      fuelCapacity: 45.0,
      pricePerHour: 22.0,
    ),
    Car(
      model: 'Ford Mustang',
      distance: 350.7,
      fuelCapacity: 60.0,
      pricePerHour: 45.0,
    ),
    Car(
      model: 'Chevrolet Malibu',
      distance: 2100.8,
      fuelCapacity: 55.0,
      pricePerHour: 30.0,
    ),
    Car(
      model: 'BMW 3 Series',
      distance: 800.2,
      fuelCapacity: 53.0,
      pricePerHour: 50.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose Car',
        ),
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          return CarCard(car: car);
        },
      ),
    );
  }
}
