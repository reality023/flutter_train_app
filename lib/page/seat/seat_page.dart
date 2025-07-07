import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeatPage extends StatelessWidget {
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
                // 출발역, 도착역 표시
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '수서',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(width: 20),
                    Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 30,
                    ),
                    SizedBox(width: 20),
                    Text(
                      '부산',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // 좌석 상태 표시
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 선택됨 상태
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
                    // 선택안됨 상태
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
                        const Text('선택안됨'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // 좌석 목록
          Expanded(
            child: Column(
              children: [
                // ABCD 레이블
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...['A', 'B', 'C', 'D'].map((label) => SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(
                            child: Text(
                              label,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        )),
                  ],
                ),
                // 좌석 리스트
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    itemCount: 20,
                    itemBuilder: (context, rowIndex) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // A열 좌석
                            _buildSeat(false),
                            const SizedBox(width: 4),
                            // B열 좌석
                            _buildSeat(false),
                            // 행 번호
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Center(
                                child: Text(
                                  '${rowIndex + 1}',
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            // C열 좌석
                            _buildSeat(false),
                            const SizedBox(width: 4),
                            // D열 좌석
                            _buildSeat(false),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // 예매하기 버튼
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('예매하기'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeat(bool isSelected) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: isSelected ? Colors.purple : Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
