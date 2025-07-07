import 'package:get/get.dart';
import 'station_list_view_model.dart';

class StationListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StationListViewModel());
  }
}
