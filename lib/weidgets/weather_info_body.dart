
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_application/main.dart';
import 'package:weather_application/models/weather_model.dart';


class WeatherInfoBody extends StatelessWidget {
   const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel=BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              getThemeColor(weatherModel.weatherCondition),
              getThemeColor(weatherModel.weatherCondition)[300]!,
              getThemeColor(weatherModel.weatherCondition)[50]!,
            ]
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const  TextStyle(fontSize: 32,fontWeight: FontWeight.bold,),
            ),
            Text("updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
              style: const  TextStyle(fontSize: 24,),
            ),
            const SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network("https:${weatherModel.image}"),
                 Text(
                   weatherModel.temp.round().toString(),
                   style: const  TextStyle(fontSize: 27,fontWeight: FontWeight.bold),
                 ),
                 Column(
                  children: [
                    Text(
                        'Max Temp: ${weatherModel.maxTemp.round()}',
                    style: const  TextStyle(fontSize: 16,),
                    ),
                    Text(    'Min Temp: ${weatherModel.minTemp.round()}',
                      style: const  TextStyle(fontSize: 16,),),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10,),
             Text(weatherModel.weatherCondition,
                 style: const  TextStyle(fontSize: 27,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

