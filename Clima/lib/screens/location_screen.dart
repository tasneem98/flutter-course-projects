import 'package:clima/utilities/consts.dart';
import 'package:clima/widgets/clicked_container.dart';
import 'package:clima/widgets/location_icon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool isLoading = false;
  String cityName = '';
  dynamic weatherResult;

  getLocationWeather(String location) async {
    setState(() {
      isLoading = true;
    });

    weatherResult = await WeatherClass().getWeather(
        '$kAppEndPoint/weather?q=$location&units=metric&appid=$kAppId');
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Tooltip(
                    message: 'Back',
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const LocationIcon(icon: Icons.arrow_back),
                    ),
                  ),
                ),
                const Gap(20),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Location',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) => cityName = value,
                  // onChanged: (value) async => getLocationWeather(value),
                ),
                const Gap(20),
                GestureDetector(
                  onTap: () async => getLocationWeather(cityName),
                  child: const ClickedContainer(
                    data: 'Search Location',
                    isLoading: false,
                  ),
                ),
                const Gap(20),
                cityName.isEmpty
                    ? const SizedBox()
                    : isLoading
                        ? Image.asset(
                            'assets/gif/search.gif',
                            color: mainColor,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    weatherResult['weather'][0]['description']
                                        .toString()
                                        .toUpperCase(),
                                    style: kButtonTextStyle200,
                                  ),
                                  Image.network(
                                    '$kImageUrl/${weatherResult['weather'][0]['icon']}@2x.png',
                                    // scale: 0.5,
                                  ),
                                ],
                              ),
                              GradientText(
                                "${weatherResult['main']['temp']}\u00B0",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.alexandria(
                                  fontSize: 100,
                                  fontWeight: FontWeight.bold,
                                ),
                                colors: const [Colors.white, Colors.white10],
                                gradientDirection: GradientDirection.ttb,
                              ),
                            ],
                          )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
