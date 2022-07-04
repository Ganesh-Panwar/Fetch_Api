import 'package:http/http.dart' as http;
import '../productmodule/models/product_models.dart';

class ApiService {
  var client = http.Client();

  Future<List<ProductModel>> fetchProducts() async {
    var response = await client.get(
      Uri.parse(
          "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return productFromJson(jsonString);
    }
    return fetchProducts();
  }
}
