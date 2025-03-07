import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_app/app/modules/splash/views/splash_view.dart';
import 'package:fitness_app/theme/theme_service.dart';
import 'package:fitness_app/theme/themes.dart';
import 'package:health/health.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Health().configure();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: SplashView(),
    );
  }
}
