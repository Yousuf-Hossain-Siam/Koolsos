import 'package:dummy_project_1/core/widgets/controller/checkbox_controller.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_bottom_nav_bar.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_checkbox.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_submit_button.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_text_field.dart';
import 'package:dummy_project_1/features/auth/controllers/auth_controller.dart';
import 'package:dummy_project_1/features/auth/screens/forget_password.dart';
import 'package:dummy_project_1/features/auth/screens/signup_screen.dart';
import 'package:dummy_project_1/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  final checkboxController = Get.put(CheckboxController());
  final AuthController authController = Get.put(AuthController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    const double smallScreenHeight = 600.0;
    const double mediumScreenHeight = 800.0;

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top container with decorative circle
            Container(
              color: Colors.white,
              height: screenHeight < smallScreenHeight ? 140 : 300,
              child: Stack(
                children: [
                  Positioned(
                    bottom: screenHeight < mediumScreenHeight ? 10 : 50,
                    right: screenHeight < mediumScreenHeight ? 10 : 50,
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
      
            // App name
            Text(
              'Koolsos',
              style: GoogleFonts.bricolageGrotesque(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
                decoration: TextDecoration.none,
                shadows: [
                  Shadow(
                    offset: Offset(3, 4),
                    blurRadius: 0,
                    color: Color(0xFF000000).withOpacity(0.08),
                  ),
                ],
              ),
            ).marginOnly(bottom: 30, top: 30),
      
            // Bottom container
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF40B3EA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: EdgeInsets.only(top: 32, bottom: 32),
              child: Column(
                children: [
                  // Header
                  Text(
                    'Let’s Sign In As An Engineer',
                    style: GoogleFonts.bricolageGrotesque(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      shadows: [
                        Shadow(
                          offset: Offset(3, 4),
                          blurRadius: 0,
                          color: Color(0xFF000000).withOpacity(0.08),
                        ),
                      ],
                    ),
                  ).marginOnly(bottom: 24),
      
                  // Email field
                  CustomTextField(
                    hintText: "Enter Email or User Name",
                    controller: emailController,
                  ).marginOnly(left: 16, right: 16, bottom: 12),
      
                  // Password field
                  CustomTextField(
                    hintText: "Enter Password",
                    controller: passwordController,
                  ).marginOnly(left: 16, right: 16, bottom: 12),
      
                  // Remember me and forgot password
                  Row(
                    children: [
                      CustomCheckbox(
                        controller: checkboxController,
                        borderRadius: 5.0,
                        size: 14,
                        iconSize: 12,
                        backgroundColor: Colors.transparent,
                        iconColor: Colors.black,
                        borderColor: Colors.black,
                        icon: Icons.check,
                        onChange: (val) {
                          print("Checked: $val");
                        },
                      ),
                      SizedBox(width: 6),
                      Text(
                        "Remember me",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () => Get.to(ForgetPassword()),
                        child: Text(
                          "Forget password?",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                    ],
                  ).paddingOnly(left: 30, right: 30),
      
                  SizedBox(height: 20),
      
                  // Continue button
                  InkWell(
                    onTap: () => Get.to(CustomBottomNavBar()),
                    child: CustomSubmitButton(
                      hintText: "Continue",
                    ).paddingOnly(left: 20, right: 20),
                  ),
      
                  SizedBox(height: 20),
      
                  // Sign up
                  InkWell(
                    onTap: () => Get.to(SignupScreen()),
                    child: Text(
                      "Do not have an Account? Create Now",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
