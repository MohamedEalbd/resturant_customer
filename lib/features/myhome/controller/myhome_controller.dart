import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stackfood_multivendor/features/myhome/models/best_food_model.dart';
import 'package:stackfood_multivendor/features/myhome/models/best_resturant.dart';
import 'package:stackfood_multivendor/features/myhome/models/card_model.dart';
import 'package:stackfood_multivendor/features/myhome/models/categories_model.dart';
import 'package:stackfood_multivendor/features/myhome/models/cuisines_model.dart';
import 'package:stackfood_multivendor/features/myhome/models/offer_model.dart';
import 'package:stackfood_multivendor/features/myhome/models/popular_foods_nearby.dart';
import 'package:stackfood_multivendor/util/images.dart';

abstract class MyHomeController extends GetxController {}

class MyHomeControllerImp extends MyHomeController {
  final TextEditingController search = TextEditingController();

  PageController controller = PageController();
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    update();
  }

  List<CardModel> cards = [
    CardModel(id: 1, imageUrl: Images.cardImage),
    CardModel(id: 2, imageUrl: Images.cardImage),
    CardModel(id: 3, imageUrl: Images.cardImage),
    CardModel(id: 4, imageUrl: Images.cardImage),
    CardModel(id: 5, imageUrl: Images.cardImage),
    CardModel(id: 6, imageUrl: Images.cardImage),
    CardModel(id: 7, imageUrl: Images.cardImage),
    CardModel(id: 8, imageUrl: Images.cardImage),
  ];

  List<CategoriesModel> categories = [
    CategoriesModel(id: 1, imageUrl: Images.image1, title: 'available today'),
    CategoriesModel(
        id: 2, imageUrl: Images.image2, title: 'available tomorrow'),
    CategoriesModel(id: 3, imageUrl: Images.image3, title: 'Early booking'),
    CategoriesModel(id: 4, imageUrl: Images.image4, title: 'Less than 30 sAR'),
    CategoriesModel(
        id: 5,
        imageUrl: Images.image1,
        title: ' Then the other classifications today'),
    CategoriesModel(id: 6, imageUrl: Images.image1, title: 'available today'),
    CategoriesModel(id: 7, imageUrl: Images.image1, title: 'available today'),
    CategoriesModel(id: 8, imageUrl: Images.image1, title: 'available today'),
  ];

  List<OfferModel> offers = [
    OfferModel(
      id: 1,
      imageUrl: Images.offer1,
    ),
    OfferModel(
      id: 2,
      imageUrl: Images.offer2,
    ),
    OfferModel(
      id: 3,
      imageUrl: Images.offer3,
    ),
    OfferModel(
      id: 4,
      imageUrl: Images.offer1,
    ),
    OfferModel(id: 4, imageUrl: Images.offer2)
  ];

  List<BestFoodModel> bestFoods = [
    BestFoodModel(
      name: "Pizza",
      rate: 4.5,
      time: "5",
      id: 1,
      imageUrl: Images.bestFood1,
      // Images.mypizza,
    ),
    BestFoodModel(
      name: "burger",
      rate: 4.5,
      time: "5",
      id: 2,
      imageUrl: Images.bestFood2,
      // Images.myburger,
    ),
    BestFoodModel(
      name: "Pizza",
      rate: 4.5,
      time: "5",
      id: 3,
      imageUrl: Images.bestFood1,
      //Images.mypizza,
    ),
    BestFoodModel(
      name: "burger",
      rate: 4.5,
      time: "5",
      id: 4,
      imageUrl: Images.bestFood2,
      //Images.mypizza,
    ),
  ];

  List<BestRestaurantModel> bestRestaurants = [
    BestRestaurantModel(
      name: "pasta",
      rate: 4.5,
      subTitle: "pasta",
      id: 1,
      imageUrl: Images.res1,
      isFav: null,
    ),
    BestRestaurantModel(
      name: "burger",
      rate: 4.5,
      subTitle: "burger",
      id: 2,
      imageUrl: Images.res2,
      isFav: null,
    ),
    BestRestaurantModel(
      name: "pasta",
      rate: 4.5,
      subTitle: "pasta",
      id: 3,
      imageUrl: Images.res1,
      isFav: null,
    ),
    BestRestaurantModel(
      name: "burger",
      rate: 4.5,
      subTitle: "burger",
      id: 4,
      imageUrl: Images.res2,
      isFav: null,
    ),
    BestRestaurantModel(
      name: "pasta",
      rate: 4.5,
      subTitle: "pasta",
      id: 5,
      imageUrl: Images.res1,
      isFav: null,
    )
  ];
  List<PopularFoodsNearby> popularFoodsNearby = [
    PopularFoodsNearby(
      name: "pasta",
      rate: 4.5,
      type: "pasta",
      id: 1,
      imageUrl: Images.pic1,
      salary: 130,
    ),
    PopularFoodsNearby(
      name: "burger",
      rate: 4.5,
      type: "burger",
      id: 2,
      imageUrl: Images.pic2,
      salary: 250,
    ),
  ];

  List<CuisinesModel> cuisines = [
    CuisinesModel(
      name: "Burger",
      id: 1,
      imageUrl: Images.burger,
    ),
    CuisinesModel(
      name: "pasta",
      id: 2,
      imageUrl: Images.pasta1,
    ),
    CuisinesModel(
      name: "Pizza",
      id: 3,
      imageUrl: Images.pizza,
    ),
    CuisinesModel(
      name: "pasta",
      id: 4,
      imageUrl: Images.pasta2,
    ),
    CuisinesModel(
      name: "soup",
      id: 5,
      imageUrl: Images.soup,
    ),
    CuisinesModel(
      name: "chicken",
      id: 6,
      imageUrl: Images.chicken,
    ),
    CuisinesModel(
      name: "biriyani",
      id: 7,
      imageUrl: Images.biriyani,
    ),
    CuisinesModel(
      name: "kabab",
      id: 8,
      imageUrl: Images.kabab,
    ),
  ];

  @override
  void dispose() {
    super.dispose();
    search.dispose();
  }
}
