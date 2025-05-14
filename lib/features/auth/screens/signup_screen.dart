import 'package:dummy_project_1/core/common/style/global_text_style.dart';
import 'package:dummy_project_1/core/utils/constants/app_text.dart';
import 'package:dummy_project_1/core/utils/constants/colors.dart';
import 'package:dummy_project_1/core/widgets/controller/checkbox_controller.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_checkbox.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_submit_button.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_text_field.dart';
import 'package:dummy_project_1/features/auth/controllers/auth_controller.dart';
import 'package:dummy_project_1/features/auth/widgets/pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  final checkboxController = Get.put(CheckboxController());
  final AuthController authController = Get.put(AuthController());

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    const double smallScreenHeight = 600.0;
    const double mediumScreenHeight = 800.0;

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController numberController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: screenHeight < smallScreenHeight ? 70 : 150,
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
            ).marginOnly(bottom: 50, top: 50),

            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Color(0xFF40B3EA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: Column(
                children: [
                  Text(
                    'Create an Account \n    As A Engineer',
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

                  CustomTextField(
                    hintText: "Your Full Name",
                    controller: nameController,
                  ).marginOnly(left: 16, right: 16, bottom: 12),

                  CustomTextField(
                    hintText: "Phone Number",
                    controller: numberController,
                  ).marginOnly(left: 16, right: 16, bottom: 12),

                  CustomTextField(
                    hintText: "Enter Email Address",
                    controller: emailController,
                  ).marginOnly(left: 16, right: 16, bottom: 12),

                  CustomTextField(
                    hintText: "New Password",
                    controller: passwordController,
                  ).marginOnly(left: 16, right: 16, bottom: 12),

                  CustomTextField(
                    hintText: "Conform Password",
                    controller: passwordController,
                  ).marginOnly(left: 16, right: 16, bottom: 12),

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
                      Expanded(
                        child: Text(
                          "Buy Creating An account You agree to continue \nour terms and conditions.",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ).paddingOnly(left: 30, right: 16),
                  SizedBox(height: 20),

                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => PopUpMenu());
                    },
                    child: CustomSubmitButton(
                      hintText: "Continue",
                    ).paddingOnly(left: 20, right: 20),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Do you have an Account? Sign In",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
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
