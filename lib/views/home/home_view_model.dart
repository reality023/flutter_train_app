import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final departureStation = RxString('');
  final arrivalStation = RxString('');
  final selectedSeat = RxInt(-1);

  Future<void> selectSeat() async {
    if (departureStation.isEmpty || arrivalStation.isEmpty) {
      Get.snackbar(
        '알림',
        '출발역과 도착역을 먼저 선택해주세요',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final result = await Get.toNamed('/seat');
    if (result != null) {
      selectedSeat.value = result as int;
    }
  }

  bool get canReserve =>
      departureStation.isNotEmpty &&
      arrivalStation.isNotEmpty &&
      selectedSeat.value != -1;

  void reserve() {
    if (!canReserve) return;

    Get.dialog(
      AlertDialog(
        title: const Text('예약 확인'),
        content: Text('${departureStation.value}에서 ${arrivalStation.value}까지\n'
            '${selectedSeat.value}번 좌석으로 예약하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () {
              // TODO: 예약 처리 로직 구현
              Get.back();
              Get.snackbar(
                '알림',
                '예약이 완료되었습니다',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }
}
