import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stackfood_multivendor/util/images.dart';

class SearchFav extends StatelessWidget {
  const SearchFav({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(1, 1),
          )
        ],
      ),
      height: 40.h,
      width: 301.w,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            suffixIcon: SvgPicture.asset(
              Images.iconTextField,
              height: 20.h,
              width: 20.w,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            filled: true,
            fillColor: Colors.white),
      ),
    );
  }
}
