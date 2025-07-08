import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'station_list_view_model.dart';

class StationListPage extends GetView<StationListViewModel> {
  const StationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String type = Get.arguments['type'];

    return Scaffold(
      appBar: AppBar(
        title: Text(type),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.stations.length,
                itemBuilder: (context, index) {
                  final station = controller.stations[index];
                  return Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        station.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => controller.selectStation(station.name),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
