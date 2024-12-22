import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stackfood_multivendor/common/widgets/build_button_widget.dart';
import 'package:stackfood_multivendor/features/address/screens/select_address_screen.dart';
import 'package:stackfood_multivendor/util/images.dart';

import '../../splash/controllers/splash_controller.dart';

class NewAddressScreen extends StatelessWidget {
  const NewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 80,),
            Image.asset(Images.currentLoc),
            SizedBox(height: 20,),
            Text("find restaurants and food neaar \n you",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
            SizedBox(height: 200,),
            BuildButtonWidget(txt: "use current location",onTap: ()
            {
              Get.find<SplashController>().checkPermission();

              },),
          ],
        ),
      ),
    );
  }
}
