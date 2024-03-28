import 'package:flutter/material.dart';
import 'package:weather_api_bloc/models/forecast_model.dart';

class WeatherBody extends StatelessWidget {
  final ForecastModel forecastModel;
  const WeatherBody({
    super.key,
    required this.forecastModel,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(128),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.network('https:${forecastModel.conditionIcon}'),
              ),
              const SizedBox(width: 24),
              Text(forecastModel.name),
              const SizedBox(width: 24),
              Text(
                '${forecastModel.temp.toStringAsFixed(1)} ℃',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
