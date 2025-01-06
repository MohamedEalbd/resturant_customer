import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stackfood_multivendor/common/classes/text_style.dart';
import 'package:stackfood_multivendor/features/auth/widgets/text_field_register.dart';
import 'package:stackfood_multivendor/features/myhome/controller/myhome_controller.dart';
import 'package:stackfood_multivendor/features/myhome/widgets/custom_text.dart';
import 'package:stackfood_multivendor/features/notification/screens/notification_screen.dart';
import 'package:stackfood_multivendor/features/restaurant/screens/details_restaurant_screen.dart';
import 'package:stackfood_multivendor/util/images.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyHomeControllerImp());
    return GetBuilder<MyHomeControllerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leadingWidth: 0,
          leading: SizedBox(),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(Images.myLocation, height: 16.h, width: 12.8.w),
              SizedBox(width: 8.w),
              Text(
                '6th of october, giza'.tr,
                style: AppTextStyle.textStyle(

                    appFontSize: 13.sp,
                    appFontWeight: FontWeight.w500,
                    color: Color(0xff1E1E1E)),
              ),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(() => NotificationScreen());
              },
              child: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Image.asset(Images.bell),
              ),
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 16.w),
          children: [
            Padding(
              padding: EdgeInsets.only(right: 14.6.w),
              child: TextFieldRegister(
                isObscureText: true,
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xffB1B1B1),
                  size: 20.sp,
                  weight: 20,
                ),
                controller: controller.search,
                hintText: "search your desired foods or restaurants".tr,
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.only(right: 14.6.w),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 136.h,
                    // MediaQuery.of(context).size.height * 0.20,
                    child: PageView.builder(
                        controller: controller.controller,
                        onPageChanged: (index) {
                          controller.changeIndex(index);
                        },
                        itemCount: controller.cards.length,
                        itemBuilder: (_, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(controller.cards[index].imageUrl,
                                height: 136.h),
                          );
                        }),
                  ),
                  Positioned(
                    bottom: -30.h,
                    child: SmoothPageIndicator(
                      controller: controller.controller, // PageController
                      count: controller.cards.length,
                      effect: WormEffect(
                        activeDotColor: Color(0xff7C0631),
                        dotColor: Color(0xff7C0631).withOpacity(0.2),
                      ), // your preferred effect
                      onDotClicked: (index) {
                        controller.controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 44.h),
            //! categories
            Padding(
              padding: EdgeInsets.only(right: 14.6.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "categories".tr),
                  Text(
                    "View All".tr,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1E1E1E),
                        fontFamily: "Inter"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 56.h,
              child: ListView.builder(
                  itemCount: controller.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(right: 4.w),
                      width: 80.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              controller.categories[index].imageUrl!),
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: 23.h,
                        color: Colors.black26.withOpacity(0.3),
                        child: Text(
                          "${controller.categories[index].title}",
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: "Inter",
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(height: 16.h),
            //! Trending Food Offers
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(text: "Trending Food Offers".tr),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              height: 166.h,
              child: ListView.separated(
                itemCount: controller.offers.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(controller.offers[index].imageUrl!),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(width: 8.w),
              ),
            ),
            SizedBox(height: 24.h),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(text: "Best Reviewed Food".tr),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.bestFoods.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 8),
                  itemBuilder: (_, index) {
                    return Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          height: 166.h,
                          width: 171.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(
                                  controller.bestFoods[index].imageUrl!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            height: 50.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.bestFoods[index].name!,
                                  style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow),
                                    Text(
                                      controller.bestFoods[index].rate
                                          .toString(),
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            height: 35.h,
                            width: 171.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Color(0xff2B3D16),
                            ),
                            padding: EdgeInsets.only(
                                top: 8.h,
                                right: 16.w,
                                left: 16.w,
                                bottom: 10.h),
                            child: Text(
                              "${controller.bestFoods[index].time} remaining",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontFamily: "Inter",
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.only(right: 14.6.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "cuisines".tr),
                  Text(
                    "View All".tr,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff7C0631),
                        fontFamily: "Inter"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.cuisines.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (_, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6.r),
                          child: Image.asset(
                            controller.cuisines[index].imageUrl!,
                            height: 56.h,
                            width: 77.5.w,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "${controller.cuisines[index].name}",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1E1E1E),
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            SizedBox(height: 24.h),

            //* navigate here to details to restaurant
            Padding(
              padding: EdgeInsets.only(right: 14.6.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "popular restaurants".tr),
                  Text(
                    "View All".tr,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff7C0631),
                        fontFamily: "Inter"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.popularFoodsNearby.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 8),
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => DetailsRestaurantScreen());
                      },
                      child: Stack(
                        //alignment: Alignment.topCenter,
                        children: [
                          Container(
                            height: 137.h,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              image: DecorationImage(
                                image: AssetImage(
                                  controller.bestRestaurants[index].imageUrl!,
                                ),
                              ),
                            ),
                            child: Container(
                              height: 65,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "${controller.popularFoodsNearby[index].type}",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "${controller.popularFoodsNearby[index].name}",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          ...List.generate(5, (index) {
                                            return Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 10.sp,
                                            );
                                          })
                                        ],
                                      ),
                                      Text(
                                        "${controller.popularFoodsNearby[index].rate}",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: 15.w,
                            top: 10.h,
                            child: Image.asset(Images.fav_border),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.only(right: 14.0.w),
              child: Container(
                height: 64.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Color(0xffFFFFFF),
                  boxShadow: [],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      Images.imageCard,
                      height: 32.h,
                      width: 32.w,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "find nearby",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff1E1E1E)),
                        ),
                        Text(
                          "restaurant near you",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1E1E1E),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      height: 24.h,
                      width: 83.w,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                          top: 6.h, right: 10.w, bottom: 6.h, left: 10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xff2B3D16),
                      ),
                      child: Text(
                        "see location",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),
            //* navigate to the details foods */
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "popular foods nearby".tr),
                  Text(
                    "View All".tr,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000),
                        fontFamily: "Inter"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              height: 110.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.popularFoodsNearby.length,
                itemBuilder: (_, index) {
                  return Container(
                    width: 265,
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(
                            controller.popularFoodsNearby[index].imageUrl!,
                            height: 72.h,
                            width: 72.w,
                          ),
                        ),
                        SizedBox(width: 7.w),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              controller.popularFoodsNearby[index].name!,
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff1E1E1E),
                              ),
                            ),
                            //SizedBox(height: 8),
                            Text(
                              controller.popularFoodsNearby[index].type!,
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff1E1E1E),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ...List.generate(5, (index) {
                                      return Icon(
                                        Icons.star,
                                        size: 12,
                                        color: Colors.yellow,
                                      );
                                    }),
                                  ],
                                ),
                                SizedBox(width: 5),
                                Text(
                                  controller.popularFoodsNearby[index].rate
                                      .toString(),
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff1E1E1E),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 7.5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${controller.popularFoodsNearby[index].salary} SAR"
                                      .toString(),
                                  style: AppTextStyle.textStyle(
                                    appFontSize: 12.sp,
                                    appFontWeight: FontWeight.w600,
                                    color: Color(0xff1E1E1E),
                                  ),
                                ),
                                SizedBox(width: 80.w),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 5.h),
                                  height: 24.h,
                                  width: 24.w,
                                  decoration: BoxDecoration(
                                    color: Color(0xff7C0631),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Image.asset(
                                    Images.iconAdd,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(width: 16),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
