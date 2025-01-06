import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stackfood_multivendor/features/order/controllers/order_controller.dart';
import 'package:stackfood_multivendor/features/order/widgets/guest_track_order_input_view_widget.dart';
import 'package:stackfood_multivendor/features/order/widgets/my_order_pending.dart';
import 'package:stackfood_multivendor/features/order/widgets/myorder_running.dart';
import 'package:stackfood_multivendor/features/order/widgets/order_view_widget.dart';
import 'package:stackfood_multivendor/helper/auth_helper.dart';
import 'package:stackfood_multivendor/helper/responsive_helper.dart';
import 'package:stackfood_multivendor/util/dimensions.dart';
import 'package:stackfood_multivendor/util/styles.dart';
import 'package:stackfood_multivendor/common/widgets/custom_app_bar_widget.dart';
import 'package:stackfood_multivendor/common/widgets/menu_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  OrderScreenState createState() => OrderScreenState();
}

class OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    initCall();
  }

  void initCall() {
    if (AuthHelper.isLoggedIn()) {
      Get.find<OrderController>().getRunningOrders(1, limit: 10, notify: false);
      Get.find<OrderController>()
          .getRunningSubscriptionOrders(1, notify: false);
      Get.find<OrderController>().getHistoryOrders(1, notify: false);
      // Get.find<OrderController>().getSubscriptions(1, notify: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = AuthHelper.isLoggedIn();
    Get.put(MyOrderController());
    return GetBuilder<MyOrderController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
          leadingWidth: 0,
          centerTitle: true,
          title: Text(
            "my_orders".tr,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Inter",
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff1E1E1E)),
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
            if (controller.currentIndex == 0)
              MyOrderRunning(myOrders: controller.myOrdersRunning),
            if (controller.currentIndex == 1)
              MyOrderPending(myOrders: controller.myOrdersPending),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: CustomAppBarWidget(title: 'my_orders'.tr, isBackButtonExist: ResponsiveHelper.isDesktop(context)),
    //   endDrawer: const MenuDrawerWidget(), endDrawerEnableOpenDragGesture: false,
    //   body: isLoggedIn ? GetBuilder<OrderController>(
    //     builder: (orderController) {
    //       return Column(children: [

    //         Container(
    //           color: ResponsiveHelper.isDesktop(context) ? Theme.of(context).primaryColor.withOpacity(0.1) : Colors.transparent,
    //           child: Column(children: [

    //             ResponsiveHelper.isDesktop(context) ? Center(child: Padding(
    //               padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
    //               child: Text('my_orders'.tr, style: robotoMedium),
    //             )) : const SizedBox(),

    //             Center(
    //               child: SizedBox(
    //                 width: Dimensions.webMaxWidth,
    //                 child: Align(
    //                   alignment: ResponsiveHelper.isDesktop(context) ? Alignment.centerLeft : Alignment.center,
    //                   child: Container(
    //                     width: ResponsiveHelper.isDesktop(context) ? 350 : Dimensions.webMaxWidth,
    //                     color: ResponsiveHelper.isDesktop(context) ? Colors.transparent : Theme.of(context).cardColor,
    //                     child: TabBar(
    //                       controller: _tabController,
    //                       indicatorColor: Theme.of(context).primaryColor,
    //                       indicatorWeight: 3,
    //                       labelColor: Theme.of(context).primaryColor,
    //                       unselectedLabelColor: Theme.of(context).disabledColor,
    //                       unselectedLabelStyle: robotoRegular.copyWith(color: Theme.of(context).disabledColor, fontSize: Dimensions.fontSizeSmall),
    //                       labelStyle: robotoBold.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).primaryColor),
    //                       tabs: [
    //                         Tab(text: 'running'.tr),
    //                         Tab(text: 'subscription'.tr),
    //                         Tab(text: 'history'.tr),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //           ),
    //         ),

    //         Expanded(child: TabBarView(
    //           controller: _tabController,
    //           children: const [
    //             OrderViewWidget(isRunning: true),
    //             OrderViewWidget(isRunning: false, isSubscription: true),
    //             OrderViewWidget(isRunning: false),
    //           ],
    //         )),

    //       ]);
    //     },
    //   ) : const GuestTrackOrderInputViewWidget(),
    // );
  }
}
