import 'package:get/get.dart';
import 'package:flutter_train_app/views/station_list/models/station.dart';

class StationListViewModel extends GetxController {
  final RxList<Station> stations = <Station>[].obs;
  final selectedStation = RxString('');

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>?;
    final arrival = args?['arrival'];
    final departure = args?['departure'];

    stations.addAll(Station.stations);

    if (arrival != null) {
      stations.removeWhere((station) => station.name == arrival);
    }

    if (departure != null) {
      stations.removeWhere((station) => station.name == departure);
    }
  }

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
