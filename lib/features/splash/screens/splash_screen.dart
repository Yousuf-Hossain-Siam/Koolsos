// splash_screen.dart

import 'package:dummy_project_1/features/splash/controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';




class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final SplashController controller = Get.put(SplashController());

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          // top
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  bottom: height < 600 ? 10 : 10,
                  right: height < 600 ? 10 : 0,
                  child: Container(
                    height: 784,
                    width: 784,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5FCFF),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // app name with shadow
          Text(
            'Koolsos',
            style: GoogleFonts.bricolageGrotesque(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
              decoration: TextDecoration.none,
              shadows: [
                Shadow(
                  offset: Offset(3, 4), // Shadow offset
                  blurRadius: 0, // No blur
                  color: Color(0xFF000000).withOpacity(0.08), // Shadow color
                ),
              ],
            ),
          ),

          // bottom
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: height < 600 ? 10 : 10,
                  left: height < 600 ? 10 : 0,
                  child: Container(
                    height: 784,
                    width: 784,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5FCFF),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}