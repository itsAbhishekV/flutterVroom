import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gap/gap.dart'; // Add this package to pubspec.yaml
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../data/models/car.dart';

class MapDetailsScreen extends StatefulWidget {
  final Car car;

  static const routeName = 'map';
  static const routePath = '/map';

  const MapDetailsScreen({
    super.key,
    required this.car,
  });

  @override
  State<MapDetailsScreen> createState() => _MapDetailsScreenState();
}

class _MapDetailsScreenState extends State<MapDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 24.0,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(30.733, 76.779),
              minZoom: 13.0,
              maxZoom: 15.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: carDetailsCard(car: widget.car),
          ),
        ],
      ),
    );
  }
}

Widget carDetailsCard({required Car car}) {
  return SizedBox(
    height: 350.0,
    child: Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 0,
                blurRadius: 10.0,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20.0),
              Text(
                car.model,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Gap(10.0),
              Row(
                children: [
                  const Icon(
                    Icons.directions_car,
                    color: Colors.white,
                    size: 16.0,
                  ),
                  const Gap(5.0),
                  Text(
                    '> ${car.distance} km',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                  const Gap(10.0),
                  const Icon(
                    Icons.battery_full,
                    color: Colors.white,
                    size: 14.0,
                  ),
                  const Gap(5.0),
                  Text(
                    car.fuelCapacity.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Features",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const Gap(10.0),
                featureIcons(),
                const Gap(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${car.pricePerHour}/day',
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: const Text(
                        'Book Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 50.0,
          right: 20.0,
          child: Image.asset(
            'assets/white_car.png',
          ),
        ),
      ],
    ),
  );
}

Widget featureIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      featureIcon(
        Icons.local_gas_station,
        'Diesel',
        'Common Rail',
      ),
      featureIcon(
        Icons.speed,
        'Acceleration',
        '0 - 100 km/s',
      ),
      featureIcon(
        Icons.ac_unit,
        'Cold',
        'Temp Control',
      ),
    ],
  );
}

Widget featureIcon(IconData icon, String title, String subtitle) {
  return Container(
    width: 100.0,
    padding: const EdgeInsets.all(
      5.0,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        10.0,
      ),
      border: Border.all(
        color: Colors.grey,
        width: 1.0,
      ),
    ),
    child: Column(
      children: [
        Icon(
          icon,
          size: 28.0,
        ),
        Text(title),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 10.0,
          ),
        )
      ],
    ),
  );
}
