import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.image,
    required this.title,
    this.widget,
    this.icon,
  });
  final String? image;
  final String title;
  final Widget? widget;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        //height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black38.withOpacity(0.2),
              blurRadius: 8.0,
              offset: Offset(0, 5),
              spreadRadius: 4,
            ),
          ],
        ),
        child: ListTile(
          leading: image == null ? Icon(icon) : Image.asset(image!),
          title: Text(
            title,
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
            ),
          ),
          trailing: widget,
        ),
      ),
    );
  }
}
