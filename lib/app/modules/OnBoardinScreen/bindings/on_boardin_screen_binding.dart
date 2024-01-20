import 'package:get/get.dart';

import '../controllers/on_boardin_screen_controller.dart';

class OnBoardinScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardinScreenController>(
      () => OnBoardinScreenController(),
    );
  }
}
