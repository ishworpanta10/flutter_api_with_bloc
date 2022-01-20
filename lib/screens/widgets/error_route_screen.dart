import 'package:flutter/material.dart';

class ErrorRouteScreen extends StatelessWidget {
  const ErrorRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Error Route'),
        ),
      ),
    );
  }
}
