import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/Model/Dish.dart';
import 'package:flutter_animation/Model/Restaurant.dart';
import 'package:flutter_animation/View/Home/RestaurantDetailNavigation.dart';
import 'package:flutter_animation/resource/AppColors.dart';
import 'package:flutter_animation/utils/DataHelper.dart';
import 'package:get/get.dart';

class DashboardNavigation extends StatefulWidget {
  @override
  _DashboardNavigationState createState() => _DashboardNavigationState();
}

class _DashboardNavigationState extends State<DashboardNavigation> {
  var selectedDish = 0.obs;

  List<Dish> dishes = DataHelper.getDishes();
  List<Restaurant> restaurants = DataHelper.getRestaurants();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Refreshed");
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          bottom: false,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                _topNavigation(),
                SizedBox(height: 30),
                Expanded(
                    child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Main\nCategories",
                        style: Theme.of(context).textTheme.headline2.copyWith(
                            fontSize: 30,
                            color: AppColors.primaryTextColor,
                            height: 1.2),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      height: 144,
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: 20),
                        itemBuilder: (context, index) {
                          return Obx(() => InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () => selectedDish.value = index,
                                child: _dishTypeCell(
                                    selectedDish.value == index, dishes[index]),
                              ));
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: dishes.length,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Get.to(RestaurantDetailNavigation());
                              },
                              child: _restaurantCell(restaurants[index]));
                        },
                        itemCount: restaurants.length,
                      ),
                    ),
                    SizedBox(height: 12),
                  ],
                ))
              ],
            ),
          )),
    );
  }

  Widget _topNavigation() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/icons/ic_settings.png",
            width: 24,
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.bgGrey),
                child: Center(
                  child: Text(
                    "Surat, Gujarat",
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(fontSize: 15),
                  ),
                )),
          ),
          Image.asset(
            "assets/icons/ic_search.png",
            width: 24,
          ),
        ],
      ),
    );
  }

  Widget _dishTypeCell(bool isSelected, Dish dish) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? AppColors.orange : Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 2),
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 12)
          ],
          borderRadius: BorderRadius.circular(35)),
      margin: EdgeInsets.only(right: 16, bottom: 12, top: 12),
      width: 70,
      child: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  color: isSelected ? Colors.white : AppColors.bgGrey),
              margin: EdgeInsets.all(8),
              height: 54,
              width: 54,
              child: Center(
                child: Text(
                  dish.icon,
                  style: TextStyle(fontSize: 28),
                ),
              )),
          SizedBox(
            height: 6,
          ),
          Text(
            dish.name,
            style: Theme.of(context).textTheme.headline2.copyWith(
                fontSize: 13,
                color: isSelected ? Colors.white : AppColors.primaryTextColor),
          )
        ],
      ),
    );
  }

  Widget _restaurantCell(Restaurant restaurant) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: AppColors.bgGrey,
                borderRadius: BorderRadius.circular(30)),
            child: Image.network(
              restaurant.image,
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            restaurant.name,
            style: Theme.of(context).textTheme.headline1.copyWith(
                fontSize: 20, color: AppColors.primaryTextColor, height: 1.2),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset("assets/icons/ic_star.png", width: 16),
                  SizedBox(width: 4),
                  Container(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      restaurant.rating.toString(),
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: 13, color: AppColors.primaryTextColor),
                    ),
                  )
                ],
              ),
              SizedBox(width: 6),
              Container(
                padding: EdgeInsets.only(top: 2),
                child: Text(
                  restaurant.special,
                  style: Theme.of(context).textTheme.headline1.copyWith(
                      fontSize: 13, color: AppColors.primaryTextColor),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 2),
                child: Text(
                  restaurant.cost,
                  style: Theme.of(context).textTheme.headline1.copyWith(
                      fontSize: 13, color: AppColors.primaryTextColor),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
