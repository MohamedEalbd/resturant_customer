import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stackfood_multivendor/common/widgets/build_button_widget.dart';
import 'package:stackfood_multivendor/util/images.dart';

class FindYourLocation extends StatelessWidget {
  const FindYourLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 50),
          child: Column(
            children: [
              Image.asset(Images.findLocation),
              SizedBox(height: 49),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'find restaurants and food neaar you'.tr,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff1E1E1E),
                      fontFamily: "Inter"),
                ),
              ),
              SizedBox(height: 100),
              BuildButtonWidget(
                txt: 'use current location'.tr,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
