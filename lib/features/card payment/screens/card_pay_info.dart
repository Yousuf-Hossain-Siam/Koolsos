import 'package:dummy_project_1/core/common/style/global_text_style.dart';
import 'package:dummy_project_1/core/utils/constants/app_text.dart';

import 'package:dummy_project_1/core/widgets/controller/checkbox_controller.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_checkbox.dart';

import 'package:dummy_project_1/core/widgets/screens/custom_toggle_button_screen.dart';
import 'package:dummy_project_1/core/widgets/screens/paypass_textfield.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardPayInfo extends StatelessWidget {
  final checkboxController = Get.put(CheckboxController());
  CardPayInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
               Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  AppText.paymentTitle,
                  style: getTextStyle(
                    fontFamily: 'bricolage',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ).marginOnly(top: 24, bottom: 16),
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
      
      Row(children: [
 Expanded(
   child: PayPassTextField(
            title: AppText.cardNum,
          hintText: '0000 0000 0000 0000',
   
        ),
 ),
      CustomToggleButtonScreen(activeText: 'Visa',
  inactiveText: 'Subscribe',).paddingOnly(right: 10)
      ],),
     

      SizedBox(height: 30),
      Row(
        children: [
          Expanded(
        child: PayPassTextField(
            title:  AppText.expire,
          hintText: '20-Jan-2030',
              ),
      ),
      
      
      Expanded(
        child: PayPassTextField(
            title: AppText.cvv,
          hintText: '0000 0000 0000 0000',
              ),
      )
     
        ],
      ),

      SizedBox(height: 30),
       PayPassTextField(
          title: AppText.cardHolder,
        hintText: 'Mr. Jhon Don',
      ),
       SizedBox(height: 20),
   Row(
    children: [
        CustomCheckbox(
                controller: checkboxController,
                borderRadius: 3.0,
                size: 14,
                iconSize: 12,
                backgroundColor: Colors.transparent,
                iconColor: Colors.green,
                borderColor: Colors.green,
                icon: Icons.check,
                onChange: (val) {
                  print("Checked: $val");
                },
              ),
           SizedBox(width: 5,),
              Text(
                  AppText.checkBox,
                  style: getTextStyle(
                    fontFamily: 'bricolage',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                )
    ],
   ).paddingOnly(left: 20)

        ],
      ),
    );
  }
}

