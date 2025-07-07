import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'seat_view_model.dart';

class SeatPage extends GetView<SeatViewModel> {
  const SeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('좌석 선택'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: 40,
              itemBuilder: (context, index) {
                final seatNumber = index + 1;
                return Obx(() {
                  final isSelected = controller.isSeatSelected(seatNumber);
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isSelected ? Colors.blue : Colors.grey[200],
                      foregroundColor: isSelected ? Colors.white : Colors.black,
                    ),
                    onPressed: () => controller.selectSeat(seatNumber),
                    child: Text('$seatNumber'),
                  );
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: Obx(() {
                final selectedSeat = controller.selectedSeat.value;
                return ElevatedButton(
                  onPressed: selectedSeat != -1
                      ? controller.confirmSeatSelection
                      : null,
                  child: Text(
                    selectedSeat != -1 ? '$selectedSeat번 좌석 선택' : '좌석을 선택해주세요',
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
