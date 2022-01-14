import 'package:globo_fitness/bmi/bmi_screen.dart';
import 'package:globo_fitness/home/intro_screen.dart';
import 'package:globo_fitness/training_session/training_sessions_screen.dart';
import 'package:globo_fitness/weather/weather_screen.dart';

var appRoutes = {
  '/': (context) => const IntroScreen(),
  '/bmi': (context) => const BmiScreen(),
  '/weather': (context) => const WeatherScreen(),
  '/training_session': (context) => const SessionsScreen(),
};
