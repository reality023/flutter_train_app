import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_train_app/pages/station_list/models/station.dart';

class StationListPage extends StatelessWidget {
  const StationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final type = Get.arguments?['type'] as String;
    final stations = Station.stations;

    return Scaffold(
      appBar: AppBar(
        title: Text(type),
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
          return ListTile(
            title: Text(
              station.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () => Get.back(result: station.name),
          );
        },
      ),
    );
  }
}
