import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_train_app/constants/app_constants.dart';
import 'package:flutter_train_app/pages/home/home_page.dart';
import 'package:flutter_train_app/pages/seat/seat_page.dart';
import 'package:flutter_train_app/pages/station_list/station_list_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appTitle,
      initialRoute: AppConstants.homeRoute,
      getPages: [
        GetPage(
          name: AppConstants.homeRoute,
          page: () => const HomePage(),
        ),
        GetPage(
          name: AppConstants.seatRoute,
          page: () => const SeatPage(),
        ),
        GetPage(
          name: AppConstants.stationListRoute,
          page: () => const StationListPage(),
        ),
      ],
    );
  }
}
