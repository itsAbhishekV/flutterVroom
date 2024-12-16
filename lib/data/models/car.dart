class Car {
  final String model;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;

  Car({
    required this.model,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
  });

  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'distance': distance,
      'fuelCapacity': fuelCapacity,
      'pricePerHour': pricePerHour,
    };
  }

  static Car fromMap(Map<String, dynamic> map) {
    return Car(
      model: map['model'] ?? '',
      distance: map['distance'] ?? 0.0,
      fuelCapacity: map['fuelCapacity'] ?? 0.0,
      pricePerHour: map['pricePerHour'] ?? 0.0,
    );
  }
}
