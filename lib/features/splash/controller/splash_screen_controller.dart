// splash_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToLogin();
  }

  // Function to navigate to LoginScreen after a delay
  void _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 2));  // Delay of 2 seconds
    Get.toNamed('/login');  // Navigate to LoginScreen
  }
}