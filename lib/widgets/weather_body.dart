import 'package:flutter/material.dart';

class WeatherBody extends StatelessWidget {
  final String cityName;
  const WeatherBody({
    super.key,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(cityName),
    );
  }
}
