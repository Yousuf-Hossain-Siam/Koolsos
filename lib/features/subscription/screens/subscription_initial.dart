
import 'package:dummy_project_1/core/common/style/global_text_style.dart';
import 'package:dummy_project_1/core/utils/constants/app_text.dart';
import 'package:dummy_project_1/core/utils/constants/colors.dart';

import 'package:dummy_project_1/core/widgets/screens/custom_submit_button.dart';
import 'package:dummy_project_1/features/subscription/screens/subscription_plan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';


class SubscriptionInitial extends StatelessWidget {
  const SubscriptionInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            // appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // image
          SizedBox(height: context.height * 0.040),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: Image.asset("assets/images/profile1.png"),
            ),
          ),

          Text(
            AppText.subscriptionScreenInitialTitle,
            textAlign: TextAlign.center,
            style: getTextStyle(
              fontFamily: 'bricolage',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: AppColors.accent,
              shadows: [
                Shadow(
                  offset: Offset(0, 2),
                  blurRadius: 4.0,
                  color: Colors.black26,
                ),
              ],
            ),
          ).paddingOnly(bottom: 24, top: 55),

          InkWell(
            onTap: () => PersistentNavBarNavigator.pushNewScreen(context, screen: SubscriptionPlan()),
            child: CustomSubmitButton(
              hintText: 'Buy Now',
              color: AppColors.accent,
              innerShadow: true,
            ).paddingOnly(bottom: context.height * 0.040),
          ),
        ],
      ).marginSymmetric(horizontal: 16),
    );
  }
}
