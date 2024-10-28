import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/consts.dart';
import 'package:bmi_calculator/pages/bmi_page.dart';
import 'package:flutter/material.dart';

import '../components/bottom_button.dart';

class BmiResult extends StatelessWidget {
  const BmiResult(
      {super.key,
      required this.title,
      required this.result,
      required this.body});

  final String title;
  final String result;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'.toUpperCase()),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'your result'.toUpperCase(),
                  style: kBuildBigTextStyle,
                ),
              )),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColour,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: kTitleTextStyle,
                  ),
                  Text(
                    result,
                    style: kResultTextStyle,
                  ),
                  Text(
                    body,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
              data: 're-calculate',
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) => const BMIPage(),
                    ),
                    (__) => false);
                // Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
