class ProductModel {
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;
  bool isFav;
  bool isCart;

  ProductModel(this.id, this.title, this.price, this.description, this.category,
      this.image, this.isFav, this.isCart);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'isFav': isFav,
      'isCart': isCart,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      map['id'],
      map['title'],
      map['price'],
      map['description'],
      map['category'],
      map['image'],
      map['isFav'],
      map['isCart'],
    );
  }
}
