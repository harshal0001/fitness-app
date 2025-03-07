import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_app/app/modules/home/controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Health Connect Data")),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildStatCard("Steps", controller.steps.value.toString(), "15,000", Icons.directions_walk),
              SizedBox(height: 20),
              _buildStatCard("Calories Burned", controller.calories.value.toString(), "1,000", Icons.local_fire_department),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, String goal, IconData icon) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
                Text(value, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                Text("Goal: $goal", style: TextStyle(color: Colors.white70)),
              ],
            ),
            Icon(icon, color: Colors.white, size: 40),
          ],
        ),
      ),
    );
  }
}
