

import 'package:weather_application/models/weather_model.dart';

class WeatherStates{}
//polymorphism
class WeatherInitialState extends WeatherStates{}

class WeatherLoadedState extends WeatherStates {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFailureState extends WeatherStates {
  final String errorMessage;

  WeatherFailureState(this.errorMessage);
}