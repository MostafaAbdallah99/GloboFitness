import 'package:flutter/material.dart';
import 'package:globo_fitness/data/weather.dart';
import 'package:globo_fitness/shared/menu_bottom.dart';
import '../data/http_helper.dart';
import '../components/constants.dart' as constants;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController textPlace = TextEditingController();
  Weather weather = Weather('', '', 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MenuBottom(selectedIndex: 2),
      appBar: AppBar(
        title: Text(constants.menuTitles[2]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(constants.weatherScreenFontSize),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(constants.weatherScreenFontSize),
              child: TextField(
                controller: textPlace,
                decoration: InputDecoration(
                    hintText: constants.weatherScreenHintText,
                    suffixIcon: IconButton(
                      onPressed: getData,
                      icon: const Icon(Icons.search),
                    )),
              ),
            ),
            weatherRow(constants.weatherData[0], weather.cityName),
            weatherRow(constants.weatherData[1], weather.weatherDescription),
            weatherRow(constants.weatherData[2],
                weather.cityTemperature.toStringAsFixed(2)),
            weatherRow(constants.weatherData[3],
                weather.perceivedCityTemperature.toStringAsFixed(2)),
            weatherRow(
                constants.weatherData[4], weather.cityPressure.toString()),
            weatherRow(
                constants.weatherData[5], weather.cityHumidity.toString()),
          ],
        ),
      ),
    );
  }

  Future getData() async {
    HttpHelper httpHelper = HttpHelper();
    weather = await httpHelper.getWeather(textPlace.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
        padding: const EdgeInsets.symmetric(
            vertical: constants.weatherScreenFontSize),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                label,
                style: TextStyle(
                    fontSize: constants.weatherScreenFontSize,
                    color: Theme.of(context).hintColor),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                value,
                style: TextStyle(
                    fontSize: constants.weatherScreenFontSize,
                    color: Theme.of(context).primaryColor),
              ),
            )
          ],
        ));
    return row;
  }
}
