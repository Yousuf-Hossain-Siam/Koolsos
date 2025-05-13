import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/toggle_button_controller.dart';

class CustomToggleButtonScreen extends StatelessWidget {
  final ToggleButtonController controller = Get.find();

  CustomToggleButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: controller.toggleState,
          child: Container(
            margin: const EdgeInsets.only(left: 10), // spacing from text
            height: controller.buttonHeight.value,
            width: controller.buttonWidth.value,
            decoration: BoxDecoration(
              color: controller.isActive.value ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(
                controller.borderRadius.value,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              controller.isActive.value ? 'Active' : 'Deactivate',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ));
  }
}
