import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/View/Auth/RegisterNavigation.dart';
import 'package:flutter_animation/resource/AppColors.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:get/get.dart';

class SpalshNavigation extends StatefulWidget {
  @override
  _SpalshNavigationState createState() => _SpalshNavigationState();
}

class _SpalshNavigationState extends State<SpalshNavigation>
    with TickerProviderStateMixin {
  GifController controller;

  @override
  void initState() {
    super.initState();
    controller = GifController(vsync: this);
    controller.repeat(min: 0, max: 300, period: Duration(seconds: 15));
    fetchGif(AssetImage("assets/animation/splash_bg.gif"));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            GifImage(
                width: double.infinity,
                height: double.infinity,
                repeat: ImageRepeat.repeat,
                fit: BoxFit.fill,
                controller: controller,
                image: AssetImage("assets/animation/splash_bg.gif")),
            Container(color: Colors.black45),
            SafeArea(
              child: Container(
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Welcome to Food Delivery App",
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(fontSize: 30, color: Colors.white)),
                    SizedBox(
                      height: 12,
                    ),
                    Text("Enjoy deliviries from a variety restaurants",
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(fontSize: 14, color: Colors.white)),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/icons/apple.png",
                            width: 22,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 4),
                            child: Text("Continue with Apple",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(fontSize: 14)),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(RegisterNavigation());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.orange,
                            borderRadius: BorderRadius.circular(16)),
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.only(top: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 4),
                              child: Text("Continue with phone",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .copyWith(
                                          fontSize: 14, color: Colors.white)),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
