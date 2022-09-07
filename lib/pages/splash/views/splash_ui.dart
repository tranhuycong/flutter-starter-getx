import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashUI extends StatelessWidget {
  const SplashUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (splashController) {
          return Scaffold(
            body: Center(
              child: Text("splash.title".tr),
            ),
          );
        });
  }
}
