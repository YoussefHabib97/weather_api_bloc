import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Text(
            "Search for a city to display its weather! 🌤",
            style: TextStyle(fontSize: 32),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
