import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stackfood_multivendor/common/widgets/build_button_widget.dart';
import 'package:stackfood_multivendor/features/policy/screens/policy_screen.dart';
import 'package:stackfood_multivendor/util/images.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 314.h,
      width: 359.w,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Images.redStar),
          SizedBox(height: 12.h),
          Text(
            "5 points= \$ 1.00",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff1E1E1E),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "(from 10/points)",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff7D7D7D),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "amount can be convert into wallet money",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff7D7D7D),
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            height: 39.h,
            width: 230.w,
            alignment: Alignment.center,
            padding: EdgeInsets.only(
                top: 10.h, right: 109.w, bottom: 10.h, left: 109.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color:
                  //Color(0xffD9D9D936),
                  Color(0xff7C0631).withOpacity(0.1),
              border: Border.all(
                width: 1.w,
                color: Color(0xff7C0631),
              ),
            ),
            child: Text(
              "5",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff1E1E1E),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            alignment: Alignment.center,
            width: 131.w,
            child: BuildButtonWidget(
              txt: "convert",
              onTap: () {
                Get.to(()=>PolicyScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
