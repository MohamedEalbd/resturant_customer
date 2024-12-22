import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stackfood_multivendor/util/images.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      decoration: BoxDecoration(
        //color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1.w,
            color: Color(0xffD9D9D9),
          ),
        ),
      ),
      child: Row(
        children: [
          Image.asset(Images.redStar),
          SizedBox(width: 21.w),
          Column(
            children: [
              Text(
                "+ \$ 8.00",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff1E1E1E),
                ),
              ),
              SizedBox(height: 7.h),
              Text(
                "loyalty point",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff7D7D7D),
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Text(
                "2023-7-23",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff7D7D7D),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "credit",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff1DB91D),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
