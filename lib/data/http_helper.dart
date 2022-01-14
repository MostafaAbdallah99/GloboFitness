import 'package:globo_fitness/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/constants.dart' as constants;

//https://api.openweathermap.org/data/2.5/weather?q=London&appid=b7388f4c2929db82d8e840ded81548ae
class HttpHelper {
  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {
      'q': location,
      'appid': constants.apiKey
    };
    Uri uri = Uri.https(constants.authority, constants.path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> weatherData = json.decode(result.body);
    Weather weather = Weather.fromJson(weatherData);
    return weather;
  }
}
