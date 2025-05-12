import 'dart:core';
import 'package:dummy_project_1/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/constants/sizer.dart';

class CustomSubmitButton extends StatelessWidget {
  const CustomSubmitButton({
    super.key,
    required this.hintText,
    this.color = AppColors.secondary,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.boxShadow,
    this.borderRadius = 10,
    this.textColor = Colors.white,
    this.textShadow,
    this.innerShadow = false,
  });

  final String hintText;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final List<BoxShadow>? boxShadow;
  final double? borderRadius;
  final Color? textColor;
  final List<Shadow>? textShadow;
  final bool? innerShadow;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InnerShadow(
        shadows: innerShadow! ? [
          Shadow(
              color: Colors.black.withValues(alpha: 0.4),
              offset: Offset(2, 0),
              blurRadius: 8
          )
        ] :[],
        child: Container(
          alignment: Alignment.center,
          height: context.height < AppScreenSize.mediumScreen ? 45 : 50,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(double.parse(borderRadius.toString())),
            color: color,
            boxShadow: boxShadow
          ),

          child: Text(
            hintText,
            style: GoogleFonts.bricolageGrotesque(
              
              fontWeight:fontWeight,
              fontSize: fontSize,
              color: textColor ?? Colors.white,
              shadows: textShadow
            ),
          ),
        ),
      ),
    );
  }
}