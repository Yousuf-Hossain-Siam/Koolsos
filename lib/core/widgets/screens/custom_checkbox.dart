import 'package:dummy_project_1/core/widgets/controller/checkbox_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Adjust path as needed

class CustomCheckbox extends StatelessWidget {
  final double? size;
  final double? iconSize;
  final void Function(bool)? onChange;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? borderColor;
  final IconData? icon;
  final CheckboxController controller;
  final double? borderRadius; 

  const CustomCheckbox({
    Key? key,
    this.size,
    this.iconSize,
    this.onChange,
    this.backgroundColor,
    this.iconColor,
    this.borderColor,
    this.icon,
    this.borderRadius,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isChecked = controller.isChecked.value;
      return GestureDetector(
        onTap: () {
          controller.toggleCheckbox();
          if (onChange != null) {
            onChange!(isChecked);
          }
        },
        child: AnimatedContainer(
          height: size ?? 28,
          width: size ?? 28,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 2.0),
            color: isChecked
                ? backgroundColor ?? Colors.blue
                : Colors.transparent,
            border: Border.all(color: borderColor ?? Colors.black),
          ),
          child: isChecked
              ? Icon(
                  icon ?? Icons.check,
                  color: iconColor ?? Colors.white,
                  size: iconSize ?? 20,
                )
              : null,
        ),
      );
    });
  }
}
