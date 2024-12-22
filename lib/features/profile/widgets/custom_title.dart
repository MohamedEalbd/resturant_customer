import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: TextStyle(
          fontFamily: "Inter",
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xff7C0631),
        ),
      ),
    );
  }
}
