class AllProductsResponse {
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;

  AllProductsResponse(this.id, this.title, this.price, this.description,
      this.category, this.image);

  AllProductsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
    };
  }

  factory AllProductsResponse.fromMap(Map<String, dynamic> map) {
    return AllProductsResponse(
      map['id'],
      map['title'],
      map['price'],
      map['description'],
      map['category'],
      map['image'],
    );
  }
}
