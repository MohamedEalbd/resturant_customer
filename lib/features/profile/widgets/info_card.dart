import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        height: 40.h,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(right: 8.w, left: 8.w),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.w, color: Colors.grey.withOpacity(0.3)),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xff000000),
          ),
        ),
      ),
    );
  }
}
