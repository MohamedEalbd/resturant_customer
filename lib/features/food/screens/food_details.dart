import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/classes/text_style.dart';
import '../../../util/images.dart';
import '../widgets/custom_button_info.dart';
import '../widgets/custom_my_details.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 206.h,
                width: double.infinity,
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      Images.foodDetails,
                    ),
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "pasta ",
                        style: AppTextStyle.textStyle(
                          appFontSize: 16.sp,
                          appFontWeight: FontWeight.w700,
                          appFontHeight: 19.36.sp,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "5 remaining",
                        style: AppTextStyle.textStyle(
                          appFontSize: 12.sp,
                          appFontWeight: FontWeight.w500,
                          appFontHeight: 14.52.sp,
                          color: Color(0xFF7C0631),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "Pasta with pink sauce is a creamy, tomato-based dish that blends marinara and heavy cream, resulting in a rich, velvety sauce with a light pink color, perfect for coating your favorite pasta.",
                  style: AppTextStyle.textStyle(
                    appFontSize: 10.sp,
                    appFontWeight: FontWeight.w400,
                    appFontHeight: 12.1.sp,
                    color: Colors.black.withOpacity(0.71),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "Branch name (test) \nToday - 1:00 P.M - 9: P.M",
                  style: AppTextStyle.textStyle(
                    appFontSize: 10.sp,
                    appFontWeight: FontWeight.w400,
                    appFontHeight: 12.1.sp,
                    color: Colors.black.withOpacity(0.71),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "\$ 224",
                      style: AppTextStyle.textStyle(
                        appFontSize: 16.sp,
                        appFontWeight: FontWeight.w600,
                        appFontHeight: 19.36.sp,
                        color: Colors.black.withOpacity(0.50),
                      ),
                    ),
                    Text(
                      "Now \$ 112",
                      style: AppTextStyle.textStyle(
                        appFontSize: 16.sp,
                        appFontWeight: FontWeight.w600,
                        appFontHeight: 19.36.sp,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      height: 33.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 16.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 0.0),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 17.w,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove,
                              color: Color(0xFF7C0631),
                            ),
                          ),
                          Text(
                            "1",
                            style: AppTextStyle.textStyle(
                              appFontSize: 16.sp,
                              appFontWeight: FontWeight.w600,
                              appFontHeight: 19.36.sp,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: Color(0xFF7C0631),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Other branches",
                      style: AppTextStyle.textStyle(
                        appFontSize: 10.sp,
                        appFontWeight: FontWeight.w400,
                        appFontHeight: 12.1.sp,
                        color: Colors.black.withOpacity(0.71),
                      ),
                    ),
                    CustomButtonInfo(title: 'Change',isChanged: true),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              CustomMyDetails(),
              SizedBox(height: 16.h),
              CustomMyDetails(),
              SizedBox(height: 16.h),
              CustomMyDetails(),
              SizedBox(height: 16.h),
              CustomMyDetails(),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
