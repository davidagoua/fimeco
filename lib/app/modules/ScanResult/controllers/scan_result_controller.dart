import 'package:get/get.dart';

class ScanResultController extends GetxController {

  RxList results = [].obs;

  @override
  void onInit() {

    results.value = Get.arguments;
    print(results);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
