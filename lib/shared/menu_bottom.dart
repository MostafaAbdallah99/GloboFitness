import 'package:flutter/material.dart';
import 'package:globo_fitness/bmi/bmi_screen.dart';
import 'package:globo_fitness/home/intro_screen.dart';
import 'package:globo_fitness/training_session/training_sessions_screen.dart';
import 'package:globo_fitness/weather/weather_screen.dart';
import '../components/constants.dart' as constants;

class MenuBottom extends StatelessWidget {
  const MenuBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int index) {
        switch (index) {
          case 0:
            _currentIndex = index;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const IntroScreen()));
            break;
          case 1:
            _currentIndex = index;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BmiScreen()));
            break;
          case 2:
            _currentIndex = index;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const WeatherScreen()));
            break;
          case 3:
            _currentIndex = index;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SessionsScreen()));
            break;
          default:
        }
      },
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.home), label: constants.menuTitles[0]),
        BottomNavigationBarItem(
            icon: const Icon(Icons.monitor_weight),
            label: constants.menuTitles[1]),
        BottomNavigationBarItem(
            icon: const Icon(Icons.cloud), label: constants.menuTitles[2]),
        BottomNavigationBarItem(
            icon: const Icon(Icons.list), label: constants.menuTitles[3])
      ],
    );
  }
}
