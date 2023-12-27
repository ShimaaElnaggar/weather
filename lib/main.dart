import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weaher_states.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_application/views/home_view.dart';
import 'package:weather_application/views/search_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder <GetWeatherCubit,WeatherStates> (
            builder: (BuildContext context, state)=> MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCondition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              routes: {
                SearchView.id:(context)=>const SearchView(),
                HomeView.id:(context)=>const HomeView(),
              },
              initialRoute: HomeView.id,
            ),
          );
        }
      ),
    );
  }
}
  MaterialColor getThemeColor(String? condition) {
  if(condition == null){
  return Colors.blue;
}
  switch (condition) {
    case "sunny":
    case "clear":
      return Colors.orange;
    case "partly cloudy":
      return Colors.yellow;
    case "cloudy":
      return Colors.grey;
    case "blowing snow":
    case "blizzard":
    case "patchy moderate snow":
    case "moderate snow":
    case "patchy heavy snow":
    case "heavy snow":
    case "moderate or heavy snow showers":
      return Colors.cyan;
    case "fog":
    case "mist":
    case "freezing fog":
      return Colors.blueGrey;
    case "patchy light drizzle":
    case "overcast":
    case "patchy rain possible":
    case "light drizzle":
    case "freezing drizzle":
    case "heavy freezing drizzle":
    case "patchy light rain":
    case "light rain":
      return Colors.lightBlue;
    case "moderate rain at times":
    case "moderate or heavy rain shower":
    case "moderate rain":
      return Colors.blue;
    case "heavy rain at times":
    case "heavy rain":
    case "torrential rain shower":
      return Colors.indigo;
    case "light freezing rain":
    case "moderate or heavy freezing rain":
    case "light sleet":
    case "moderate or heavy sleet":
    case "patchy light snow":
    case "light snow":
    case "patchy snow possible":
    case "patchy sleet possible":
    case "patchy freezing drizzle possible":
    case "ice pellets":
    case "light rain shower":
    case "light sleet showers":
    case "moderate or heavy sleet showers":
    case "light snow showers":
    case "light showers of ice pellets":
    case "moderate or heavy showers of ice pellets":
      return Colors.blue;
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
    case "patchy light snow with thunder":
    case "moderate or heavy snow with thunder":
    case "thundery outbreaks possible":
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}
