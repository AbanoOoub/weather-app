abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class GetWeatherLoadingState extends WeatherState {}

class GetWeatherSuccessState extends WeatherState {}

class GetWeatherErrorState extends WeatherState {}

class GetCountryNameSuccessState extends WeatherState {}
