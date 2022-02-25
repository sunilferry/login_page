import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/helpers/colors/app_colors.dart';
/**
 *Developed by Suneel kumar 16-02-2022
 */

class Background extends StatelessWidget {
  Widget? child;

  Background({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      decoration:const  BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/wallpaper2.jpg'),
        ),

      ),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
                colors: [
                  kPrimaryColor,

                  kPrimaryColor,
                  kPrimaryColor.withOpacity(0.2),
                ]
            )
        ),
        child: child,
      ),
    );
  }
}
