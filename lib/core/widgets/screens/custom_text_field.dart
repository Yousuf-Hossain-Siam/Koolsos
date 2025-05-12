import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;
  final TextEditingController controller;
  final Function(String)? onChanged;

  // Constructor to accept parameters
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,  // TextEditingController passed from the parent
    this.width = 360.32, // default width
    this.height = 48.0,  // default height
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.textStyle = const TextStyle(
      color: Color(0xFF9B9E9E),
      fontSize: 14,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
      height: 1.50,
    ),  // default style
    this.onChanged,  // Callback for text changes
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Container(
        width: width,
        padding: padding,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: const Color(0xFFE9EAEA),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: TextField(
          controller: controller,  // Assign controller
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
          ),
          style: textStyle,  // Apply custom text style
          onChanged: onChanged,  // Pass the onChanged callback
        ),
      ),
    );
  }
}