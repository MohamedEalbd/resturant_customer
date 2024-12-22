import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:stackfood_multivendor/common/widgets/build_button_widget.dart';
import 'package:stackfood_multivendor/features/auth/controllers/my_auth_controller.dart';
import 'package:stackfood_multivendor/features/auth/screens/sign_in_screen.dart';
import 'package:stackfood_multivendor/features/auth/widgets/custom_field_phone_number.dart';
import 'package:stackfood_multivendor/features/auth/widgets/text_field_register.dart';
import 'package:get/get.dart';
import 'package:stackfood_multivendor/util/images.dart';

import '../../../common/widgets/custom_text_field_widget.dart';
import '../../../common/widgets/validate_check.dart';
import '../../language/controllers/localization_controller.dart';
import '../../splash/controllers/splash_controller.dart';
import '../widgets/sign_up_widget.dart';

class SignUpScreen extends StatefulWidget {
  final bool exitFromApp;
  const SignUpScreen({super.key, this.exitFromApp = false});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _phoneFocus = FocusNode();
  String? _countryDialCode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _countryDialCode = CountryCode.fromCountryCode(Get.find<SplashController>().configModel!.country!).dialCode;

  }
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyAuthControllerImp());




    return Scaffold(
      // backgroundColor: ResponsiveHelper.isDesktop(context)
      //     ? Colors.transparent
      //     : Theme.of(context).cardColor,
      // appBar: ResponsiveHelper.isDesktop(context)
      //     ? null
      //     : !widget.exitFromApp
      //         ? AppBar(
      //             leading: IconButton(
      //               onPressed: () => Get.back(result: false),
      //               icon: Icon(Icons.arrow_back_ios_rounded,
      //                   color: Theme.of(context).textTheme.bodyLarge!.color),
      //             ),
      //             elevation: 0,
      //             backgroundColor: Theme.of(context).cardColor)
      //         : null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 45, bottom: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Images.knz, height: 80, width: 171),
                SizedBox(height: 57),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'sign up'.tr,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff1E1E1E),
                        fontFamily: "Inter"),
                  ),
                ),
                SizedBox(height: 6),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     SizedBox(
                //       width: 171,
                //       child: TextFieldRegister(
                //         controller: controller.firstName,
                //         prefixIcon: SizedBox(),
                //         isObscureText: true,
                //         labelText: "First Name".tr,
                //         validator: (value) => ValidateCheck.validateEmptyText(value, "please_enter_your_name".tr),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 171,
                //       child: TextFieldRegister(
                //         controller: controller.secondName,
                //         prefixIcon: SizedBox(),
                //         isObscureText: true,
                //         labelText: "Last Name".tr,
                //         validator: (value) => ValidateCheck.validateEmptyText(value, "please_enter_your_name".tr),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 14),
                // CustomTextFieldWidget(
                //   hintText: 'xxx-xxx-xxxxx'.tr,
                //   labelText: 'phone'.tr,
                //   showLabelText: true,
                //   required: true,
                //   controller: controller.phoneLogin,
                //   focusNode: _phoneFocus,
                //  // nextFocus: isDesktop ? _passwordFocus : _emailFocus,
                //   inputType: TextInputType.phone,
                //   isPhone: true,
                //   onCountryChanged: (CountryCode countryCode) {
                //     _countryDialCode = countryCode.dialCode;
                //   },
                //
                //   countryDialCode: _countryDialCode != null ? CountryCode.fromCountryCode(Get.find<SplashController>().configModel!.country!).code
                //       : Get.find<LocalizationController>().locale.countryCode,
                //   validator: (value) => ValidateCheck.validateEmptyText(value, "please_enter_phone_number".tr),
                // ),
                // // CustomFieldPhoneNumber(
                // //   controller: controller.phoneRegister,
                // //   valueChanged: (String value) {},
                // //
                // // ),
                // SizedBox(height: 14),
                // TextFieldRegister(
                //   controller: controller.email,
                //   isObscureText: true,
                //   prefixIcon: Image.asset(Images.iconMail),
                //   labelText: "Email".tr,
                // ),
                // SizedBox(height: 14),
                // TextFieldRegister(
                //   controller: controller.password,
                //   prefixIcon: Image.asset(Images.iconLock),
                //   labelText: "password".tr,
                // ),
                // SizedBox(height: 14),
                // TextFieldRegister(
                //   controller: controller.confirmPassword,
                //   prefixIcon: Image.asset(Images.iconLock),
                //   labelText: "confirm password".tr,
                // ),
                const SignUpWidget(),
                SizedBox(height: 100),

              ],
            ),
          ),
        ),
        // Center(
        //   child: Container(
        //     width: context.width > 700 ? 700 : context.width,
        //     padding: context.width > 700
        //         ? const EdgeInsets.all(40)
        //         : const EdgeInsets.symmetric(
        //             horizontal: Dimensions.paddingSizeLarge),
        //     decoration: context.width > 700
        //         ? BoxDecoration(
        //             color: Theme.of(context).cardColor,
        //             borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
        //           )
        //         : null,
        //     child: SingleChildScrollView(
        //       child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             ResponsiveHelper.isDesktop(context)
        //                 ? Align(
        //                     alignment: Alignment.topRight,
        //                     child: IconButton(
        //                       onPressed: () => Get.back(),
        //                       icon: const Icon(Icons.clear),
        //                     ),
        //                   )
        //                 : const SizedBox(),
        //             Image.asset(Images.logo, width: 60),
        //             const SizedBox(height: Dimensions.paddingSizeSmall),
        //             Image.asset(Images.logoName, width: 100),
        //             const SizedBox(height: Dimensions.paddingSizeExtraLarge),
        //             Align(
        //               alignment: Alignment.topLeft,
        //               child: Text('sign_up'.tr,
        //                   style: robotoBold.copyWith(
        //                       fontSize: Dimensions.fontSizeExtraLarge)),
        //             ),
        //             const SizedBox(height: Dimensions.paddingSizeDefault),
        //             const SignUpWidget(),
        //           ]),
        //     ),
        //   ),
        //),
      ),
    );
  }
}
