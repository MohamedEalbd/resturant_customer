import 'package:get/get.dart';
import 'package:flutter/material.dart';

abstract class MyAuthController extends GetxController {}

class MyAuthControllerImp extends MyAuthController {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController secondName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneRegister = TextEditingController();
  final TextEditingController phoneLogin = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
}
