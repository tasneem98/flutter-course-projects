import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/bmi_brain.dart';
import '/pages/bmi_result.dart';
import '../components/bottom_button.dart';
import '../components/fab_body.dart';
import '../components/icon_body.dart';
import '../components/reusable_card.dart';
import '../consts.dart';

enum Gender { male, female }

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  Gender gender = Gender.male;

  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'.toUpperCase()),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Gender
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      color: gender == Gender.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      child: const IconBody(
                          icon: FontAwesomeIcons.mars, data: 'male'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      color: gender == Gender.female
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      child: const IconBody(
                          icon: FontAwesomeIcons.venus, data: 'female'),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Height
          ReusableCard(
              color: kActiveCardColour,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'height'.toUpperCase(),
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toStringAsFixed(2),
                        style: kBuildBigTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: kSliderThemeData,
                    child: Slider(
                      value: height.toDouble(),
                      max: 220,
                      min: 120,
                      onChanged: (val) => setState(() {
                        height = val.round();
                      }),
                    ),
                  ),
                ],
              )),

          // Weight / Age
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ReusableCard(
                  color: kInactiveCardColour,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'weight'.toUpperCase(),
                        style: kTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kBuildBigTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FabBody(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            icon: Icons.add,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FabBody(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            icon: Icons.remove,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kInactiveCardColour,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'age'.toUpperCase(),
                        style: kTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kBuildBigTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FabBody(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            icon: Icons.add,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FabBody(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            icon: Icons.remove,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Calculate Button
          BottomButton(
            data: 'calculate',
            onTap: () {
              BmiBrain result = BmiBrain(
                  weight: weight.toDouble(), height: height.toDouble());
              print(result.calculateBMI());
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => BmiResult(
                      title: result.bmiResult(),
                      result: result.calculateBMI(),
                      body: result.bmiInterpretation())));
            },
          )
        ],
      ),
    );
  }
}
