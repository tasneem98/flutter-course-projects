import 'package:clima/widgets/clicked_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '/screens/city_screen.dart';
import '../services/location.dart';
import '../utilities/consts.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getUserPermission();
  }

  getUserPermission() async {
    if (!await Permission.location.isGranted) {
      await Permission.location.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
        decoration: kLoadingScreenDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/loading.png',
            ),
            const Gap(30),
            Text('Weather Application',
                textAlign: TextAlign.center, style: kTitleStyle),
            const Gap(15),
            Text(
              'Get to know your weather maps and adar perception forecast',
              textAlign: TextAlign.center,
              style: kSubTitleStyle,
            ),
            const Gap(30),
            isLoading
                ? const CircularProgressIndicator()
                : GestureDetector(
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });
                      if (!await Permission.location.isGranted) {
                        getUserPermission();
                      } else {
                        Position currentLocation =
                            await LocationClass().getMyLocation();

                        if (context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CityScreen(
                                currentLocation: currentLocation,
                              ),
                            ),
                          );
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }
                    },
                    child: ClickedContainer(
                      data: 'Get Started',
                      isLoading: isLoading,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
