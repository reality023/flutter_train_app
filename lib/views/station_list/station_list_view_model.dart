import 'package:get/get.dart';
import 'package:flutter_train_app/views/station_list/models/station.dart';

class StationListViewModel extends GetxController {
  final stations = Station.stations.obs;
  final selectedStation = RxString('');

  void selectStation(String station) {
    selectedStation.value = station;
    Get.back(result: station);
  }

  void searchStations(String query) {
    final filteredStations = Station.stations
        .where((station) => station.name.contains(query))
        .toList();
    selectedStation.value = filteredStations.first.name;
  }
}
