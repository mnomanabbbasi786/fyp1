import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ecg_controller.dart';

class EcgView extends GetView<EcgController> {
  const EcgView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EcgView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EcgView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
