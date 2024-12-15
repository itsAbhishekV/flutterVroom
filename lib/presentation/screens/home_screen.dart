import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home';
  static const routePath = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('hello app'),
    );
  }
}
