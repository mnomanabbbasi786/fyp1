import 'package:get/get.dart';

import '../modules/Auth/bindings/auth_binding.dart';
import '../modules/Auth/views/auth_view.dart';
import '../modules/ECG/bindings/ecg_binding.dart';
import '../modules/ECG/views/ecg_view.dart';
import '../modules/OnBoardinScreen/bindings/on_boardin_screen_binding.dart';
import '../modules/OnBoardinScreen/views/on_boardin_screen_view.dart';
import '../modules/Recommendations/bindings/recommendations_binding.dart';
import '../modules/Recommendations/views/recommendations_view.dart';
import '../modules/SkinDisease/bindings/skin_disease_binding.dart';
import '../modules/SkinDisease/views/skin_disease_view.dart';
import '../modules/Sleep/bindings/sleep_binding.dart';
import '../modules/Sleep/views/sleep_view.dart';
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
        middlewares: []),
    GetPage(
      name: _Paths.ECG,
      page: () => const EcgView(),
      binding: EcgBinding(),
    ),
    GetPage(
      name: _Paths.SKIN_DISEASE,
      page: () => const SkinDiseaseView(),
      binding: SkinDiseaseBinding(),
    ),
    GetPage(
      name: _Paths.RECOMMENDATIONS,
      page: () => const RecommendationsView(),
      binding: RecommendationsBinding(),
    ),
    GetPage(
      name: _Paths.SLEEP,
      page: () => const SleepView(),
      binding: SleepBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDIN_SCREEN,
      page: () => const OnBoardinScreenView(),
      binding: OnBoardinScreenBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
  ];
}
