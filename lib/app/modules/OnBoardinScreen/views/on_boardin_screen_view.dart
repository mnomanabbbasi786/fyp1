import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/on_boardin_screen_controller.dart';

class OnBoardinScreenView extends GetView<OnBoardinScreenController> {
  const OnBoardinScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnBoardinScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OnBoardinScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
