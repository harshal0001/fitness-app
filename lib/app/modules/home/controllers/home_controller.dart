import 'package:fitness_app/app/data/services/google_fit_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var steps = 0.obs;
  var calories = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHealthData();
  }

  Future<void> fetchHealthData() async {
    bool isAuthorized = await GoogleHealthService.requestAuthorization();
    if (isAuthorized) {
      steps.value = await GoogleHealthService.getSteps();
      calories.value = await GoogleHealthService.getCalories();
    }
  }
}