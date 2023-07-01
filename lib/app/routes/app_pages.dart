import 'package:get/get.dart';

import '../modules/Enregistrement/bindings/enregistrement_binding.dart';
import '../modules/Enregistrement/views/enregistrement_view.dart';
import '../modules/Profile/bindings/profile_binding.dart';
import '../modules/Profile/views/profile_view.dart';
import '../modules/ScanResult/bindings/scan_result_binding.dart';
import '../modules/ScanResult/views/scan_result_view.dart';
import '../modules/Service/bindings/service_binding.dart';
import '../modules/Service/views/service_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SERVICE,
      page: () => const ServiceView(),
      binding: ServiceBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ENREGISTREMENT,
      page: () => const EnregistrementView(),
      binding: EnregistrementBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_RESULT,
      page: () => const ScanResultView(),
      binding: ScanResultBinding(),
    ),
  ];
}
