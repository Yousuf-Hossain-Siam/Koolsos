import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomBorder extends StatelessWidget {
  const CustomBottomBorder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: 0.5,
    width: double.infinity,
    child: Container(
      color: Color(0xFFE9EAEA), // --Grey-50
    ).paddingOnly(left: 20, right: 20),
        );
  }
}
