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
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                hintText: '역 이름을 입력하세요',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: controller.searchStations,
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.separated(
                itemCount: controller.stations.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final station = controller.stations[index];
                  return ListTile(
                    title: Text(station.name),
                    onTap: () => controller.selectStation(station.name),
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
