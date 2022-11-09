import 'package:cgm_service/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('CGM Service'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
              child: Obx(() => Text(
                    controller.isReadyScanning.value
                        ? '스캐닝 준비 완료'
                        : '스캐닝 준비 중...',
                    style: const TextStyle(fontSize: 16),
                  )))
        ],
      ),
    );
  }
}
