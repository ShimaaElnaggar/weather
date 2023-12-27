
import 'package:flutter/material.dart';
class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("There is no weather 😥 "),
        ),
        Center(child:  Text("Search Now 🔍")),
      ],
    );
  }
}