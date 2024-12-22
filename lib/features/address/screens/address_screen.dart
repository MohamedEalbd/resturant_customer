import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stackfood_multivendor/common/widgets/not_logged_in_screen.dart';
import 'package:stackfood_multivendor/features/address/controllers/address_controller.dart';
import 'package:stackfood_multivendor/features/address/screens/add_address_screen.dart';
import 'package:stackfood_multivendor/features/address/widgets/address_confirmation_dialogue_widget.dart';
import 'package:stackfood_multivendor/features/address/widgets/custom_address.dart';
import 'package:stackfood_multivendor/features/auth/controllers/auth_controller.dart';
import 'package:stackfood_multivendor/helper/responsive_helper.dart';
import 'package:stackfood_multivendor/helper/route_helper.dart';
import 'package:stackfood_multivendor/util/dimensions.dart';
import 'package:stackfood_multivendor/util/images.dart';
import 'package:stackfood_multivendor/util/styles.dart';
import 'package:stackfood_multivendor/common/widgets/custom_app_bar_widget.dart';
import 'package:stackfood_multivendor/common/widgets/custom_snackbar_widget.dart';
import 'package:stackfood_multivendor/common/widgets/footer_view_widget.dart';
import 'package:stackfood_multivendor/common/widgets/menu_drawer_widget.dart';
import 'package:stackfood_multivendor/common/widgets/no_data_screen_widget.dart';
import 'package:stackfood_multivendor/common/widgets/web_page_title_widget.dart';
import 'package:stackfood_multivendor/features/address/widgets/address_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _initCall();
  }

  void _initCall() {
    if (Get.find<AuthController>().isLoggedIn()) {
      Get.find<AddressController>().getAddressList();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = Get.find<AuthController>().isLoggedIn();

    return GetBuilder<AddressController>(builder: (addressController) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff7C0631),
          child: Icon(
            Icons.add,
            weight: 20.w,
          ),
          onPressed: () {
            Get.to(()=>AddAddressScreen(fromCheckout: false,));
          },
        ),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset(Images.arrowLeft1),
          ),
          title: Text(
            "My Address".tr,
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
              SizedBox(height: 20.h),
              CustomAddress(
                image: Images.collection,
                title: 'Other',
                address: '1234 Elm Street, Apt 5B, Springfield, IL 62704, USA',
              ),
              SizedBox(height: 18.h),
              CustomAddress(
                image: Images.myBag,
                title: 'Office',
                address: '1234 Elm Street, Apt 5B, Springfield, IL 62704, USA',
              ),
              SizedBox(height: 18.h),
              CustomAddress(
                image: Images.myHome,
                title: 'Home',
                address: '1234 Elm Street, Apt 5B, Springfield, IL 62704, USA',
              ),
            ],
          ),
        ),
      );
      // return Scaffold (

      //   appBar: CustomAppBarWidget(title: 'my_address'.tr),

      //   endDrawer: const MenuDrawerWidget(), endDrawerEnableOpenDragGesture: false,

      //   floatingActionButton:  ResponsiveHelper.isDesktop(context) || !isLoggedIn ? null : (addressController.addressList?.isEmpty ?? true) ? null : FloatingActionButton(
      //     backgroundColor: Theme.of(context).primaryColor,
      //     onPressed: () => Get.toNamed(RouteHelper.getAddAddressRoute(false, 0)),
      //     child: Icon(Icons.add, color: Theme.of(context).cardColor),
      //   ),
      //   floatingActionButtonLocation: ResponsiveHelper.isDesktop(context) ? FloatingActionButtonLocation.centerFloat : null,

      //   body: GetBuilder<AddressController>(builder: (addressController) {
      //     return isLoggedIn ? RefreshIndicator(
      //       onRefresh: () async {
      //         await addressController.getAddressList();
      //       },
      //       child: Container(
      //         height: context.height,
      //         decoration: BoxDecoration(
      //           image: DecorationImage(
      //             image: addressController.addressList != null ? AssetImage(addressController.addressList!.isNotEmpty ? Images.city : Images.cityWhite)
      //                 : const AssetImage(Images.city),
      //             alignment: Alignment.bottomCenter,
      //           ),
      //         ),
      //         child: SingleChildScrollView(
      //           controller: scrollController,
      //           physics: const BouncingScrollPhysics(),
      //           child: Column(children: [

      //             WebScreenTitleWidget(title: 'address'.tr),

      //             Center(child: FooterViewWidget(
      //               child: SizedBox(
      //                 width: Dimensions.webMaxWidth,
      //                 child: Column(children: [

      //                   ResponsiveHelper.isDesktop(context) ? const SizedBox(height: Dimensions.paddingSizeLarge) : const SizedBox(),

      //                   addressController.addressList != null ? addressController.addressList!.isNotEmpty ? Padding(
      //                     padding: ResponsiveHelper.isMobile(context) ? const EdgeInsets.all(Dimensions.paddingSizeSmall) : EdgeInsets.zero,
      //                     child: GridView.builder(
      //                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                         crossAxisSpacing: Dimensions.paddingSizeLarge,
      //                         mainAxisSpacing: ResponsiveHelper.isDesktop(context) ? Dimensions.paddingSizeSmall : 0.01,
      //                         childAspectRatio: ResponsiveHelper.isDesktop(context) ? 4 : 5,
      //                         crossAxisCount: ResponsiveHelper.isMobile(context) ? 1 : ResponsiveHelper.isTab(context) ? 2 : 3,
      //                       ),
      //                       physics: const NeverScrollableScrollPhysics(),
      //                       padding: EdgeInsets.all(ResponsiveHelper.isTab(context) ? Dimensions.paddingSizeSmall : 0),
      //                       shrinkWrap: true,
      //                       itemCount: ResponsiveHelper.isDesktop(context) ? (addressController.addressList!.length + 1)  : addressController.addressList!.length,
      //                       itemBuilder: (context, index) {
      //                         return (ResponsiveHelper.isDesktop(context) && (index == addressController.addressList!.length)) ? Padding(
      //                           padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
      //                           child: InkWell(
      //                             onTap: () => Get.toNamed(RouteHelper.getAddAddressRoute(false, 0)),
      //                             child: Container(
      //                               padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      //                               decoration:  BoxDecoration(
      //                                 color: Theme.of(context).cardColor,
      //                                 borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
      //                                 boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 10, offset: const Offset(0, 1))],
      //                               ),
      //                               child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      //                                 Icon(Icons.add_circle_outline, color: Theme.of(context).primaryColor),
      //                                 const SizedBox(height: Dimensions.paddingSizeSmall),

      //                                 Text('add_new_address'.tr, style: robotoRegular.copyWith(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeSmall)),

      //                               ]),
      //                             ),
      //                           ),
      //                         ) : AddressCardWidget(
      //                           address: addressController.addressList![index], fromAddress: true,
      //                           onTap: () {
      //                             Get.toNamed(RouteHelper.getMapRoute(
      //                               addressController.addressList![index], 'address',
      //                             ));
      //                           },
      //                           onEditPressed: () {
      //                             Get.toNamed(RouteHelper.getEditAddressRoute(addressController.addressList![index]));
      //                           },
      //                           onRemovePressed: () {
      //                             if(Get.isSnackbarOpen) {
      //                               Get.back();
      //                             }
      //                           Get.dialog(AddressConfirmDialogueWidget(
      //                             icon: Images.locationConfirm,
      //                             title: 'are_you_sure'.tr,
      //                             description: 'you_want_to_delete_this_location'.tr,
      //                             onYesPressed: () {
      //                               addressController.deleteAddress(addressController.addressList![index].id, index).then((response) {
      //                                 Get.back();
      //                                 showCustomSnackBar(response.message, isError: !response.isSuccess);
      //                               });
      //                             },
      //                           ));
      //                           },
      //                         );
      //                       },
      //                     ),
      //                   ) : NoDataScreen(title: 'no_address_found'.tr, isEmptyAddress: true, fromAddress: true) : const Center(child: CircularProgressIndicator()),

      //                 ]),
      //               ),
      //             )),

      //           ]),
      //         ),
      //       ),
      //     ) : NotLoggedInScreen(callBack: (value){
      //       _initCall();
      //       setState(() {});
      //     });
      //   }),
      // );
    });
  }
}
