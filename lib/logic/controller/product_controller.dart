// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:asroo/services/product_service.dart';

class ProductsController extends GetxController {
  RxBool isLoading = true.obs;
  RxList productsList = [].obs;

void getProducts() async {
    try{
    isLoading(true);
    var products = await ProductService().getProduct();
    if (products != null) {
      productsList.value = products;
    }
  } finally {
  isLoading(false);
  }

  }

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }
}
