class WeatherModel {
  int? cloudPct;
  int? temp = 0;
  String? tempImg = 'assets/images/sunny.png';
  int? feelsLike;
  int? humidity;
  int? minTemp;
  int? maxTemp;
  double? windSpeed;
  int? windDegrees;
  int? sunrise;
  int? sunset;

  WeatherModel(
      {cloudPct,
      temp, tempImg,
      feelsLike,
      humidity,
      minTemp,
      maxTemp,
      windSpeed,
      windDegrees,
      sunrise,
      sunset});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    cloudPct = json['cloud_pct'];
    temp = json['temp'];
    feelsLike = json['feels_like'];
    humidity = json['humidity'];
    minTemp = json['min_temp'];
    maxTemp = json['max_temp'];
    windSpeed = json['wind_speed'];
    windDegrees = json['wind_degrees'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['cloud_pct'] = cloudPct;
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['humidity'] = humidity;
    data['min_temp'] = minTemp;
    data['max_temp'] = maxTemp;
    data['wind_speed'] = windSpeed;
    data['wind_degrees'] = windDegrees;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }

  @override
  String toString() {
    return 'WeatherModel{cloudPct: $cloudPct, temp: $temp, feelsLike: $feelsLike, humidity: $humidity, minTemp: $minTemp, maxTemp: $maxTemp, windSpeed: $windSpeed, windDegrees: $windDegrees, sunrise: $sunrise, sunset: $sunset}';
  }
}
