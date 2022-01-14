class Weather {
  String cityName = '';
  String weatherDescription = '';
  double cityTemperature = 0.0;
  double perceivedCityTemperature = 0.0;
  int cityPressure = 0;
  int cityHumidity = 0;

  Weather(this.cityName, this.weatherDescription, this.cityTemperature,
      this.perceivedCityTemperature, this.cityPressure, this.cityHumidity);

  Weather.fromJson(Map<String, dynamic> weatherData) {
    cityName = weatherData['name'];
    weatherDescription = weatherData['weather'][0]['main'] ?? '';
    cityTemperature = (weatherData['main']['temp'] * (9 / 5) - 459.67) ?? 0;
    perceivedCityTemperature =
        (weatherData['main']['feels_like'] * (9 / 5) - 459.67) ?? 0;
    cityPressure = weatherData['main']['pressure'];
    cityHumidity = weatherData['main']['humidity'];
  }
}
