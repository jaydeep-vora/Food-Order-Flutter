import 'package:flutter/material.dart';
import 'package:flutter_animation/resource/AppColors.dart';
import 'package:flutter_animation/utils/SizeUtils.dart';
import 'package:get/get.dart';

class RestaurantDetailNavigation extends StatefulWidget {
  @override
  _RestaurantDetailNavigationState createState() =>
      _RestaurantDetailNavigationState();
}

class _RestaurantDetailNavigationState
    extends State<RestaurantDetailNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          top: false,
          bottom: false,
          child: Container(
            child: Stack(
              children: <Widget>[
                Image.network(
                  "https://b.zmtcdn.com/data/pictures/chains/9/3800929/5eccc92c862900b7655250cd8358bd13.jpg",
                  height: getSize(200),
                  fit: BoxFit.cover,
                ),
                SafeArea(
                  bottom: false,
                  child: Column(
                    children: <Widget>[
                      _topNavigation(),
                      Container(
                        color: Colors.transparent,
                        height: getSize(86),
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Colors.white,
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                            margin: EdgeInsets.only(top: 30),
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Burger Story",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .copyWith(fontSize: getSize(35)),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(getSize(12)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      _showCaseView(
                                          "assets/icons/ic_scooter.png",
                                          "Free"),
                                      _showCaseView("assets/icons/ic_clock.png",
                                          "25-30 min"),
                                      _showCaseView(
                                          "assets/icons/ic_star.png", "4.7")
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  height: 4,
                                  color: AppColors.bgGrey,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.menu,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                        child: Container(
                                      height: getSize(50),
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: <Widget>[
                                          _dishType("Popular", true),
                                          _dishType("Burger", false),
                                          _dishType("Steak", false),
                                          _dishType("Salads", false)
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                                Expanded(
                                    child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: GridView.count(
                                    childAspectRatio: getSize(0.74),
                                    padding: EdgeInsets.only(bottom: 12),
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    crossAxisCount: 2,
                                    children: <Widget>[
                                      _dishCell(
                                          "https://i2.wp.com/freepngimages.com/wp-content/uploads/2016/11/bacon-burger.png?fit=895%2C895",
                                          "Classic burger",
                                          "295g",
                                          "₹ 245"),
                                      _dishCell(
                                          "http://www.pngall.com/wp-content/uploads/2/Healthy-Meal-PNG.png",
                                          "Pesto Salad",
                                          "350g",
                                          "₹ 150"),
                                      _dishCell(
                                          "http://www.pngall.com/wp-content/uploads/2/Meal-PNG-Photo.png",
                                          "Grilled Chicken",
                                          "350g",
                                          "₹ 150"),
                                      _dishCell(
                                          "http://www.pngall.com/wp-content/uploads/2/Meal-PNG-Free-Download.png",
                                          "Beef Falafel",
                                          "350g",
                                          "₹ 150"),
                                    ],
                                  ),
                                )),
                                SizedBox(
                                  height: 12,
                                )
                              ],
                            )),
                      )),
                    ],
                  ),
                ),
                Positioned(
                    height: getSize(100),
                    width: getSize(100),
                    top: getSize(125),
                    left: (Get.width / 2) - getSize(50),
                    child: Card(
                      shadowColor: Colors.grey.withOpacity(0.2),
                      elevation: 18.0,
                      shape: CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: getSize(50.0),
                        child: Image.network(
                          "https://logospng.org/download/burger-king/logo-burger-king-512.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
              ],
            ),
          )),
    );
  }

  Widget _topNavigation() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.all(getSize(10)),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: getSize(20),
                )),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            padding: EdgeInsets.all(10),
            child: Image.asset(
              "assets/icons/ic_more.png",
              width: getSize(20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dishCell(String image, String name, String quantity, String price) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.textGrey.withOpacity(0.2),
                  offset: Offset(0, 2),
                  spreadRadius: 2,
                  blurRadius: 15)
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 8),
              child: Image.network(image),
            ),
            Text(
              name,
              style:
                  Theme.of(context).textTheme.headline2.copyWith(fontSize: 16),
            ),
            Text(
              quantity,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(fontSize: 13, color: AppColors.textGrey),
            ),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: AppColors.bgGrey,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(
                  price,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _dishType(String type, bool isSelected) {
    return Container(
        height: 50,
        margin: EdgeInsets.only(top: 2, bottom: 2, right: 14),
        padding: EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: isSelected ? AppColors.bgGrey : Colors.transparent),
        child: Center(
          child: Text(
            type,
            style: Theme.of(context)
                .textTheme
                .headline2
                .copyWith(fontSize: getSize(18)),
          ),
        ));
  }

  Widget _showCaseView(String image, String text) {
    return Container(
      height: getSize(45),
      padding: EdgeInsets.only(left: 12, right: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 1),
                spreadRadius: 5,
                blurRadius: 15,
                color: Colors.grey.withOpacity(0.15))
          ],
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: <Widget>[
          Image.asset(
            image,
            color: AppColors.orange,
            width: getSize(24),
          ),
          SizedBox(width: 8),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline2
                .copyWith(fontSize: getSize(16)),
          ),
        ],
      ),
    );
  }
}
