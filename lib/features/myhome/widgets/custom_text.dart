import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xff1E1E1E),
          fontFamily: "Inter"),
    );
  }
}
