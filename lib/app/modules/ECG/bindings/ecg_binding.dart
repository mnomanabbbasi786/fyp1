import 'package:get/get.dart';

import '../controllers/ecg_controller.dart';

class EcgBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EcgController>(
      () => EcgController(),
    );
  }
}
