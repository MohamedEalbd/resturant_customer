import 'dart:async';
import 'dart:io';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:stackfood_multivendor/common/widgets/build_button_widget.dart';
import 'package:stackfood_multivendor/features/auth/controllers/my_auth_controller.dart';
import 'package:stackfood_multivendor/features/auth/screens/find_location_screen.dart';
import 'package:stackfood_multivendor/features/auth/screens/sign_up_screen.dart';
import 'package:stackfood_multivendor/features/auth/widgets/custom_field_phone_number.dart';
import 'package:stackfood_multivendor/features/auth/widgets/sign_in/sign_in_view.dart';
import 'package:stackfood_multivendor/features/auth/widgets/text_field_register.dart';
import 'package:stackfood_multivendor/features/home_tap/screen/home_tap_screen.dart';
import 'package:stackfood_multivendor/helper/responsive_helper.dart';
import 'package:stackfood_multivendor/helper/route_helper.dart';
import 'package:stackfood_multivendor/util/dimensions.dart';
import 'package:stackfood_multivendor/util/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/widgets/custom_text_field_widget.dart';
import '../../../common/widgets/validate_check.dart';
import '../../address/screens/address_screen.dart';
import '../../address/screens/new_address_screen.dart';
import '../../language/controllers/localization_controller.dart';
import '../../splash/controllers/splash_controller.dart';

class SignInScreen extends StatefulWidget {
  final bool exitFromApp;
  final bool backFromThis;
  final bool fromResetPassword;
  const SignInScreen(
      {super.key,
      required this.exitFromApp,
      required this.backFromThis,
      this.fromResetPassword = false});

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  bool _canExit = GetPlatform.isWeb ? true : false;
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  String? _countryDialCode;

  @override
  void initState() {
    super.initState();

    _countryDialCode = CountryCode.fromCountryCode(Get.find<SplashController>().configModel!.country!).dialCode;
  }
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyAuthControllerImp());

    return PopScope(
      canPop: Navigator.canPop(context),
      onPopInvokedWithResult: (didPop, result) async {
        if (widget.exitFromApp) {
          if (_canExit) {
            if (GetPlatform.isAndroid) {
              SystemNavigator.pop();
            } else if (GetPlatform.isIOS) {
              exit(0);
            } else {
              Navigator.pushNamed(context, RouteHelper.getInitialRoute());
            }
            // return Future.value(false);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('back_press_again_to_exit'.tr,
                  style: const TextStyle(color: Colors.white)),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 2),
              margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            ));
            _canExit = true;
            Timer(const Duration(seconds: 2), () {
              _canExit = false;
            });
            // return Future.value(false);
          }
        } else {
          return;
          // Get.back(result: false);
        }
      },
      child: Scaffold(
        backgroundColor: ResponsiveHelper.isDesktop(context)
            ? Colors.transparent
            : Theme.of(context).cardColor,
        appBar: ResponsiveHelper.isDesktop(context)
            ? null
            : !widget.exitFromApp
                ? AppBar(
                    leading: IconButton(
                      onPressed: () => Get.back(result: false),
                      icon: Icon(Icons.arrow_back_ios_rounded,
                          color: Theme.of(context).textTheme.bodyLarge!.color),
                    ),
                    elevation: 0,
                    backgroundColor: Theme.of(context).cardColor)
                : null,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 45, bottom: 20),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Images.knz, height: 100, width: 171),
                  SizedBox(height: 57),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'sign in'.tr,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1E1E1E),
                          fontFamily: "Inter"),
                    ),
                  ),
                  SizedBox(height: 16),
                  CustomTextFieldWidget(
                    hintText: 'xxx-xxx-xxxxx'.tr,
                    labelText: 'phone'.tr,
                    showLabelText: true,
                    required: true,
                    controller: _phoneController,
                    focusNode: _phoneFocus,
                    nextFocus: _passwordFocus,
                    inputType: TextInputType.phone,
                    isPhone: true,
                    onCountryChanged: (CountryCode countryCode) {
                      _countryDialCode = countryCode.dialCode;
                    },
                    countryDialCode: _countryDialCode != null ? CountryCode.fromCountryCode(Get.find<SplashController>().configModel!.country!).code
                        : Get.find<LocalizationController>().locale.countryCode,
                    validator: (value) => ValidateCheck.validateEmptyText(value, "please_enter_phone_number".tr),
                  ),
                  SizedBox(height: 16,),
                  CustomTextFieldWidget(
                    hintText: '8+characters'.tr,
                    labelText: 'password'.tr,
                    showLabelText: true,
                    required: true,
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    inputType: TextInputType.visiblePassword,
                    prefixIcon: Icons.lock,
                    isPassword: true,
                    validator: (value) => ValidateCheck.validateEmptyText(value, "please_enter_password".tr),
                  ),
                  SizedBox(height: 122),
                  BuildButtonWidget(
                    txt: 'Sign in'.tr,
                    onTap: () {

                      Get.to(() => NewAddressScreen());
                      //
                    },
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account? '.tr,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1E1E1E),
                            fontFamily: "Inter"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SignUpScreen(
                              exitFromApp: false,

                            ),
                          );
                        },
                        child: Text(
                          'sign up'.tr,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff1E1E1E),
                              fontFamily: "Inter"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          //     Align(
          //   alignment: Alignment.center,
          //   child: Container(
          //     width: context.width > 700 ? 500 : context.width,
          //     padding: context.width > 700
          //         ? const EdgeInsets.all(50)
          //         : const EdgeInsets.symmetric(
          //             horizontal: Dimensions.paddingSizeExtraLarge),
          //     margin: context.width > 700
          //         ? const EdgeInsets.all(50)
          //         : EdgeInsets.zero,
          //     decoration: context.width > 700
          //         ? BoxDecoration(
          //             color: Theme.of(context).cardColor,
          //             borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
          //             boxShadow: ResponsiveHelper.isDesktop(context)
          //                 ? null
          //                 : [
          //                     BoxShadow(
          //                         color: Colors.grey[Get.isDarkMode ? 700 : 300]!,
          //                         blurRadius: 5,
          //                         spreadRadius: 1)
          //                   ],
          //           )
          //         : null,
          //     child: SingleChildScrollView(
          //       child:
          //           Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          //         ResponsiveHelper.isDesktop(context)
          //             ? Align(
          //                 alignment: Alignment.topRight,
          //                 child: IconButton(
          //                   onPressed: () => Get.back(),
          //                   icon: const Icon(Icons.clear),
          //                 ),
          //               )
          //             : const SizedBox(),

          //         // Image.asset(Images.logo, width: 60),
          //         // const SizedBox(height: Dimensions.paddingSizeSmall),
          //         // Image.asset(Images.logoName, width: 100),
          //         // const SizedBox(height: Dimensions.paddingSizeExtraLarge),

          //         Row(mainAxisSize: MainAxisSize.min, children: [
          //           Image.asset(Images.logo, height: 40, width: 40),
          //           const SizedBox(width: Dimensions.paddingSizeExtraSmall),
          //           Image.asset(Images.logoName, height: 50, width: 120),
          //         ]),

          //         const SizedBox(height: Dimensions.paddingSizeOverLarge),

          //         SignInView(
          //           exitFromApp: widget.exitFromApp,
          //           backFromThis: widget.backFromThis,
          //           fromResetPassword: widget.fromResetPassword,
          //           isOtpViewEnable: (v) {},
          //         ),
          //       ]),
          //     ),
          //   ),
          // )
        ),
      ),
    );
  }
}
