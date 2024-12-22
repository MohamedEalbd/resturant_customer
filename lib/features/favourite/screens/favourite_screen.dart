import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stackfood_multivendor/common/widgets/web_screen_title_widget.dart';
import 'package:stackfood_multivendor/features/auth/controllers/auth_controller.dart';
import 'package:stackfood_multivendor/features/favourite/controllers/favourite_controller.dart';
import 'package:stackfood_multivendor/features/favourite/widgets/fav_item_view_widget.dart';
import 'package:stackfood_multivendor/features/favourite/widgets/list_of_fav.dart';
import 'package:stackfood_multivendor/features/favourite/widgets/list_of_not_fav.dart';
import 'package:stackfood_multivendor/features/favourite/widgets/search_fav.dart';
import 'package:stackfood_multivendor/util/dimensions.dart';
import 'package:stackfood_multivendor/util/images.dart';
import 'package:stackfood_multivendor/util/styles.dart';
import 'package:stackfood_multivendor/common/widgets/custom_app_bar_widget.dart';
import 'package:stackfood_multivendor/common/widgets/menu_drawer_widget.dart';
import 'package:stackfood_multivendor/common/widgets/not_logged_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  FavouriteScreenState createState() => FavouriteScreenState();
}

class FavouriteScreenState extends State<FavouriteScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    _initCall();
  }

  void _initCall() {
    if (Get.find<AuthController>().isLoggedIn()) {
      Get.find<FavouriteController>().getFavouriteList(fromFavScreen: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritesControllerImp());
    return GetBuilder<FavoritesControllerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
          leadingWidth: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SearchFav(),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Cancel".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff7C0631),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                ...List.generate(controller.words.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      controller.changeIndex(index);
                    },
                    child: Container(
                      //height: 40.h,
                      width: 195.w,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        vertical: 14.h,
                        //horizontal: 85.w,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: controller.currentIndex == index
                                ? Color(0xff7C0631)
                                : Colors.transparent,
                            width: 1.w,
                          ),
                        ),
                      ),
                      child: Text(
                        controller.words[index],
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                          color: controller.currentIndex == index
                              ? Color(0xff7C0631)
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                })
              ],
            ),
            SizedBox(height: 24.h),
            if (controller.currentIndex == 0) ListOfNotFav(foods: controller.foods),
            if (controller.currentIndex == 1) ListOfFav(foods: controller.foodsFav),
          ],
        ),
        // appBar: CustomAppBarWidget(title: 'favourite'.tr, isBackButtonExist: false),
        // endDrawer: const MenuDrawerWidget(), endDrawerEnableOpenDragGesture: false,
        // body: Get.find<AuthController>().isLoggedIn() ? SafeArea(child: Column(children: [

        //   WebScreenTitleWidget(title: 'favourite'.tr),

        //   Container(
        //     width: Dimensions.webMaxWidth,
        //     color: Theme.of(context).cardColor,
        //     child: TabBar(
        //       controller: _tabController,
        //       indicatorColor: Theme.of(context).primaryColor,
        //       indicatorWeight: 3,
        //       labelColor: Theme.of(context).primaryColor,
        //       unselectedLabelColor: Theme.of(context).disabledColor,
        //       unselectedLabelStyle: robotoRegular.copyWith(color: Theme.of(context).disabledColor, fontSize: Dimensions.fontSizeSmall),
        //       labelStyle: robotoBold.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).primaryColor),
        //       tabs: [
        //         Tab(text: 'food'.tr),
        //         Tab(text: 'restaurants'.tr),
        //       ],
        //     ),
        //   ),

        //   Expanded(child: TabBarView(
        //     controller: _tabController,
        //     children: const [
        //       FavItemViewWidget(isRestaurant: false),
        //       FavItemViewWidget(isRestaurant: true),
        //     ],
        //   )),

        // ])) : NotLoggedInScreen(callBack: (value){
        //   _initCall();
        //   setState(() {});
        // }),
      ),
    );
  }
}
