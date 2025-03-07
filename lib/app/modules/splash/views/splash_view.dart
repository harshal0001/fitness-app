import 'package:fitness_app/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:fitness_app/app/modules/home/views/home_view.dart';

class SplashController extends GetxController {
  var currentIndex = 0.obs; // Controls the animation sequence

  @override
  void onInit() {
    super.onInit();
    _startAnimationSequence();
  }

  void _startAnimationSequence() async {
    await Future.delayed(Duration(seconds: 1));
    currentIndex.value = 1;

    await Future.delayed(Duration(seconds: 1));
    currentIndex.value = 2;

    await Future.delayed(Duration(seconds: 2));
    Get.off(HomeView()); // Navigate to Home
  }
}

class SplashView extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThemeService().theme == ThemeMode.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Center(
        child: Obx(() {
          String assetName;
          switch (controller.currentIndex.value) {
            case 0:
              assetName = isDarkMode ? 'assets/key.svg' : 'assets/key.svg';
              break;
            case 1:
              assetName =
                  isDarkMode ? 'assets/logo_dark.svg' : 'assets/logo_light.svg';
              break;
            default:
              assetName =
                  isDarkMode ? 'assets/logo_dark.svg' : 'assets/logo_light.svg';
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: SvgPicture.asset(
                  assetName,
                  key: ValueKey<String>(assetName),
                  height: 80,
                ),
              ),
              if (controller.currentIndex.value == 2)
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: Duration(seconds: 1),
                  child: Text(
                    "Fitness",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
