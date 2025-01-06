import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/classes/text_style.dart';

class CustomButtonInfo extends StatelessWidget {
  const CustomButtonInfo({
    super.key,
    required this.title,
    this.isChanged = false,
  });

  final String title;
  final bool isChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isChanged ? 22.h : 20.h,
      width: isChanged ? 70.w : 52.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: isChanged ? Color(0xff120D0D) : Color(0xff2B3D16),
      ),
      child: Text(
        title,
        style: isChanged
            ? AppTextStyle.textStyle(
                appFontSize: 10.sp,
                appFontWeight: FontWeight.w600,
                appFontHeight: 12.1.sp,
                color: Colors.white,
              )
            : AppTextStyle.textStyle(
                appFontSize: 8.sp,
                appFontWeight: FontWeight.w500,
                appFontHeight: 9.68.sp,
                color: Colors.white,
              ),
      ),
    );
  }
}
