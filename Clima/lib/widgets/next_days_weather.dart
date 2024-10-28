import 'package:clima/utilities/consts.dart';
import 'package:flutter/material.dart';

class NextDayWeather extends StatelessWidget {
  const NextDayWeather(
      {super.key,
      required this.icon,
      required this.time,
      required this.degree});

  final String icon;
  final String time;
  final String degree;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Column(
        children: [
          Image.network(
            icon,
            scale: 1.5,
          ),
          Text(
            time,
            style: const TextStyle(color: subTitleColor, fontSize: 18),
          ),
          Text(
            '$degree°',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          )
        ],
      ),
    );
  }
}
