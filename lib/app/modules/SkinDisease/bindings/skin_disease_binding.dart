import 'package:get/get.dart';

import '../controllers/skin_disease_controller.dart';

class SkinDiseaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SkinDiseaseController>(
      () => SkinDiseaseController(),
    );
  }
}
