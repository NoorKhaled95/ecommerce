import 'package:dio/dio.dart';
import 'package:maan_application_2/ui/new_product/models/add_product_model.dart';

class AddNewProductApiHelper {
  AddNewProductApiHelper._();
  static AddNewProductApiHelper apiHelper = AddNewProductApiHelper._();
  addNewProduct(AddNewProductRequest request) async {
    String url = 'https://fakestoreapi.com/products';
    Response response = await Dio().post(url, data: request.toMap());
    print(response.data);
  }

  updateProduct(AddNewProductRequest request, int productId) async {}
  deleteProduct(int productId) async {}
}
