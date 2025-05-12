import 'package:dummy_project_1/core/widgets/controller/checkbox_controller.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_checkbox.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_submit_button.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_text_field.dart';
import 'package:dummy_project_1/features/auth/controllers/auth_controller.dart';
import 'package:dummy_project_1/features/auth/screens/forget_password.dart';
import 'package:dummy_project_1/features/auth/screens/new_pass.dart';
import 'package:dummy_project_1/features/auth/screens/signup_screen.dart';
import 'package:dummy_project_1/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPass extends StatelessWidget {
  final checkboxController = Get.put(CheckboxController());
  final AuthController authController = Get.put(AuthController());

  NewPass({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen height from MediaQuery
    double screenHeight = MediaQuery.of(context).size.height;

    // Define your custom screen size conditions
    const double smallScreenHeight = 600.0; // Example height for small screens
    const double mediumScreenHeight =
        800.0; // Example height for medium screens

    // TextEditingControllers for the fields
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          // Top container with circle decoration
          Container(
            color: Colors.white,
            height:
                screenHeight < smallScreenHeight
                    ? 140
                    : 300, // Conditional height
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

          // App name with shadow
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
          ).marginOnly(bottom: 50, top: 50),

          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(top: 28),
              decoration: BoxDecoration(
                color: Color(0xFF40B3EA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Login header text
                    Text(
                      'Set New Password',
                      style: GoogleFonts.bricolageGrotesque(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        shadows: [
                          Shadow(
                            offset: Offset(3, 4), // Shadow offset
                            blurRadius: 0, // No blur
                            color: Color(
                              0xFF000000,
                            ).withOpacity(0.08), // Shadow color
                          ),
                        ],
                      ),
                    ).marginOnly(bottom: 24),
                    Text(
                          " We will send a mail to the mail address you \n       registered to regain your password",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ).paddingOnly(bottom: 30),

                  

                    // Email input field
                    CustomTextField(
                      hintText: "Enter Email or User Name",
                      controller: emailController, // Pass email controller
                    ).marginOnly(left: 16, right: 16, bottom: 12),

                    // Password input field
                    CustomTextField(
                      hintText: "Enter Password",
                      controller:
                          passwordController, // Pass password controller
                    ).marginOnly(left: 16, right: 16, bottom: 12),

                    
                       Text(
                          "At least 8 characters, with uppercase \nand Lowercase letter.",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ).paddingOnly(right: 120),
                    // Submit button (removed CustomSubmitButton for now)
                  
                    SizedBox(height: 20),
                    InkWell(
                       onTap: () => Get.to(NewPass()),
                      child: CustomSubmitButton(
                        hintText: "Continue",
                      ).paddingOnly(left: 20, right: 20),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                   onTap: () => Get.to(SignupScreen()),
                      child: Text(
                        "Do your have an Account? Sing Up",
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
            ),
          ),
        ],
      ),
    );
  }
}
