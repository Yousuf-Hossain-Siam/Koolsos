import 'package:dummy_project_1/core/common/style/global_text_style.dart';
import 'package:dummy_project_1/core/utils/constants/app_text.dart';
import 'package:dummy_project_1/core/utils/constants/colors.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_submit_button.dart';
import 'package:dummy_project_1/features/subscription/screens/subscription_plan.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CardActivationScreen extends StatelessWidget {
  const CardActivationScreen({super.key, this.isBottomNav = true});

  final bool isBottomNav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        
   
        children: [
          SizedBox(height: 10,),
          // title
          Row(
         
            children: [
              Expanded(
                child: Text(
                  AppText.activationScreenTitle,
                  style: getTextStyle(
                    fontFamily: 'bricolage',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context); // Pops the current screen
                },
                icon: Icon(Icons.arrow_back),
              ),
              Text("Back"),
              // isBottomNav ? SizedBox() : CustomBackButton(),
            ],
          ).paddingOnly(left: 20, right: 20),
        SizedBox(height: 30,),
         Expanded(
                child: Text(
                  AppText.activationScreenSubTitle,
                  style: getTextStyle(
                    fontFamily: 'bricolage',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.success
                  ),
                ).marginOnly(top: 5, left: 20),
              ),
                SizedBox(height: 100,),
              Expanded(
                child: Text(
                  AppText.activationScreenlast,
                  style: getTextStyle(
                    fontFamily: 'bricolage',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color(0xFF00ACFF)
                  ),
                ).marginOnly( left: 20),
              ),

              InkWell(
                onTap: () => PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: SubscriptionPlan(),),
                child: CustomSubmitButton(hintText: "Renew", color: Color(0xFF00ACFF)).paddingOnly(left: 20, right: 20, bottom: 90)),
   
        
        ],
      ),
    );
  }
}
