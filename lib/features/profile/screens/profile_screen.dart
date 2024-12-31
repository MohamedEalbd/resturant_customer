import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stackfood_multivendor/common/widgets/custom_app_bar_widget.dart';
import 'package:stackfood_multivendor/common/widgets/custom_button_widget.dart';
import 'package:stackfood_multivendor/features/address/screens/address_screen.dart';
import 'package:stackfood_multivendor/features/auth/controllers/auth_controller.dart';
import 'package:stackfood_multivendor/features/order/controllers/order_controller.dart';
import 'package:stackfood_multivendor/features/profile/controllers/profile_controller.dart';
import 'package:stackfood_multivendor/features/profile/widgets/account_deletion_bottom_sheet.dart';
import 'package:stackfood_multivendor/features/profile/widgets/customCard.dart';
import 'package:stackfood_multivendor/features/profile/widgets/custom_list_tile.dart';
import 'package:stackfood_multivendor/features/profile/widgets/notification_status_change_bottom_sheet.dart';
import 'package:stackfood_multivendor/features/profile/widgets/profile_button_widget.dart';
import 'package:stackfood_multivendor/features/profile/widgets/profile_card_widget.dart';
import 'package:stackfood_multivendor/features/profile/widgets/web_profile_widget.dart';
import 'package:stackfood_multivendor/features/splash/controllers/splash_controller.dart';
import 'package:stackfood_multivendor/features/auth/widgets/auth_dialog_widget.dart';
import 'package:stackfood_multivendor/helper/date_converter.dart';
import 'package:stackfood_multivendor/helper/price_converter.dart';
import 'package:stackfood_multivendor/helper/responsive_helper.dart';
import 'package:stackfood_multivendor/helper/route_helper.dart';
import 'package:stackfood_multivendor/util/app_constants.dart';
import 'package:stackfood_multivendor/util/dimensions.dart';
import 'package:stackfood_multivendor/util/images.dart';
import 'package:stackfood_multivendor/util/styles.dart';
import 'package:stackfood_multivendor/common/widgets/custom_image_widget.dart';
import 'package:stackfood_multivendor/common/widgets/footer_view_widget.dart';
import 'package:stackfood_multivendor/common/widgets/menu_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _initCall();
  }

  void _initCall() {
    if (Get.find<AuthController>().isLoggedIn() &&
        Get.find<ProfileController>().userInfoModel == null) {
      Get.find<ProfileController>().getUserInfo();
    }
    if (Get.find<AuthController>().isLoggedIn() &&
        Get.find<OrderController>().runningOrderList == null) {
      Get.find<OrderController>().getRunningOrders(1, notify: false, limit: 5);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = ResponsiveHelper.isDesktop(context);
    bool isLoggedIn = Get.find<AuthController>().isLoggedIn();
    final bool showWalletCard =
        Get.find<SplashController>().configModel!.customerWalletStatus == 1 ||
            Get.find<SplashController>().configModel!.loyaltyPointStatus == 1;
    Get.put(MyProfilesController());
    return GetBuilder<MyProfilesController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset(Images.arrowLeft1),
          ),
          title: Text(
            "Profile".tr,
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff1E1E1E),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column( 
            children: [
              SizedBox(height: 23.5.h),
              Container(
                height: 120.h,
                width: 390.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Container(
                  height: 56.h,
                  width: 358.w,
                  child: Row(
                    children: [
                      Image.asset(Images.profile),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                          Text(
                            "19 aug 2024 23:21",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        alignment: Alignment.center,
                        height: 32.h,
                        width: 32.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.r),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.edit,
                          weight: 16.67.w,
                          //size: 16.67.w,
                          color: Color(0xff1E1E1E),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => AddressScreen());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCard(
                        title: '107',
                        subTitle: 'loyalty profile',
                        image: Images.star,
                      ),
                      SizedBox(width: 14.w),
                      CustomCard(
                        title: '3',
                        subTitle: 'total order',
                        image: Images.bag,
                      ),
                      SizedBox(width: 14.w),
                      CustomCard(
                        title: '\$ 0.00',
                        subTitle: 'wallet balance',
                        image: Images.bag2,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              CustomListTile(
                title: "Dark mode",
                image: Images.theme,
                widget: Switch(
                  activeTrackColor: Color(0xff7C0631),
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Color(0xff7C0631).withOpacity(0.5),
                  value: controller.switchOne,
                  onChanged: (value) {
                    controller.useSwitchOne(value);
                  },
                ),
              ),
              SizedBox(height: 12.h),
              CustomListTile(
                title: "Notifications",
                icon: Icons.notifications,
                widget: Switch(
                  activeTrackColor: Color(0xff7C0631),
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Color(0xff7C0631).withOpacity(0.5),
                  value: controller.switchTwo,
                  onChanged: (value) {
                    controller.useSwitchTwo(value);
                  },
                ),
              ),
              SizedBox(height: 12.h),
              CustomListTile(
                title: "change password",
                icon: Icons.lock,
              ),
              SizedBox(height: 12.h),
              CustomListTile(
                title: "Edit Profile",
                icon: Icons.edit,
              ),
              SizedBox(height: 12.h),
              CustomListTile(
                title: "Delete Account",
                icon: Icons.delete,
              ),
            ],
          ),
        ),
      ),
    );
    // return Scaffold(
    //   appBar: CustomAppBarWidget(title: 'profile'.tr),
    //   endDrawer: isDesktop ? const MenuDrawerWidget() : null,
    //   endDrawerEnableOpenDragGesture: false,
    //   backgroundColor: isDesktop ? Theme.of(context).colorScheme.surface : Theme.of(context).cardColor,
    //   body: GetBuilder<OrderController>(builder: (orderController) {
    //     return GetBuilder<ProfileController>(builder: (profileController) {
    //       return (isLoggedIn && profileController.userInfoModel == null && (orderController.runningOrderList == null)) ? const Center(
    //         child: CircularProgressIndicator(),
    //       ) : Center(
    //         child: SingleChildScrollView(
    //           controller: scrollController,
    //           child: FooterViewWidget(
    //             minHeight: isLoggedIn ?  isDesktop ? 0.4 : 0.6 : 0.35,
    //             child: (isLoggedIn && isDesktop) ? WebProfileWidget(profileController: profileController, orderController: orderController) : isLoggedIn ? Container(
    //               color: Theme.of(context).primaryColor.withOpacity(0.1),
    //               width: Dimensions.webMaxWidth, height: context.height - 80,
    //               child: Center(
    //                 child: Column(children: [

    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraLarge, vertical: Dimensions.paddingSizeOverLarge),
    //                     child: Row(children: [

    //                       ClipOval(child: CustomImageWidget(
    //                         placeholder: isLoggedIn ? Images.profilePlaceholder : Images.guestIcon,
    //                         image: '${(profileController.userInfoModel != null && isLoggedIn) ? profileController.userInfoModel!.imageFullUrl : ''}',
    //                         height: 70, width: 70, fit: BoxFit.cover, imageColor: isLoggedIn ? Theme.of(context).hintColor : null,
    //                       )),
    //                       const SizedBox(width: Dimensions.paddingSizeDefault),

    //                       Expanded(
    //                         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    //                           Text(
    //                             isLoggedIn ? '${profileController.userInfoModel?.fName ?? ''} ${profileController.userInfoModel?.lName ?? ''}' : 'guest_user'.tr,
    //                             style: robotoBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),
    //                           ),
    //                           const SizedBox(height: Dimensions.paddingSizeExtraSmall),

    //                           isLoggedIn ? Text(
    //                             profileController.userInfoModel?.createdAt != null ?'${'joined'.tr} ${DateConverter.containTAndZToUTCFormat(profileController.userInfoModel!.createdAt!)}' : '',
    //                             style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).primaryColor),
    //                           ) : InkWell(
    //                             onTap: () async {
    //                               if(!isDesktop) {
    //                                 await Get.toNamed(RouteHelper.getSignInRoute(Get.currentRoute));
    //                               }else{
    //                                 Get.dialog(const Center(child: AuthDialogWidget(exitFromApp: false, backFromThis: false))).then((value) {
    //                                   _initCall();
    //                                   setState(() {});
    //                                 });
    //                               }
    //                             },
    //                             child: Text(
    //                               'login_to_view_all_feature'.tr,
    //                               style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).primaryColor),
    //                             ),
    //                           ),
    //                         ]),
    //                       ),

    //                       isLoggedIn ? InkWell(
    //                         onTap: ()=> Get.toNamed(RouteHelper.getUpdateProfileRoute()),
    //                         child: Container(
    //                           decoration: BoxDecoration(
    //                             shape: BoxShape.circle,
    //                             color: Theme.of(context).cardColor,
    //                             boxShadow: Get.isDarkMode ? null : [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 3, spreadRadius: 1, offset: const Offset(0, 1))],
    //                           ),
    //                           padding: const EdgeInsets.all(8),
    //                           child: Icon(Icons.edit_outlined, size: 24, color: Theme.of(context).primaryColor),
    //                         ),
    //                       ) : InkWell(
    //                         onTap: () async {
    //                           if(!isDesktop) {
    //                             await Get.toNamed(RouteHelper.getSignInRoute(Get.currentRoute));
    //                           }else{
    //                             Get.dialog(const Center(child: AuthDialogWidget(exitFromApp: false, backFromThis: false))).then((value) {
    //                               _initCall();
    //                               setState(() {});
    //                             });
    //                           }
    //                         },
    //                         child: Container(
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
    //                             color: Theme.of(context).primaryColor,
    //                           ),
    //                           padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall, horizontal: Dimensions.paddingSizeLarge),
    //                           child: Text(
    //                             'login'.tr, style: robotoMedium.copyWith(color: Theme.of(context).cardColor),
    //                           ),
    //                         ),
    //                       ),

    //                     ]),
    //                   ),

    //                   Expanded(
    //                     child: Container(
    //                       decoration: BoxDecoration(
    //                         borderRadius: const BorderRadius.vertical(top: Radius.circular(Dimensions.radiusExtraLarge)),
    //                         color: Theme.of(context).cardColor,
    //                       ),
    //                       padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge, vertical: Dimensions.paddingSizeLarge),
    //                       child: Column(children: [

    //                         (showWalletCard && isLoggedIn) ? Row(children: [

    //                           Get.find<SplashController>().configModel!.loyaltyPointStatus == 1 ? Expanded(child: ProfileCardWidget(
    //                             image: Images.loyaltyIcon,
    //                             data: profileController.userInfoModel?.loyaltyPoint != null ? profileController.userInfoModel!.loyaltyPoint.toString() : '0',
    //                             title: 'loyalty_points'.tr,
    //                           )) : const SizedBox(),

    //                           SizedBox(width: Get.find<SplashController>().configModel!.loyaltyPointStatus == 1 ? Dimensions.paddingSizeSmall : 0),

    //                           isLoggedIn ?  Expanded(child: ProfileCardWidget(
    //                             image: Images.shoppingBagIcon,
    //                             data: profileController.userInfoModel?.orderCount != null ? profileController.userInfoModel!.orderCount.toString() : '0',
    //                             title: 'total_order'.tr,
    //                           )) : const SizedBox(),

    //                           SizedBox(width: Get.find<SplashController>().configModel!.customerWalletStatus == 1 ? Dimensions.paddingSizeSmall : 0),

    //                           Get.find<SplashController>().configModel!.customerWalletStatus == 1 ? Expanded(child: ProfileCardWidget(
    //                             image: Images.walletProfile,
    //                             data: PriceConverter.convertPrice(profileController.userInfoModel?.walletBalance != null ? profileController.userInfoModel!.walletBalance : 0),
    //                             title: 'wallet_balance'.tr,
    //                           )) : const SizedBox(),

    //                         ]) : const SizedBox(),
    //                         const SizedBox(height: Dimensions.paddingSizeLarge),

    //                         isLoggedIn ? GetBuilder<AuthController>(builder: (authController) {
    //                           return ProfileButtonWidget(
    //                             icon: Icons.notifications, title: 'notification'.tr,
    //                             isButtonActive: authController.notification, onTap: () {
    //                             Get.bottomSheet(const NotificationStatusChangeBottomSheet());
    //                             // authController.setNotificationActive(!authController.notification);
    //                           },
    //                           );
    //                         }) : const SizedBox(),
    //                         SizedBox(height: isLoggedIn ? Dimensions.paddingSizeSmall : 0),

    //                         isLoggedIn ? ProfileButtonWidget(icon: Icons.lock, title: 'change_password'.tr, onTap: () {
    //                           Get.toNamed(RouteHelper.getResetPasswordRoute('', '', 'password-change'));
    //                         }) : const SizedBox(),
    //                         SizedBox(height: isLoggedIn ? Dimensions.paddingSizeSmall : 0),

    //                         isLoggedIn ? ProfileButtonWidget(
    //                           icon: Icons.delete,
    //                           iconImage: Images.profileDelete,
    //                           title: 'delete_account'.tr,
    //                           onTap: () {
    //                             showModalBottomSheet(
    //                               isScrollControlled: true, useRootNavigator: true, context: Get.context!,
    //                               backgroundColor: Colors.white,
    //                               shape: const RoundedRectangleBorder(
    //                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radiusExtraLarge), topRight: Radius.circular(Dimensions.radiusExtraLarge)),
    //                               ),
    //                               builder: (context) {
    //                                 return ConstrainedBox(
    //                                   constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
    //                                   child: AccountDeletionBottomSheet(
    //                                     profileController: profileController,
    //                                     isRunningOrderAvailable: orderController.runningOrderList != null && orderController.runningOrderList!.isNotEmpty,
    //                                   ),
    //                                 );
    //                               },
    //                             );
    //                           },
    //                         ) : const SizedBox(),
    //                         SizedBox(height: isLoggedIn ? Dimensions.paddingSizeLarge : 0),

    //                         const Expanded(child: SizedBox()),
    //                         Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    //                           Text('${'version'.tr}:', style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall)),
    //                           const SizedBox(width: Dimensions.paddingSizeExtraSmall),

    //                           Text(AppConstants.appVersion.toString(), style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeExtraSmall)),
    //                         ]),
    //                       ]),
    //                     ),
    //                   ),

    //                 ]),
    //               ),
    //             ) : SizedBox(
    //               width: Dimensions.webMaxWidth, height: context.height - 87,
    //               child: Center(
    //                 child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

    //                   ClipOval(child: CustomImageWidget(
    //                     placeholder: isLoggedIn ? Images.profilePlaceholder : Images.guestIcon,
    //                     image: '${(profileController.userInfoModel != null && isLoggedIn) ? profileController.userInfoModel!.imageFullUrl : ''}',
    //                     height: 70, width: 70, fit: BoxFit.cover, imageColor: isLoggedIn ? Theme.of(context).hintColor : null,
    //                   )),
    //                   const SizedBox(height: Dimensions.paddingSizeSmall),

    //                   Text(
    //                     'guest_user'.tr,
    //                     style: robotoBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),
    //                   ),
    //                   const SizedBox(height: Dimensions.paddingSizeSmall),

    //                   SizedBox(
    //                     width: context.width * 0.6,
    //                     child: Text(
    //                       'currently_you_are_in_guest_mode_please_login_to_view_all_the_features'.tr,
    //                       style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor),
    //                       textAlign: TextAlign.center,
    //                     ),
    //                   ),
    //                   const SizedBox(height: Dimensions.paddingSizeOverLarge),

    //                   CustomButtonWidget(
    //                     buttonText: 'login'.tr,
    //                     width: 150,
    //                     onPressed: () async {
    //                       if(!isDesktop) {
    //                         await Get.toNamed(RouteHelper.getSignInRoute(Get.currentRoute))?.then((value) {
    //                           _initCall();
    //                           setState(() {});
    //                         });
    //                       }else{
    //                         Get.dialog(const Center(child: AuthDialogWidget(exitFromApp: false, backFromThis: false))).then((value) {
    //                           _initCall();
    //                           setState(() {});
    //                         });
    //                       }
    //                     },
    //                   ),

    //                   const SizedBox(height: 50),

    //                 ]),
    //               ),
    //             ),

    //           ),
    //         ),
    //       );
    //     });
    //   }),
    // );
  }
}
