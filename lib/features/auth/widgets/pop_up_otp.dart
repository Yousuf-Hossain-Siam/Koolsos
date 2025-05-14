import 'package:dummy_project_1/core/common/style/global_text_style.dart';
import 'package:dummy_project_1/core/utils/constants/app_text.dart';
import 'package:dummy_project_1/core/utils/constants/colors.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PopUpOtp extends StatelessWidget {
  const  PopUpOtp({super.key});

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
          height: 330,
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
                AppText.appSignUpVerificationCode2ndScreenSubTitle,
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
              SizedBox(height: 8),
              Pinput(
                //  obscureText: true,
                //  obscuringWidget: Text(""),
                length: 4,
                autofocus: true,
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                decoration: BoxDecoration(
      color: AppColors.inactiveBox1Color, // 👈 background color
      border: Border.all(color: Colors.grey), // 👈 border color
      borderRadius: BorderRadius.circular(10),
    ),
                ),
                
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppText.appSignUpVerificationDonTGetCode,
                    textAlign: TextAlign.center,
                    style: getTextStyle(
                      fontFamily: 'monstret',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.surfaceDark,
                    ),
                  ),
                  Text(
                    AppText.appSignUpVerificationResendCode,
                    textAlign: TextAlign.center,
                    style: getTextStyle(
                      fontFamily: 'monstret',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.error,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              CustomSubmitButton(
                hintText: "Continue",
                color: AppColors.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
