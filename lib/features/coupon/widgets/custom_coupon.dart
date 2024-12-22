import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stackfood_multivendor/util/images.dart';

class CustomCoupon extends StatelessWidget {
  const CustomCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      //alignment: Alignment.center,
      children: [
        Container(
          //height: 110.h,
          //alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 17.h, top: 14.h, left: 5.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Images.fire),
                    SizedBox(height: 9.h),
                    Text(
                      "20% off",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1E1E1E),
                      ),
                    ),
                    SizedBox(height: 9.h),
                    Text(
                      "on all restaurant",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1E1E1E),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 13.5.w),
              Image.asset(
                Images.line,
                width: 3.w,
                color: Color(0xffD9D9D9),
              ),
              SizedBox(width: 8.5.w),
              Container(
                margin: EdgeInsets.symmetric(vertical: 23.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "festival",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1E1E1E),
                      ),
                    ),
                    SizedBox(height: 9.h),
                    Text(
                      "836 Grand Avenue, Port Melvin 96682-7116",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1E1E1E),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -8.h,
          left: 80.w,
          child: Container(
            height: 28.h,
            width: 28.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: Color(0xffFFFFFF),
            ),
          ),
        ),
        Positioned(
          bottom: -8.h,
          left: 80.w,
          child: Container(
            height: 28.h,
            width: 28.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: Color(0xffFFFFFF),
            ),
          ),
        ),
      ],
    );
  }
}
