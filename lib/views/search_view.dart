

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
static String id="SearchView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text("Search "),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16 ),
            child: TextField(
              onSubmitted: (value) async{
                var getWeatherCubit= BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeather(cityName: value);
                 Navigator.pop(context);
              },
              decoration:const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 16),
                prefixIcon: Icon(Icons.search),
               hintText: 'Enter City Name',
               labelText: 'Search',
                border: OutlineInputBorder(
                   borderRadius: BorderRadius.all(Radius.circular(20),),
                ),
            ),
            ),
          ),
        ],
      ),
    );
  }
}
