import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stackfood_multivendor/features/profile/widgets/custom_title.dart';
import 'package:stackfood_multivendor/features/profile/widgets/info_card.dart';
import 'package:stackfood_multivendor/util/images.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 144.h,
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff7C0631),
            ),
            child: Row(
              children: [
                SizedBox(width: 16.w),
                Image.asset(Images.my_profile),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    Text(
                      "19 aug 2024 23:21",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          CustomTitle(title: "Earnings"),
          SizedBox(height: 16.h),
          InfoCard(title: 'Refer & Earn'),
          InfoCard(title: 'Open A Resturant'),
          SizedBox(height: 24.h),
          CustomTitle(title: "Help & Support"),
          SizedBox(height: 16.h),
          InfoCard(title: 'Live Chat'),
          InfoCard(title: 'Help & Support'),
          InfoCard(title: 'About Us'),
          InfoCard(title: 'Terms & Conditions'),
          InfoCard(title: 'Privacy Policy'),
          InfoCard(title: 'Returned Policy'),
          InfoCard(title: 'Cancelation Policy'),
        ],
      ),
    );
  }
}
