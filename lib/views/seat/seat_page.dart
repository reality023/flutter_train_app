import 'package:flutter/material.dart';
import 'package:flutter_train_app/views/seat/seat_view_model.dart';
import 'package:flutter_train_app/widgets/app_button.dart';
import 'package:get/get.dart';

class SeatPage extends GetView<SeatViewModel> {
  const SeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('좌석 선택'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.departureStation.value,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 30,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      controller.arrivalStation.value,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text('선택됨'),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text('선택 안 됨'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: Text(
                                'A',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 4),
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: Text(
                                'B',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 50),
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: Text(
                                'C',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 4),
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: Text(
                                'D',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    itemCount: 20,
                    itemBuilder: (context, rowIndex) {
                      final row = rowIndex + 1;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                _buildSeat(row, 'A'),
                                const SizedBox(width: 4),
                                _buildSeat(row, 'B'),
                              ],
                            ),
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Center(
                                child: Text(
                                  '$row',
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                _buildSeat(row, 'C'),
                                const SizedBox(width: 4),
                                _buildSeat(row, 'D'),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: AppButton(
                text: '예매하기',
                onPressed: () => controller.showBookingConfirmDialog(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeat(int row, String column) {
    return Obx(() {
      final seat = controller.allSeats.firstWhere(
        (s) => s.row == row && s.column == column,
      );

      final isSelected = controller.selectedSeats.contains(seat);

      return GestureDetector(
        onTap: () => controller.toggleSeat(seat),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: isSelected ? Colors.purple : Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
    });
  }
}
