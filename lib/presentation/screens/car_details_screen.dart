import 'package:flutter/material.dart';
import 'package:flutter_vroom/data/exports.dart';
import 'package:flutter_vroom/presentation/exports.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CarDetailsScreen extends StatefulWidget {
  final Car car;

  static const routeName = 'car-details';
  static const routePath = '/$routeName';

  const CarDetailsScreen({
    super.key,
    required this.car,
  });

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(
        seconds: 3,
      ),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });

    _controller!.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller!.forward();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.info_outline,
              size: 20.0,
            ),
            Text(
              ' Information',
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CarCard(
            car: Car(
              model: widget.car.model,
              distance: widget.car.distance,
              fuelCapacity: widget.car.fuelCapacity,
              pricePerHour: widget.car.pricePerHour,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                        color: Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(24.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            spreadRadius: 5.0,
                          )
                        ]),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40.0,
                          backgroundImage: NetworkImage(
                              'https://avatars.githubusercontent.com/u/70279771?v=4'),
                        ),
                        Gap(12.0),
                        Text(
                          'John Doe',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$4,253',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(24.0),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(
                        MapDetailsScreen.routeName,
                        extra: widget.car.toMap(),
                      );
                    },
                    child: Container(
                      height: 180.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.0,
                              spreadRadius: 5.0,
                            )
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Transform.scale(
                          scale: _animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/maps.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.all(
              20.0,
            ),
            child: Column(
              children: [
                MoreCard(
                  car: Car(
                    model: "${widget.car.model}-1",
                    distance: widget.car.distance + 100,
                    fuelCapacity: widget.car.fuelCapacity + 100,
                    pricePerHour: widget.car.pricePerHour + 10,
                  ),
                ),
                Gap(8.0),
                MoreCard(
                  car: Car(
                    model: "${widget.car.model}-2",
                    distance: widget.car.distance + 200,
                    fuelCapacity: widget.car.fuelCapacity + 200,
                    pricePerHour: widget.car.pricePerHour + 20,
                  ),
                ),
                Gap(8.0),
                MoreCard(
                  car: Car(
                    model: "${widget.car.model}-3",
                    distance: widget.car.distance + 300,
                    fuelCapacity: widget.car.fuelCapacity + 300,
                    pricePerHour: widget.car.pricePerHour + 30,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
