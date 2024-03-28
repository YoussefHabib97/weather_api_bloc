import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api_bloc/constants.dart';
import 'package:weather_api_bloc/cubits/weather_states.dart';
import 'package:weather_api_bloc/models/forecast_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  final dio = Dio();

  String cityName = '';

  late ForecastModel forecastModel;

  bool isLoading = false;

  Future<void> getForecast({required String cityName}) async {
    try {
      isLoading = true;
      emit(WeatherLoading());
      var forecast = await dio
          .get('$kBaseUrl$kForecastEndPoint?key=$kApiKey&q=$cityName&aqi=no');

      isLoading = false;
      emit(WeatherLoaded());

      forecastModel = ForecastModel.fromJson(forecast.data);
      log(forecastModel.toString());
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
