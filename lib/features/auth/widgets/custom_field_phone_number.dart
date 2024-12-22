import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stackfood_multivendor/features/auth/widgets/text_field_register.dart';

class CustomFieldPhoneNumber extends StatelessWidget {
  final ValueChanged<String> valueChanged;
  final TextEditingController? controller;
  const CustomFieldPhoneNumber({
    super.key,
    required this.valueChanged, this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldRegister(
      controller: controller,
      keyboardType: TextInputType.phone,
      isObscureText: true,
      hintText: " Phone Number".tr,
      prefixIcon: Container(
        height: 40,
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        child: Container(
          width: 80,
          height: 48,
          alignment: Alignment.center,
          child: CountryCodePicker(
            onChanged: print,
            builder: (countryCode) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    countryCode!.flagUri!,
                    package: 'country_code_picker',
                    width: 30.0,
                  ),
                  Text('${countryCode}'),
                  SizedBox(
                    width: 2,
                  ),
                  // SvgPicture.asset(
                  //     IconsManger.caretDownIcon), // Arrow-down icon
                ],
              );
            },
            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
            initialSelection: '+20',
            favorite: ['+20', '+966'],
            // optional. Shows only country name and flag
            showCountryOnly: true,
            // optional. Shows only country name and flag when popup is closed.
            showOnlyCountryWhenClosed: false,
            // optional. aligns the flag and the Text left
            alignLeft: false,
            countryFilter: ['+20', '+966'],
            hideSearch: false,
            textStyle: TextStyle(
                fontSize: 14,
                color: Color(0xff414141),
                fontWeight: FontWeight.w500),
            dialogSize: Size(50, 300),
          ),
        ),
      ),
    );
    //  Row(
    //   children: [

    //     SizedBox(width: 10),
    //     Expanded(
    //       child: TextFieldRegister(
    //         //prefixIcon: ,
    //         keyboardType: TextInputType.phone,
    //         onChanged: (value) {
    //           try {
    //             valueChanged(value);
    //           } catch (e) {
    //             showSnackBar(context, 'Invalid phone number');
    //           }
    //         },
    //         //controller: _phoneController,
    //         hintText: "phone number".tr,
    //       ),
    //     ),
    //   ],
    // );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onPressed;
  final String? labelText;
  final String? hintText;
  final bool? obscureText;
  final IconData? icon;
  final TextInputType? keyboardType;
  const CustomTextField({
    super.key,
    this.controller,
    this.labelText,
    this.validator,
    this.hintText,
    this.obscureText,
    this.icon,
    this.onChanged,
    this.onPressed,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextFormField(
        keyboardType: keyboardType,
        // obscureText: obscureText == null || obscureText == false ? true : false,
        validator: validator,
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: obscureText == null || obscureText == false
                  ? Colors.grey
                  : Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
