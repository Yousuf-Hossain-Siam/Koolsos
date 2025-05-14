import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget paymentOptionTile({
  required String title,
  required String iconPath,
}) {
  return Row(
    children: [
      // Display the icon
      Image.asset(iconPath, height: 24, width: 24).marginOnly(right: 8),
      // Display the title text
      Text(
        title,
        style: TextStyle(
          fontFamily: "bricolage", // Your custom font
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black, // Adjust color as needed
        ),
      ),
    ],
  );
}