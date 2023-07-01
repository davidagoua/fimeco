import 'package:get/get.dart';

import '../controllers/enregistrement_controller.dart';

class EnregistrementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnregistrementController>(
      () => EnregistrementController(),
    );
  }
}
