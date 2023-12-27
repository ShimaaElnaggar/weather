class WeatherModel{
  final String cityName;
  final String? image;
  final DateTime date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel({
     this.image,
    required this.cityName,
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition
  });

  factory WeatherModel.fromJson(json){
    var jsonData=json["forecast"]["forecastday"][0]["day"];
    return WeatherModel(
        image: jsonData["condition"]["icon"],
        cityName: json["location"]["name"],
        date: DateTime.parse(json["current"]["last_updated"]),
        temp:jsonData["avgtemp_c"],
        maxTemp:jsonData["maxtemp_c"],
        minTemp: jsonData["mintemp_c"],
        weatherCondition:jsonData["condition"]["text"],
    );
  }
}
