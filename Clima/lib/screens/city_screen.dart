import 'dart:developer';
import 'dart:math' as math;

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../utilities/consts.dart';
import '../widgets/location_icon.dart';
import '../widgets/next_days_weather.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key, required this.currentLocation});

  final Position currentLocation;

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  dynamic weatherResult;
  List<Placemark> locationName = [];
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    getMyWeather();
  }

  getMyWeather() async {
    setState(() {
      isLoading = true;
    });
    try {
      locationName = await placemarkFromCoordinates(
          widget.currentLocation.latitude, widget.currentLocation.longitude);
    } on Exception catch (e) {
      log("Error $e");
      locationName = [];
    }
    weatherResult = await WeatherClass().getWeather(
        '$kAppEndPoint/forecast?lat=${widget.currentLocation.latitude}&lon=${widget.currentLocation.longitude}&cnt=4&units=metric&appid=$kAppId');
    setState(() {
      isLoading = false;
    });
  }

  syncData() async {
    animationController!.forward();

    await getMyWeather();
    animationController!.reset();

    animationController!.stop();
  }

  @override
  void dispose() {
    super.dispose();
    animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Tooltip(
                    message: 'Search Location',
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LocationScreen()),
                        ),
                        child: const LocationIcon(
                          icon: Icons.search_rounded,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Tooltip(
                    message: 'Refresh',
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, right: 20),
                      child: GestureDetector(
                        onTap: () => syncData(),
                        child: AnimatedBuilder(
                          animation: animationController!,
                          builder: (_, Widget? child) => Transform.rotate(
                            angle: animationController!.value * 2.0 * math.pi,
                            child: child,
                          ),
                          child: const LocationIcon(
                            icon: Icons.refresh,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Gap(20),
                      Text(
                        '${locationName.first.locality}, ${locationName.first.administrativeArea}, ${locationName.first.country}',
                        textAlign: TextAlign.center,
                        style: kWhiteTitleStyle,
                      ),
                      Text(
                        weatherResult['list'][0]['weather'][0]['description']
                            .toString()
                            .toUpperCase(),
                        style: kButtonTextStyle200,
                      ),
                      Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image.network(
                              '$kImageUrl/${weatherResult['list'][0]['weather'][0]['icon']}@2x.png',
                              scale: 0.5,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: GradientText(
                              "${weatherResult['list'][0]['main']['temp']}\u00B0",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.alexandria(
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                              ),
                              colors: const [Colors.white, Colors.white10],
                              gradientDirection: GradientDirection.ttb,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int i = 1; i < 4; i++)
                            NextDayWeather(
                              icon:
                                  '$kImageUrl/${weatherResult['list'][i]['weather'][0]['icon']}@2x.png',
                              time: DateFormat.Hms().format(DateTime.parse(
                                  weatherResult['list'][i]['dt_txt']
                                      .toString())),
                              degree:
                                  '${weatherResult['list'][i]['main']['temp']}',
                            ),
                        ],
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
