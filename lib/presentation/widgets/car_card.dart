import 'package:flutter/material.dart';
import 'package:flutter_vroom/data/exports.dart';
import 'package:gap/gap.dart';

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //todo = add route
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        padding: EdgeInsets.all(
          20.0,
        ),
        decoration: BoxDecoration(
            color: Color(0xffF3F3F3),
            borderRadius: BorderRadius.circular(
              20.0,
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 10.0, spreadRadius: 5.0)
            ]),
        child: Column(
          children: [
            Image.asset(
              'assets/car_image.png',
              height: 120.0,
            ),
            Text(
              car.model,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Gap(
              12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 16.0,
                        ),
                        Text(' ${car.distance.toStringAsFixed(0)}km')
                      ],
                    ),
                    const Gap(8.0),
                    Row(
                      children: [
                        Icon(
                          Icons.local_gas_station,
                          size: 16.0,
                        ),
                        Text(' ${car.fuelCapacity.toStringAsFixed(0)}L')
                      ],
                    ),
                  ],
                ),
                Text(
                  '\$${car.pricePerHour.toStringAsFixed(2)}/h',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
