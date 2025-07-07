import 'package:get/get.dart';
import 'seat_view_model.dart';

class SeatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SeatViewModel());
  }
}
