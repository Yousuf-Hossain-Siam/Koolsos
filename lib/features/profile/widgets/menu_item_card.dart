

import 'package:dummy_project_1/core/common/style/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MenuItemCard extends StatelessWidget {
   MenuItemCard({
    super.key, required this.title, this.marginBottom = 24, required this.icon,this.onTab});

  final String title;
  final String icon;
  final double? marginBottom;
  VoidCallback? onTab;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(icon, height: 15,).marginOnly(right: 8),
          Expanded(
            child: Text(
              title,
              style: getTextStyle(
                fontFamily: 'bricolage',
                fontWeight: FontWeight.w400,
                fontSize: 16
              ),
            ),
          ),
        ],
      ).marginOnly(bottom: marginBottom ?? 24),
    );
  }
}
