import 'package:flutter/material.dart';
import 'package:globo_fitness/bmi/bmi_screen.dart';
import 'package:globo_fitness/home/intro_screen.dart';
import 'package:globo_fitness/training_session/training_sessions_screen.dart';
import 'package:globo_fitness/weather/weather_screen.dart';
import '../components/constants.dart' as constants;

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
      decoration: BoxDecoration(color: Colors.blueGrey),
      child: Text(
        constants.applicationName,
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
    ));

    for (var element in constants.menuTitles) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(
          element,
          style: const TextStyle(fontSize: 18),
        ),
        onTap: () {
          switch (element) {
            case 'Home':
              screen = const IntroScreen();
              break;
            case 'BMI Calculator':
              screen = const BmiScreen();
              break;
            case 'Weather':
              screen = const WeatherScreen();
              break;
            case 'Training':
              screen = const SessionsScreen();
              break;
            default:
          }
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
      ));
    }

    return menuItems;
  }
}
