import 'package:dummy_project_1/core/common/style/global_text_style.dart';
import 'package:dummy_project_1/core/utils/constants/app_text.dart';
import 'package:dummy_project_1/core/utils/constants/colors.dart';
import 'package:dummy_project_1/core/utils/constants/icon_path.dart';
import 'package:dummy_project_1/core/widgets/controller/checkbox_controller.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_bottom_border.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_checkbox.dart';
import 'package:dummy_project_1/core/widgets/screens/custom_submit_button.dart';
import 'package:dummy_project_1/features/card%20payment/screens/card_pay_info.dart';
import 'package:dummy_project_1/features/subscription/controller/payment_option_controller.dart.dart';
import 'package:dummy_project_1/features/subscription/widgets/payment_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class SubscriptionPaymentScreen extends StatelessWidget {
  SubscriptionPaymentScreen({super.key, required this.totalAmount});
  final PaymentOptionController controller = Get.put(PaymentOptionController());
  final checkboxController = Get.put(CheckboxController());

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
                      child: Image.asset(IconPath.dollar, scale: 17),
                    ).marginOnly(right: 170, top: 30),
                  ],
                ),
              ],
            ),
          ),

          CustomBottomBorder(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              paymentOptionTile(title: "Card Pay", iconPath: IconPath.card),
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
            ],
          ).paddingOnly(left: 20, right: 20),
          SizedBox(height: 10),
          CustomBottomBorder(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              paymentOptionTile(
                title: "Online  Pay",
                iconPath: IconPath.onlinepay,
              ),
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
            ],
          ).paddingOnly(left: 20, right: 20),

          CustomBottomBorder(),
          InkWell(

            onTap: () => PersistentNavBarNavigator.pushNewScreen(context, screen:CardPayInfo()),
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
