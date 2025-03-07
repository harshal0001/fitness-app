import 'dart:developer';
import 'package:health/health.dart';

class GoogleHealthService {
  static final HealthFactory _health = HealthFactory();

  static final List<HealthDataType> types = [
    HealthDataType.STEPS,
    HealthDataType.ACTIVE_ENERGY_BURNED,
  ];

  static Future<bool> requestAuthorization() async {
    bool isAuthorized = await _health.requestAuthorization(types);
    
    if (!isAuthorized) {
      log("Health Connect Authorization Denied");
    }

    return isAuthorized;
  }

  static Future<int> getSteps() async {
    try {
      bool isAuthorized = await requestAuthorization();
      if (!isAuthorized) return 0;

      List<HealthDataPoint> data = await _health.getHealthDataFromTypes(
        DateTime.now().subtract(Duration(days: 1)),
        DateTime.now(),
        [HealthDataType.STEPS],
      );

      int totalSteps = data.fold<int>(0, (sum, item) => sum + (item.value as num).toInt());

      return totalSteps;
    } catch (e) {
      log("Error fetching steps: $e");
      return 0;
    }
  }

  static Future<int> getCalories() async {
    try {
      bool isAuthorized = await requestAuthorization();
      if (!isAuthorized) return 0;

      List<HealthDataPoint> data = await _health.getHealthDataFromTypes(
        DateTime.now().subtract(Duration(days: 1)),
        DateTime.now(),
        [HealthDataType.ACTIVE_ENERGY_BURNED],
      );

      int totalCalories = data.fold<int>(0, (sum, item) => sum + (item.value as num).toInt());

      return totalCalories;
    } catch (e) {
      log("Error fetching calories: $e");
      return 0;
    }
  }
}
