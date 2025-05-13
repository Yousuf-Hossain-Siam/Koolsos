// import 'package:dummy_project_1/features/subscription/controller/payment_option_controller.dart.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/utils/constants/app_text.dart';
// import '../../../core/utils/constants/colors.dart';
// import '../../../core/utils/constants/icon_path.dart';
// import '../../../core/widgets/screens/custom_checkbox.dart';


// Widget paymentOptionTile({
//   required String title,
//   required String iconPath,
//   required String keyName,
// }) {
//   final PaymentOptionController controller = Get.find();

//   return Obx(() {
//     final isSelected = controller.isSelected(keyName);

//     return Row(
//       children: [
//         Image.asset(iconPath, height: 15).marginOnly(right: 8),
//         Expanded(
//           child: Text(
//             title,
//             style: TextStyle(
//               fontFamily: "bricolage",
//               fontSize: 16,
//               fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
//               color: AppColors.secondary,
//             ),
//           ),
//         ),
//         CustomCheckbox(
//           value: isSelected,
//           onChanged: (val) => controller.toggleOption(keyName, val),
//         ),
//       ],
//     );
//   });
// }
