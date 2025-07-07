import 'package:flutter/material.dart';
import 'views/home/home_binding.dart';
import 'package:get/get.dart';
import 'views/home/home_page.dart';
import 'views/seat/seat_binding.dart';
import 'views/seat/seat_page.dart';
import 'views/station_list/station_list_binding.dart';
import 'views/station_list/station_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '기차 예매',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/station',
          page: () => const StationListPage(),
          binding: StationListBinding(),
        ),
        GetPage(
          name: '/seat',
          page: () => const SeatPage(),
          binding: SeatBinding(),
        ),
      ],
    );
  }
}
