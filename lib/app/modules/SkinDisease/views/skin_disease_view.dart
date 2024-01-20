import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/skin_disease_controller.dart';

class SkinDiseaseView extends GetView<SkinDiseaseController> {
  const SkinDiseaseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SkinDiseaseView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SkinDiseaseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
