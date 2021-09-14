import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maan_application_2/ui/new_product/data/add_new_product_api_helper.dart';
import 'package:maan_application_2/ui/new_product/models/add_product_model.dart';

class AddNewProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Add Product'),
          onPressed: () {
            AddNewProductRequest request = AddNewProductRequest(
                title: 'title',
                price: 50,
                description: 'description',
                image: 'image',
                category: 'category');
            AddNewProductApiHelper.apiHelper.addNewProduct(request);
          },
        ),
      ),
    );
  }
}
