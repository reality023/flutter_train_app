import 'package:get/get.dart';

class SeatViewModel extends GetxController {
  final selectedSeat = RxInt(-1);

  void selectSeat(int seatNumber) {
    selectedSeat.value = seatNumber;
  }

  bool isSeatSelected(int seatNumber) {
    return selectedSeat.value == seatNumber;
  }

  void confirmSeatSelection() {
    if (selectedSeat.value != -1) {
      Get.back(result: selectedSeat.value);
    }
  }
}
