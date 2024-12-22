import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stackfood_multivendor/features/order/domain/models/my_mode.dart';
import 'package:stackfood_multivendor/features/order/screens/my_order_details.dart';

class MyOrderPending extends StatelessWidget {
  const MyOrderPending({super.key, required this.myOrders});
  final List<MyOrder> myOrders;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 16.h, right: 16.w, left: 16.w),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => MyOrderDetails(
                      myOrder: myOrders[index],
                      isOrderRunning: true,
                    ));
              },
              child: Container(
                height: 72.h,
                width: 357.w,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26.withOpacity(0.3),
                      blurRadius: 10.0,
                      offset: Offset(0, 3.0),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 56.h,
                      width: 72.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: Image.asset(myOrders[index].image),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${myOrders[index].name}",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Color(0xff1E1E1E),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "${myOrders[index].date}",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Color(0xff1E1E1E),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      height: 18.sp,
                      width: 55.w,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        top: 3.h,
                        right: 7.w,
                        left: 7.w,
                        bottom: 3.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: Color(0xff2CBE4E).withOpacity(0.3),
                      ),
                      child: Text(
                        "${myOrders[index].status}".tr,
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                          color: Color(0xff2CBE4E),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (_, index) => SizedBox(height: 16.h),
          itemCount: myOrders.length,
        ),
      ),
    );
  }
}
