import 'package:dummy_project_1/core/common/style/global_text_style.dart';
import 'package:dummy_project_1/core/utils/constants/app_text.dart';
import 'package:dummy_project_1/core/utils/constants/colors.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_submit_button.dart';
import 'package:dummy_project_1/features/auth/widgets/pop_up_otp.dart';
import 'package:flutter/material.dart';


class PopUpMenu extends StatelessWidget {
  const PopUpMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 20,
      ), // control width here
      child: Center(
        child: Container(
          height: 220,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.backgroundLight,
            borderRadius: BorderRadius.circular(20), // all 4 corners
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                CrossAxisAlignment.center, // center horizontal alignment
            children: [
              Text(
                AppText.appSignUpVerificationCodeTitle,
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontFamily: 'bricolage',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: AppColors.textCyan,
                ),
              ),
              SizedBox(height: 8),
              Text(
                AppText.appSignUpVerificationCodeSubtitle,
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontFamily: 'monstret',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 4),
              Text(
                AppText.appSignUpVerificationemail,
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontFamily: 'monstret',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.success,
                ),
              ),
          
              
              SizedBox(height: 10),
             
              InkWell(
                onTap: () {
                        showDialog(context: context, builder: (context) => PopUpOtp()
                        );
                      },
                child: CustomSubmitButton(
                  hintText: "Confirm",
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
