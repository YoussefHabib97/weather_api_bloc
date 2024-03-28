import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api_bloc/cubits/weather_cubit.dart';
import 'package:weather_api_bloc/views/home_view.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather API BLoC',
      home: BlocProvider(
        create: (context) => WeatherCubit(),
        child: const HomeView(),
      ),
    );
  }
}
