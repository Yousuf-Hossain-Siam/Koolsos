import 'package:dummy_project_1/core/common/style/global_text_style.dart';
import 'package:dummy_project_1/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayPassTextField extends StatelessWidget {
  final String title;
  final String hintText;

  const PayPassTextField({
    super.key,
    required this.title,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: getTextStyle(
            fontFamily: 'bricolage',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: AppColors.activeBox2Color,
          ),
        ).paddingOnly(left: 10),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFDADADA)), // light grey
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFDADADA)), // light grey
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 9),
          ),
        ).paddingOnly(left: 20, right: 20, top: 4),
      ],
    );
  }
}
