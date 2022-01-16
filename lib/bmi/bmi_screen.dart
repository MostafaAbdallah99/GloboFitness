import 'package:flutter/material.dart';
import 'package:globo_fitness/shared/menu_drawer.dart';
import '../components/constants.dart' as constants;
import '../shared/menu_bottom.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController textHeight = TextEditingController();
  final TextEditingController textWeight = TextEditingController();
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  late List<bool> isSelected;

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MenuBottom(selectedIndex: 1),
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: Text(constants.menuTitles[1]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ToggleButtons(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    constants.metric,
                    style: TextStyle(fontSize: constants.bmiScreenFontSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    constants.imperial,
                    style: TextStyle(fontSize: constants.bmiScreenFontSize),
                  ),
                ),
              ],
              isSelected: isSelected,
              onPressed: toggleMeasure,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: textHeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: constants.heightMessage +
                        ((isMetric)
                            ? constants.heightMetricMeasure
                            : constants.heightImperialMeasure)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                controller: textWeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: constants.weightMessage +
                        ((isMetric)
                            ? constants.weightMetricMeasure
                            : constants.weightImperialMeasure)),
              ),
            ),
            ElevatedButton(
                onPressed: findBMI,
                child: const Text(
                  constants.bmiScreenButtonText,
                  style: TextStyle(fontSize: constants.bmiScreenFontSize),
                )),
            Text(
              result,
              style: const TextStyle(fontSize: constants.bmiScreenFontSize),
            )
          ],
        ),
      ),
    );
  }

  void toggleMeasure(index) {
    if (index == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBMI() {
    double bmi = 0.0;
    double height = double.tryParse(textHeight.text) ?? 0;
    double weight = double.tryParse(textWeight.text) ?? 0;

    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }

    setState(() {
      result = constants.bmiResultMessage + bmi.toStringAsFixed(2);
    });
  }
}
