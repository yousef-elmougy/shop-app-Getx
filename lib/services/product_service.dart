// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:asroo/models/product_model.dart';

class ProductService {
   Future<dynamic> getProduct() async {
    http.Response respons = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );
    if (respons.statusCode == 200) {
      var data = respons.body;
      return productModelsFromJson(data);
    } else {
      throw Exception('faild to load product');
    }
  }
}
