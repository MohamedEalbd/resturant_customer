import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stackfood_multivendor/common/widgets/build_button_widget.dart';
import 'package:stackfood_multivendor/features/order/domain/models/my_mode.dart';
import 'package:stackfood_multivendor/util/images.dart';

class MyOrderDetails extends StatelessWidget {
  const MyOrderDetails({
    super.key,
    required this.myOrder,
    this.isOrderRunning = false,
  });
  final MyOrder myOrder;
  final bool isOrderRunning;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(Images.arrowLeft1)),
        title: Text(
          "order_details".tr,
          style: TextStyle(
            fontSize: 14.sp,
            color: Color(0xff1E1E1E),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 22.h),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "General Info",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff1E1E1E),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${myOrder.name}",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff1E1E1E),
                  ),
                ),
                Text(
                  "${myOrder.date}",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1E1E1E),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Divider(color: Color(0xffD9D9D9)),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "item: 1",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff1E1E1E),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 8.h,
                      width: 8.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: Color(0xff2CBE4E),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "${myOrder.status}",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff1E1E1E),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Divider(color: Color(0xffD9D9D9)),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "cutlery".tr,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff1E1E1E),
                  ),
                ),
                Text(
                  "no".tr,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff1E1E1E),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              //height: 181.h,
              width: 390.w,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Item Info",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Inter",
                      color: Color(0xff000000),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset(
                          Images.mypizza_order,
                          height: 47.h,
                          width: 72.w,
                        ),
                      ),
                      SizedBox(width: 7.w),
                      Column(
                        children: [
                          Text(
                            "meat pizza",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                          Text(
                            "250.00 SAR",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                          SizedBox(height: 14.h),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text(
                            "quantity: 1",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            height: 16.h,
                            width: 46.w,
                            padding: EdgeInsets.only(
                                top: 3.h, right: 6.w, left: 6.w, bottom: 3.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              color: Color(0xff7C0631).withOpacity(0.15),
                            ),
                            child: Text(
                              "non-veg",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff7C0631),
                              ),
                            ),
                          ),
                          SizedBox(height: 14.h),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 75.w),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Addons: ",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                          TextSpan(
                            text: "pepci (1)",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 75.w),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "variations: ",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                          TextSpan(
                            text: "size (small)",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Divider(color: Colors.grey.withOpacity(0.5), thickness: 1.w),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address".tr,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1E1E1E),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        Images.house,
                        height: 32.h,
                        width: 32.h,
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        children: [
                          Text(
                            "restaurants name".tr,
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            "6th of october, giza".tr,
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff7D7D7D),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Image.asset(Images.my_location),
                    ],
                  ),
                ],
              ),
            ),
            if (isOrderRunning == true) SizedBox(height: 24.h),
            if (isOrderRunning == true)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Restaurant Details",
                  style: TextStyle(
                    fontFamily: "Inter",
                    color: Color(0xff000000),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        //height: 56.h,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5.0,
              spreadRadius: 4.0,
              offset: Offset(0.0, 10.0),
            ),
          ]),
          child: (isOrderRunning == true)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 40.h,
                      width: 171.w,
                      child: BuildButtonWidget(txt: "Review"),
                    ),
                    SizedBox(
                      height: 40.h,
                      width: 171.w,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 10.5),
                          decoration: BoxDecoration(
                              color: Color(0xff2B3D16),
                              borderRadius: BorderRadius.circular(6)),
                          child: Text(
                            "Re-Order",
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 40.h,
                      width: 171.w,
                      child: BuildButtonWidget(txt: "Done"),
                    ),
                    SizedBox(
                      height: 40.h,
                      width: 171.w,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 10.5),
                          decoration: BoxDecoration(
                              color: Color(0xff2B3D16),
                              borderRadius: BorderRadius.circular(6)),
                          child: Row(
                           // spacing: ,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                Images.my_location,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5.w,),
                              Text(
                                "Location",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
