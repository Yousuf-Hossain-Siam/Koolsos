import 'package:dummy_project_1/core/common/style/global_text_style.dart';
import 'package:dummy_project_1/core/utils/constants/app_text.dart';
import 'package:dummy_project_1/core/utils/constants/colors.dart';
import 'package:dummy_project_1/core/utils/constants/image_path.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_appbar.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_submit_button.dart';
import 'package:dummy_project_1/core/widgets/screens/monthly_package.dart';
import 'package:dummy_project_1/features/subscription/controller/subscription_screen_controller.dart';
import 'package:dummy_project_1/features/subscription/screens/subscription_payment_screen.dart';
import 'package:dummy_project_1/features/subscription/widgets/subscription_auto_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class SubscriptionPlan extends StatelessWidget {
  final SubscriptionController controller = Get.put(SubscriptionController());
   SubscriptionPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: SizedBox(),
                  //     ),
                  //     CustomBackButton().marginOnly(right: 16)
                  //   ],
                  // ),

                  // background image
                  Image.asset(
                    ImagePath.subscription2,
                    width: MediaQuery.of(context).size.width * 0.70,
                    height: MediaQuery.of(context).size.height * 0.36,
                    fit: BoxFit.contain,
                  ).marginOnly(bottom: 16),

                  // title
                  Text(
                    AppText.subscriptionPlanTitle,
                    style: getTextStyle(
                      fontFamily: 'montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.textCyan,
                      shadows: [
                        Shadow(
                          offset: Offset(2, 1),
                          blurRadius: 4.0,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  ).marginOnly(bottom: 12),

                  Text(
                    AppText.subscriptionPlanSubTitle,
                    textAlign: TextAlign.center,
                    style: getTextStyle(
                      fontFamily: 'montserrat',
                      fontSize: 12,
                      color: AppColors.textPrimary,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 4.0,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  ),

                  MonthlyPackage().marginOnly(
                    left: 16,
                    right: 16,
                    top: 25,
                    bottom: 20,
                  ),

                  InkWell(
                    onTap:
                        () => PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: SubscriptionPaymentScreen(
                            totalAmount:
                                Get.find<SubscriptionController>()
                                    .subscriptionPlanAmount
                                    .value,
                          ),
                        ),
                    child: Obx(() {
                      final amount =
                          Get.find<SubscriptionController>()
                              .subscriptionPlanAmount
                              .value;
                      final months =
                          Get.find<SubscriptionController>()
                              .subscriptionPlanDuration
                              .value;
                      return CustomSubmitButton(
                        hintText: 'Get a $months months for \$$amount',
                        color: AppColors.accent,
                        innerShadow: true,
                      ).paddingSymmetric(horizontal: 16);
                    }),
                  ),
                  SizedBox(height: 10),
                  SubscriptionAutoText(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
