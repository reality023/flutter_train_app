import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StationListPage extends StatelessWidget {
  const StationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final type = Get.arguments['type'] as String;

    final List<String> stations = [
      '수서',
      '동탄',
      '평택지제',
      '천안아산',
      '오송',
      '대전',
      '김천구미',
      '동대구',
      '경주',
      '울산',
      '부산'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          type,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        children:
            stations.map((station) => _buildStationTile(station)).toList(),
      ),
    );
  }

  Widget _buildStationTile(String stationName) {
    return Container(
      height: 40,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey[300]!),
        ),
      ),
      padding: EdgeInsets.zero,
      child: ListTile(
        minVerticalPadding: 0.0,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        minTileHeight: 0.0,
        title: Text(
          stationName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        onTap: () {
          Get.back(result: stationName);
        },
      ),
    );
  }
}
