import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stackfood_multivendor/features/favourite/screens/favourite_screen.dart';
import 'package:stackfood_multivendor/features/myhome/screens/my_home_screen.dart';
import 'package:stackfood_multivendor/features/settings/screens/settings_screen.dart';

import '../../order/screens/order_screen.dart';
import '../../profile/screens/profile_screen.dart';

abstract class HomeScreenController extends GetxController {
  chanPage(int i);
  goToCart();
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  // Curd curd = Get.find();

  logOutt() {}

  List<Widget> pages = [
    MyHomeScreen(),
    FavouriteScreen(),
    OrderScreen(),
    //Center(child: Text("locked")),
    ProfileScreen(),
  ];

  List words = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Favorites", "icon": Icons.favorite},
    {"title": "Locked", "icon": Icons.lock},
    {"title": "settings", "icon": Icons.view_headline},
  ];
  @override
  chanPage(int i) {
    currentPage = i;
    update();
  }

  @override
  goToCart() {}
}
