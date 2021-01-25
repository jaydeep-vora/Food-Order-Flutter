import 'package:flutter/material.dart';
import 'package:flutter_animation/View/Auth/RegisterNavigation.dart';
import 'package:flutter_animation/View/Home/DashboardNavigation.dart';
import 'package:flutter_animation/View/Home/RestaurantDetailNavigation.dart';
import 'package:flutter_animation/resource/AppColors.dart';
import 'package:get/get.dart';

import 'View/Spalsh/SplashNavigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontFamily: "Poppins",
                  fontStyle: FontStyle.normal,
                  color: AppColors.primaryTextColor),
              headline2: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextColor),
              headline3: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryTextColor)),
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SpalshNavigation());
  }
}
