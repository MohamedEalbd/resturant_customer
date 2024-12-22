import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stackfood_multivendor/util/images.dart';

class CustomAddress extends StatelessWidget {
  const CustomAddress({
    super.key,
    required this.image,
    required this.title,
    required this.address,
  });
  final String image;
  final String title;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
      //width: 358.w,
      //alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: Color(0xffFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 8.0,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
               image,
                height: 15.63.h,
                width: 16.63.w,
              ),
              SizedBox(width: 8.w),
              Text(
                title,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff1E1E1E),
                ),
              ),
              Spacer(),
              Image.asset(Images.delete)
            ],
          ),
          Text(
            address,
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 10.sp,
              fontWeight: FontWeight.w300,
              color: Color(0xff7D7D7D),
            ),
          ),
        ],
      ),
    );
  }
}
