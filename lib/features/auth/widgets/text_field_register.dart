import 'package:flutter/material.dart';

class TextFieldRegister extends StatefulWidget {
  const TextFieldRegister({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIconClick,
    this.prefixIcon,
    this.isObscureText,
    this.onChanged,
    this.keyboardType,this.validator
  });
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final void Function()? prefixIconClick;
  final  prefixIcon;
  final bool? isObscureText;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  State<TextFieldRegister> createState() => _TextFieldRegisterState();
}

class _TextFieldRegisterState extends State<TextFieldRegister> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        controller: widget.controller,
        validator: widget.validator,
        obscureText:
            widget.isObscureText == null || widget.isObscureText == false ? true : false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10),
          labelStyle: TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xffB1B1B1),
          ),
          hintStyle: TextStyle(
            fontFamily: "Inter",
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xffB1B1B1),
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
          prefixIcon: GestureDetector(
            onTap: widget.prefixIconClick,
            child:widget.prefixIcon,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(width: 1, color: Color(0xff7C0631)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(width: 1, color: Color(0xff7C0631)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(width: 1, color: Color(0xff7C0631)),
          ),
        ),
      ),
    );
  }
}
