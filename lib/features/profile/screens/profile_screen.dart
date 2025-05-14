import 'package:dummy_project_1/core/common/style/global_text_style.dart';
import 'package:dummy_project_1/core/utils/constants/app_text.dart';
import 'package:dummy_project_1/core/utils/constants/colors.dart';

import 'package:dummy_project_1/core/widgets/controller/toggle_button_controller.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_bottom_border.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_toggle_button_screen.dart';
import 'package:dummy_project_1/features/card%20payment/screens/card_activation_screen.dart';
import 'package:dummy_project_1/features/history/screens/history_screen.dart';
import 'package:dummy_project_1/features/password/screens/password_screen.dart';
import 'package:dummy_project_1/features/privacy/screens/privacy_and_policy.dart';
import 'package:dummy_project_1/features/profile/screens/edit_profile_screen.dart';
import 'package:dummy_project_1/features/profile/widgets/menu_item_card.dart';
import 'package:dummy_project_1/features/terms%20&%20condition/screens/terms_and_conditon_screen.dart';
import 'package:dummy_project_1/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
    final ToggleButtonController controller = Get.put(ToggleButtonController());
ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      height: Get.height / 10,
                      width: Get.width / 4,
                      child: Image.asset(
                        "assets/images/profile_iamge.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // business name
                      Text(
                        'Business Name',
                        style: getTextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
              
                      // person name
                      Text(
                        'Johnson Rush',
                        style: getTextStyle(
                          fontFamily: 'bricolage',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.accent,
                          shadows: [
                            Shadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              offset: Offset(2, 2),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                      ),
              
                      // user email
                      Text(
                        'yourmail@gmail.com',
                        style: getTextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ).paddingOnly(bottom: 10),
                  CustomToggleButtonScreen(activeText: 'Active',
  inactiveText: 'Deactivate',).paddingOnly(bottom: 20, )
                ],
              ).paddingOnly( top: 20),
            ),

            InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => EditProfileScreen(),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFF1FAFF),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Text(
          'Edit Profile',
          style: getTextStyle(
            color: const Color(0xFF009DE8),
            fontSize: 10,
            fontFamily: 'bricolage',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ).paddingOnly(right: 50),
     // user selected location
            Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: Colors.red,
                ).marginOnly(right: 5),
                Expanded(
                  child: Text(
                    AppText.selectServiceAreaTitle,
                    style: getTextStyle(
                      fontFamily: 'bricolage',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.success,
                    ),
                  ),
                ),
              ],
            ).marginOnly(top: 16, ),

            Text(
                    "If the service area is not selected, you will not be able to find any consumers.",
                    style: getTextStyle(
                      fontFamily: 'bricolage',
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textPrimary,
                    ),
                  ).paddingOnly( top: 5),
                   
       SizedBox(height: 20,),            
      CustomBottomBorder(),

  // 👇 Menu Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MenuItemCard(
                 onTab: () => PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: HistoryScreen(),
                ),
                  title: 'History',
                  icon: 'assets/icons/history.png',
                ),

                InkWell(
                  onTap: () => PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: CardActivationScreen(),
                  ),
                  child: MenuItemCard(
            
                    title: 'Add Card Payment',
                    icon: 'assets/icons/card payment.png',
                  ),
                ),
                InkWell(
                  onTap: () => PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: PasswordScreen(),
                  ),
                  child: MenuItemCard(
                    title: 'Change Password',
                    icon: 'assets/icons/password.png',
                  ),
                ),
                InkWell(
                  onTap: () => PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: TermsAndConditonScreen(),
                  ),
                  child: MenuItemCard(
                    title: 'Terms & Conditions',
                    icon: 'assets/icons/terms condition.png',
                  ),
                ),
                InkWell(
                  onTap: () => PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: PrivacyAndPolicy(),
                  ),
                  child: MenuItemCard(
                    title: 'Privacy Policy',
                    icon: 'assets/icons/privacy.png',
                  ),
                ),
                InkWell(
                  onTap: () => Get.offAllNamed(AppRoute.loginScreen),
                  child: MenuItemCard(
                    title: 'Log Out',
                    icon: 'assets/icons/logout.png',
                  ),
                ),
              ],
            ).marginOnly(top: 24),
          ],
        ).paddingSymmetric(horizontal: 16),
            
  

),
          
        );
      
    
  }
}

