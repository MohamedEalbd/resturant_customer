import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stackfood_multivendor/features/favourite/models/food_model.dart';
import 'package:stackfood_multivendor/util/images.dart';

class ListOfNotFav extends StatelessWidget {
  const ListOfNotFav({super.key, required this.foods});
  final List<FoodModel> foods;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: foods.length,
          itemBuilder: (_, index) {
            return Container(
              alignment: Alignment.center,
              //height: 100.h,
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8.w, bottom: 8.h, top: 8.h),
                      height: 86.h,
                      width: 72.w,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        image: DecorationImage(
                          image: AssetImage(foods[index].imageUrl),
                        ),
                      ),
                      child: Container(
                        height: 21.h,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Text(
                          "${foods[index].remaining}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${foods[index].name}",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff1E1E1E),
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "${foods[index].type}",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff1E1E1E),
                                ),
                              ),
                              TextSpan(
                                text: "  (${foods[index].km}km)",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black26.withOpacity(0.3),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ...List.generate(5, (index) {
                                  return Icon(
                                    Icons.star,
                                    size: 10,
                                    color: Color(0xffFCE340),
                                  );
                                })
                              ],
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              "${foods[index].rate}",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff1E1E1E)),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.5.h),
                        Text(
                          "${foods[index].price} SAR",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Inter",
                            color: Color(0xff1E1E1E),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            weight: 17.5.w,
                            size: 17.5,
                            color: Color(0xff7C0631),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border,
                            weight: 24.5.w,
                            size: 24.5,
                            color: Color(0xff7C0631),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
