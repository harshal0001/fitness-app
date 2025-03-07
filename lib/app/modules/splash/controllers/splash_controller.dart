import 'package:get/get.dart';
import 'package:fitness_app/app/modules/home/views/home_view.dart';

class SplashController extends GetxController {
  var opacity = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 500), () {
      opacity.value = 1.0;
      Future.delayed(Duration(seconds: 3), () {
        Get.off(HomeView());
      });
    });
  }
}