import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commonmodule/app_color.dart';
import '../../commonmodule/app_string.dart';
import '../controllers/product_controller.dart';

class ProductListView extends StatelessWidget {
  ProductListView({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppString.productList,
        ),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: productController.productList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        margin: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            productController.productList[index].productLink,
                            width: 150,
                            height: 100,
                            fit: BoxFit.fill,
                            color: AppColor.purpleColor,
                            colorBlendMode: BlendMode.color,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productController.productList[index].name,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            // Text(
                            //   productController.productList[index].description,
                            //   style: const TextStyle(
                            //     fontSize: 10,
                            //   ),
                            // ),
                            Text(
                              productController.productList[index].brand,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: AppColor.grey200,
                    height: 2,
                  )
                ],
              );
            },
          );
        }
      }),
    );
  }
}
