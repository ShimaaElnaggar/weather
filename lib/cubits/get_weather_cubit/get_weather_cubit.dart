import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weaher_states.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/services/weather_service.dart';


class GetWeatherCubit extends Cubit<WeatherStates>{
  GetWeatherCubit():super(WeatherInitialState());
    WeatherModel? weatherModel;
  getWeather({required String cityName})async {
    try{
    weatherModel=await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
    log(weatherModel!.cityName);
    emit(WeatherLoadedState(weatherModel!));
    }catch(e){
      emit(WeatherFailureState(e.toString()));
    }
  }

}