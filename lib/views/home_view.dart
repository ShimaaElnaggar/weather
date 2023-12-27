import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weaher_states.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_application/views/search_view.dart';
import 'package:weather_application/weidgets/no_weather_boldy.dart';
import 'package:weather_application/weidgets/weather_info_body.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});
 static String id ="HomeView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: [
          IconButton(
              onPressed:() {
             Navigator.pushNamed(context, SearchView.id);
              },
              icon:const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit,WeatherStates>(
        builder: (BuildContext context, state)
        {
          if(state is WeatherInitialState){
            return const NoWeatherBody();
          }else if(state is WeatherLoadedState){
            return  const WeatherInfoBody();
          }else{
            return const Text("Ops, there was an error,try again");
          }
        },
      ),
    );
  }
}


