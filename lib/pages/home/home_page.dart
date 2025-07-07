import 'package:flutter/material.dart';
import 'package:flutter_train_app/widgets/app_button.dart';
import 'package:get/get.dart';
import 'package:flutter_train_app/pages/station_list/models/station.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Station? departureStation;
  Station? arrivalStation;

  void _selectStation(String type) async {
    final result = await Get.toNamed(
      '/station-list',
      arguments: {'type': type},
    );

    if (result != null) {
      setState(() {
        if (type == '출발역') {
          departureStation =
              Station.stations.firstWhere((s) => s.name == result);
        } else {
          arrivalStation = Station.stations.firstWhere((s) => s.name == result);
        }
      });
    }
  }

  void _onSeatSelect() {
    if (departureStation == null || arrivalStation == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('알림'),
          content: const Text('출발역과 도착역을 선택해주세요.'),
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

    if (departureStation?.name == arrivalStation?.name) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('알림'),
          content: const Text('출발역과 도착역이 같을 수 없습니다.'),
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

    Get.toNamed(
      '/seat',
      arguments: {
        'departure': departureStation?.name,
        'arrival': arrivalStation?.name,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기차 예매'),
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => _selectStation('출발역'),
                          child: Column(
                            children: [
                              const Text(
                                '출발역',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                departureStation?.name ?? '선택',
                                style: const TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 2,
                          height: 50,
                          color: Colors.grey[400],
                        ),
                        InkWell(
                          onTap: () => _selectStation('도착역'),
                          child: Column(
                            children: [
                              const Text(
                                '도착역',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                arrivalStation?.name ?? '선택',
                                style: const TextStyle(
                                  fontSize: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: AppButton(
                  text: '좌석 선택',
                  onPressed: _onSeatSelect,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
