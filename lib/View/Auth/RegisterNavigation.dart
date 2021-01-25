import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animation/View/Home/DashboardNavigation.dart';
import 'package:flutter_animation/resource/AppColors.dart';
import 'package:get/get.dart';

class RegisterNavigation extends StatefulWidget {
  @override
  _RegisterNavigationState createState() => _RegisterNavigationState();
}

class _RegisterNavigationState extends State<RegisterNavigation> {
  var controller = TextEditingController();

  var isEmpty = true.obs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: 45,
              height: 45,
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Enter your mobile number",
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(fontSize: 30, height: 1.2)),
          SizedBox(
            height: 12,
          ),
          Text("We will send you a confirmation code",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(fontSize: 14, color: AppColors.textGrey)),
          Row(
            children: <Widget>[
              Text("+91 ",
                  style: Theme.of(context).textTheme.headline1.copyWith(
                      fontSize: 35, color: AppColors.primaryTextColor)),
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: (value) {
                    isEmpty.value = value.length < 10;
                  },
                  inputFormatters: [
                    WhitelistingTextInputFormatter(RegExp("[ 0-9]"))
                  ],
                  keyboardType: TextInputType.phone,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: 35),
                  showCursor: false,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "00000 00000"),
                ),
              ),
            ],
          ),
          Expanded(child: Container()),
          Obx(() => Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Get.offAll(DashboardNavigation());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color:
                            isEmpty.value ? AppColors.bgGrey : AppColors.orange,
                        borderRadius: BorderRadius.circular(16)),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text("Next",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(
                                      fontSize: 16,
                                      color: isEmpty.value
                                          ? AppColors.textGrey
                                          : Colors.white)),
                        )
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    )));
  }
}
