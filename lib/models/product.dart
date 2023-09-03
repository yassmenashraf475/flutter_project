class Product {
  late final int id;
  final String title;
  final String description;
  final int price;
  final dynamic discountPercentage;
  final dynamic rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List images;

  Product(
      {required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.discountPercentage,
        required this.rating,
        required this.stock,
        required this.brand,
        required this.category,
        required this.thumbnail,
        required this.images});

  static List<Product> convertToProducts(List products) {
    List<Product> productsList = [];
    for (var product in products) {
      if(product["id"]==null||product["title"]==null||product["description"]==null||
          product["price"]==null||product["discountPercentage"]==null||product["rating"]==null||
          product["stock"]==null||product["brand"]==null||product["category"]==null||
          product["thumbnail"]==null||product["images"]==null
      ){
        continue;
      }
      productsList.add(Product(
        id: product["id"],
        title: product["title"],
        description: product["description"],
        price: product["price"],
        discountPercentage:product["discountPercentage"] ,
        rating:product["rating"] ,
        stock: product["stock"],
        brand:product["brand"] ,
        category: product["category"],
        thumbnail: product["thumbnail"],
        images: product["images"],
      ));
    }
    return productsList;
  }
}