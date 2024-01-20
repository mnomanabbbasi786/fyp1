import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/recommendations_controller.dart';

class RecommendationsView extends GetView<RecommendationsController> {
  const RecommendationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RecommendationsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RecommendationsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
