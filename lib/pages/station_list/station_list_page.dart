import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_train_app/constants/app_constants.dart';
import 'package:flutter_train_app/models/station.dart';

class StationListPage extends StatelessWidget {
  const StationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final type =
        Get.arguments?['type'] as String? ?? AppConstants.departureType;
    final stations = Station.stations;

    return Scaffold(
      appBar: AppBar(
        title: Text('$type 선택'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemCount: stations.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final station = stations[index];
          return SizedBox(
            height: 40,
            child: ListTile(
              minTileHeight: 0,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              title: Text(
                station.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => Get.back(result: station.name),
            ),
          );
        },
      ),
    );
  }
}
