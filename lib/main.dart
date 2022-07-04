import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../commonmodule/app_color.dart';
import '../commonmodule/app_string.dart';
import 'productmodule/views/product_list_views.dart';

void main() {
  // MyAppControllerBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.fetchApiData,
      theme: ThemeData(
        primarySwatch: AppColor.purpleColor,
      ),
      home: ProductListView(),
    );
  }
}
