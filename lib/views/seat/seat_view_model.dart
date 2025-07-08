import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/views/seat/models/seat.dart';
import 'package:get/get.dart';

class SeatViewModel extends GetxController {
  final selectedSeats = <Seat>{}.obs;
  final allSeats = <Seat>[].obs;
  final departureStation = ''.obs;
  final arrivalStation = ''.obs;

  @override
  void onInit() {
    super.onInit();
    allSeats.addAll(Seat.generateSeats());

    final args = Get.arguments as Map<String, dynamic>?;
    departureStation.value = args?['departure'] as String? ?? '선택';
    arrivalStation.value = args?['arrival'] as String? ?? '선택';
  }

  void toggleSeat(Seat seat) {
    if (selectedSeats.contains(seat)) {
      selectedSeats.remove(seat);
    } else {
      selectedSeats.add(seat);
    }

    update();
  }

  void showBookingConfirmDialog(BuildContext context) {
    if (selectedSeats.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('알림'),
          content: const Text('좌석을 선택해주세요.'),
          actions: [
            TextButton(
              child: const Text('확인'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
      return;
    }

    final formattedSeats = selectedSeats
        .map((seat) => seat.row.toString() + seat.column)
        .join(', ');

    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('예매 하시겠습니까?'),
        content: Text('좌석: $formattedSeats'),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text('취소'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('확인'),
            onPressed: () {
              Navigator.pop(context);
              Get.until((route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}
