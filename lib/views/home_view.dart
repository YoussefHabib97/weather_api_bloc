import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api_bloc/cubits/weather_cubit.dart';
import 'package:weather_api_bloc/cubits/weather_states.dart';
import 'package:weather_api_bloc/widgets/no_weather_body.dart';
import 'package:weather_api_bloc/widgets/search_bottom_sheet.dart';
import 'package:weather_api_bloc/widgets/weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: const SearchBottomSheet(),
      body: SafeArea(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return const NoWeatherBody();
            } else {
              return WeatherBody(
                forecastModel:
                    BlocProvider.of<WeatherCubit>(context).forecastModel,
              );
            }
          },
        ),
      ),
    );
  }
}
