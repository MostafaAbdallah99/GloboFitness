import 'package:flutter/material.dart';
import 'package:globo_fitness/shared/menu_drawer.dart';
import '../components/constants.dart' as constants;
import '../shared/menu_bottom.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      bottomNavigationBar: const MenuBottom(selectedIndex: 0,),
      appBar: AppBar(
        title: const Text(constants.applicationName),
      ),
      drawer: const MenuDrawer(),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(constants.assetsPath + constants.homeImage),
                  fit: BoxFit.cover)),
          child: Center(
              child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white70,
                  ),
                  child: const Text(
                    constants.welcomeMessage,
                    style: TextStyle(fontSize: 22, shadows: [
                      Shadow(
                          offset: Offset(1.0, 1.0),
                          color: Colors.grey,
                          blurRadius: 2.0)
                    ]),
                    textAlign: TextAlign.center,
                  )))),
    ));
  }
}
