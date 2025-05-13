import 'package:dummy_project_1/core/common/style/global_text_style.dart';
import 'package:dummy_project_1/core/utils/constants/app_text.dart';
import 'package:dummy_project_1/core/utils/constants/colors.dart';
import 'package:dummy_project_1/core/utils/constants/icon_path.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_bottom_border.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_submit_button.dart';
import 'package:dummy_project_1/features/subscription/controller/payment_option_controller.dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionPaymentScreen extends StatelessWidget {
   SubscriptionPaymentScreen({super.key, required this.totalAmount});
  final PaymentOptionController controller = Get.put(PaymentOptionController());

  final int totalAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppText.subscriptionScreenTotalAmount,
                  style: getTextStyle(
                    fontFamily: "bricolage",
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textCyan,
                  ),
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        totalAmount.toString(),
                        style: getTextStyle(
                          fontFamily: "bricolage",
                          fontSize: 86,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                          shadows: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(2, 2),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        IconPath.dollar,
                        scale: 17,
                      ),
                    ).marginOnly(right: 170, top: 30),

                  ],
                ),
              ],
            ),
          ),
         
         CustomBottomBorder(),

        


          GestureDetector(
            onTap: () {
              // TODO: Implement payment logic or navigate to confirmation
              print('Payment button tapped');
            },
            child: CustomSubmitButton(
              hintText: 'Pay Now',
              color: AppColors.accent,
              innerShadow: true,
            ).paddingSymmetric(horizontal: 16, vertical: 16),
          ),
        ],
      ),
    );
  }
}
