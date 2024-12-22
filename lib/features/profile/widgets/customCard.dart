import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });
  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 108.67.w,
      padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4.0,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(image),
          SizedBox(height: 8.h),
          Text(
            title,
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff2B3D16),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            subTitle,
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
