// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:asroo/logic/controller/product_controller.dart';
import 'package:asroo/models/product_model.dart';

import '../../core/utils/colors_manger.dart';

class CustomCard extends StatelessWidget {
  CustomCard({Key? key, this.product}) : super(key: key);
  final ProductsController controller = Get.put(ProductsController());

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    if (controller.isLoading.value) {
      return const Center(
            child: CircularProgressIndicator(
              color: mainColor,
            ),
          );
    } else {
      return Card(
            child: Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: 160,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.favorite_border,
                            size: 20,
                          ),
                        ),
                        Text(
                          '${product?.title?.substring(0, 6)}',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.add,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      '${product?.image}',
                      fit: BoxFit.fill,
                      height: 140,
                      width: 140,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 25,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: mainColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('${product?.rating?.rate}'),
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 5,top: 5),
                            height: 25,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: mainColor,
                            ),
                            child: Text(r'$' '${product?.price}'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
    }
  }
}
