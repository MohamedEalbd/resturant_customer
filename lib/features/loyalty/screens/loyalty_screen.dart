import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stackfood_multivendor/common/widgets/build_button_widget.dart';
import 'package:stackfood_multivendor/features/auth/controllers/auth_controller.dart';
import 'package:stackfood_multivendor/features/loyalty/controllers/loyalty_controller.dart';
import 'package:stackfood_multivendor/features/loyalty/widgets/loyalty_bottom_sheet_widget.dart';
import 'package:stackfood_multivendor/features/loyalty/widgets/loyalty_card_widget.dart';
import 'package:stackfood_multivendor/features/loyalty/widgets/loyalty_history_widget.dart';
import 'package:stackfood_multivendor/features/loyalty/widgets/my_dialog.dart';
import 'package:stackfood_multivendor/features/profile/controllers/profile_controller.dart';
import 'package:stackfood_multivendor/features/wallet/widgets/my_card.dart';
import 'package:stackfood_multivendor/helper/responsive_helper.dart';
import 'package:stackfood_multivendor/util/dimensions.dart';
import 'package:stackfood_multivendor/util/images.dart';
import 'package:stackfood_multivendor/util/styles.dart';
import 'package:stackfood_multivendor/common/widgets/custom_app_bar_widget.dart';
import 'package:stackfood_multivendor/common/widgets/footer_view_widget.dart';
import 'package:stackfood_multivendor/common/widgets/menu_drawer_widget.dart';
import 'package:stackfood_multivendor/common/widgets/not_logged_in_screen.dart';
import 'package:stackfood_multivendor/common/widgets/web_page_title_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class LoyaltyScreen extends StatefulWidget {
  const LoyaltyScreen({super.key});

  @override
  State<LoyaltyScreen> createState() => _LoyaltyScreenState();
}

class _LoyaltyScreenState extends State<LoyaltyScreen> {
  final ScrollController scrollController = ScrollController();
  final tooltipController = JustTheController();

  @override
  void initState() {
    super.initState();

    _initCall();
  }

  void _initCall() {
    if (Get.find<AuthController>().isLoggedIn()) {
      Get.find<ProfileController>().getUserInfo();

      Get.find<LoyaltyController>().getLoyaltyTransactionList('1', false);

      Get.find<LoyaltyController>().setOffset(1);

      scrollController.addListener(() {
        if (scrollController.position.pixels ==
                scrollController.position.maxScrollExtent &&
            Get.find<LoyaltyController>().transactionList != null &&
            !Get.find<LoyaltyController>().isLoading) {
          int pageSize =
              (Get.find<LoyaltyController>().popularPageSize! / 10).ceil();
          if (Get.find<LoyaltyController>().offset < pageSize) {
            Get.find<LoyaltyController>()
                .setOffset(Get.find<LoyaltyController>().offset + 1);
            if (kDebugMode) {
              print('end of the page');
            }
            Get.find<LoyaltyController>().showBottomLoader();
            Get.find<LoyaltyController>().getLoyaltyTransactionList(
                Get.find<LoyaltyController>().offset.toString(), false);
          }
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();

    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = Get.find<AuthController>().isLoggedIn();
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Color(0xffFFFFFF),
        height: 56.h,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 100.w),
          width: 162.w,
          height: 40.h,
          child: BuildButtonWidget(
            txt: "Convert",
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return Dialog(
                      child: Stack(
                        children: [
                          MyDialog(),
                          Positioned(
                            top: 7.h,
                            right: 7.w,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.close,
                                weight: 20.w,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(Images.arrowLeft1),
        ),
        title: Text(
          "loyalty point".tr,
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xff1E1E1E),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                top: 24.h,
                right: 16.w,
                bottom: 24.h,
                left: 16.w,
              ),
              height: 104.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.grey.withOpacity(0.2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.coins,
                    height: 56.h,
                    width: 56.w,
                  ),
                  SizedBox(width: 16.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "loyalty point",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1E1E1E),
                        ),
                      ),
                      Text(
                        "16",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1E1E1E),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 28.h),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Transaction History",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (_, index) {
                    return MyCard();
                  }),
            )
          ],
        ),
      ),
    );
    // return Scaffold(
    //   backgroundColor: Theme.of(context).cardColor,
    //   appBar: CustomAppBarWidget(title: 'loyalty_points'.tr, isBackButtonExist: true),
    //   endDrawer: const MenuDrawerWidget(), endDrawerEnableOpenDragGesture: false,
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    //   floatingActionButton: isLoggedIn && !ResponsiveHelper.isDesktop(context) ? FloatingActionButton.extended(
    //     extendedPadding: const EdgeInsets.symmetric(horizontal: 50),
    //     backgroundColor: Theme.of(context).primaryColor,
    //     label: Text( 'convert_to_wallet_money'.tr, style: robotoBold.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeLarge)),
    //     onPressed: (){
    //       Get.dialog(
    //         Dialog(backgroundColor: Colors.transparent, child: LoyaltyBottomSheetWidget(
    //           amount: Get.find<ProfileController>().userInfoModel!.loyaltyPoint == null ? '0' : Get.find<ProfileController>().userInfoModel!.loyaltyPoint.toString(),
    //         )),
    //       );
    //     },
    //   ) : null,
    //   body: GetBuilder<ProfileController>(builder: (profileController) {
    //     return isLoggedIn ? profileController.userInfoModel != null ? SafeArea(
    //       child: RefreshIndicator(
    //         onRefresh: () async{
    //           Get.find<LoyaltyController>().getLoyaltyTransactionList('1', true);
    //           profileController.getUserInfo();
    //         },
    //         child: SingleChildScrollView(
    //           controller: scrollController,
    //           child: Column(
    //             children: [
    //               WebScreenTitleWidget(title: 'loyalty_points'.tr),

    //               FooterViewWidget(
    //                 child: SizedBox(width: Dimensions.webMaxWidth,
    //                   child: ResponsiveHelper.isDesktop(context) ? Padding(
    //                     padding: const EdgeInsets.only(top: Dimensions.paddingSizeDefault),
    //                     child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [

    //                       Expanded(flex: 4, child: Container(
    //                         decoration: ResponsiveHelper.isDesktop(context) ? BoxDecoration(
    //                           color: Theme.of(context).cardColor,
    //                           borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
    //                           boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 10, offset: const Offset(0, 1))],
    //                         ) : null,
    //                         padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
    //                         child: LoyaltyCardWidget(tooltipController: tooltipController),
    //                       )),
    //                       const SizedBox(width: Dimensions.paddingSizeDefault),

    //                       Expanded(flex: 6, child: Container(
    //                         decoration: ResponsiveHelper.isDesktop(context) ? BoxDecoration(
    //                           color: Theme.of(context).cardColor,
    //                           borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
    //                           boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 10, offset: const Offset(0, 1))],
    //                         ) : null,
    //                         padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
    //                         child: const LoyaltyHistoryWidget(),
    //                       )),

    //                     ]),
    //                   ) : Column(children: [

    //                     Padding(
    //                       padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
    //                       child: LoyaltyCardWidget(tooltipController: tooltipController),
    //                     ),

    //                     const Padding(
    //                       padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
    //                       child: LoyaltyHistoryWidget(),
    //                     ),

    //                   ]),
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //     ) : const Center(child: CircularProgressIndicator()) : NotLoggedInScreen(callBack: (value){
    //       _initCall();
    //       setState(() {});
    //     });
    //   }),
    // );
  }
}
