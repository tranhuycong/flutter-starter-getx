import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("home.title".tr)),
    );
  }
}
