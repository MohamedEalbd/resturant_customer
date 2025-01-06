import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/classes/text_style.dart';
import 'custom_button_info.dart';

class CustomMyDetails extends StatelessWidget {
  const CustomMyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 358.w,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 18.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: Colors.black.withOpacity(0.16),
          width: 1.0.w,
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.circle_outlined),
          SizedBox(width: 5.w),
          Column(
            spacing: 4.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "pasta - 123 Salah Salem Street, Nasr City ",
                      style: AppTextStyle.textStyle(
                        appFontSize: 10.sp,
                        appFontWeight: FontWeight.w700,
                        appFontHeight: 12.1.sp,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: " (6.02 km)",
                      style: AppTextStyle.textStyle(
                        appFontSize: 8.sp,
                        appFontWeight: FontWeight.w400,
                        appFontHeight: 9.68.sp,
                        color: Color(0xFF7D7D7D),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "today, 12:00pm - 4:00am",
                style: AppTextStyle.textStyle(
                  appFontSize: 8.sp,
                  appFontWeight: FontWeight.w200,
                  appFontHeight: 9.68.sp,
                  color: Color(0xFF7D7D7D),
                ),
              ),
            ],
          ),
          Spacer(),
          CustomButtonInfo(title: '5 remaining',),
          SizedBox(width: 5.w),
        ],
      ),
    );
  }
}
