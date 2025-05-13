import 'package:device_preview/device_preview.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_bottom_nav_bar.dart';
import 'package:dummy_project_1/features/auth/screens/login_screen.dart';
import 'package:dummy_project_1/features/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() => runApp(
  DevicePreview(
  
    builder: (context) => MyApp(),
     // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // match your Figma or design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
           locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
          ),
          getPages: [
            GetPage(name: '/', page: () => SplashScreen()),
            GetPage(name: '/login', page: () => LoginScreen()),
            GetPage(name: '/home', page: () => CustomBottomNavBar()), 
   
          ],
        );
      },
    );
  }
}
