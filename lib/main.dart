import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_train_app/page/home/home_page.dart';
import 'package:flutter_train_app/page/seat/seat_page.dart';
import 'package:flutter_train_app/page/station_list/station_list_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '기차 앱',
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/seat',
          page: () => const SeatPage(),
        ),
        GetPage(
          name: '/station-list',
          page: () => const StationListPage(),
        ),
      ],
    );
  }
}
