import 'package:flutter/material.dart';
import 'package:globo_fitness/bmi/bmi_screen.dart';
import 'package:globo_fitness/home/intro_screen.dart';
import 'package:globo_fitness/training_session/training_sessions_screen.dart';
import 'package:globo_fitness/weather/weather_screen.dart';
import '../components/constants.dart' as constants;

class MenuBottom extends StatefulWidget {
  final int selectedIndex;
  const MenuBottom({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  _MenuBottomState createState() => _MenuBottomState();
}

class _MenuBottomState extends State<MenuBottom> {
  late final int selectedIndex = widget.selectedIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        setState(() {
          switch (index) {
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const IntroScreen()));
              break;
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BmiScreen()));
              break;
            case 2:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WeatherScreen()));
              break;
            case 3:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SessionsScreen()));
              break;
            default:
          }
        });
      },
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
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
