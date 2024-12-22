import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:stackfood_multivendor/features/home_tap/controller/homescreen_controller.dart';
import 'package:stackfood_multivendor/features/home_tap/widgets/custom_appBar.dart';
import 'package:stackfood_multivendor/features/home_tap/widgets/exit_daialog.dart';
import 'package:stackfood_multivendor/util/images.dart';

class HomeTapScreen extends StatelessWidget {
  const HomeTapScreen({super.key});

  @override
  Widget build(BuildContext context) {
      Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          child: Image.asset(Images.myCart),
          onPressed: () {
            //controller.goToCart();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.all(10),
          elevation: 0.5,
          height: 64,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          color:Colors.white,
          child: Row(
            children: [
              ...List.generate(controller.pages.length + 1, (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : CustomButtonAppBar(
                        active: controller.currentPage == i ? true : false,
                        onPressed: () {
                          controller.chanPage(i);
                        },
                        icon: controller.words[i]['icon'],
                        text: controller.words[i]['title'],
                      );
              }),
            ],
          ),
        ),
        // ignore: deprecated_member_use
        body: WillPopScope(
          child: controller.pages.elementAt(controller.currentPage),
          onWillPop: () {
            return exitDialog();
          },
        ),
      ),
    );
  }
}