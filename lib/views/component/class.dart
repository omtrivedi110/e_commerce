class Product {
  final String title;
  final String descprition;
  final String brand;
  final String category;
  final String thumbnail;
  final int price;
  final int id;
  int quantity = 1;

  Product({
    required this.descprition,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.price,
    required this.id,
    required this.title,
    this.quantity = 1,
  });

  factory Product.fromMap({required Map data}) {
    return Product(
        descprition: data['description'],
        brand: data['brand'],
        category: data['category'],
        thumbnail: data['thumbnail'],
        price: data['price'],
        id: data['id'],
        title: data['title'],
        quantity: 1);
  }
}

// class CartProduct {
//   final String title;
//   final String descprition;
//   final String brand;
//   final String category;
//   final String thumbnail;
//   final int price;
//   final int id;
//
//   CartProduct({
//     required this.descprition,
//     required this.brand,
//     required this.category,
//     required this.thumbnail,
//     required this.price,
//     required this.id,
//     required this.title,
//   });
//
//   factory CartProduct.fromMap({required Map data}) {
//     return CartProduct(
//         descprition: data['description'],
//         brand: data['brand'],
//         category: data['category'],
//         thumbnail: data['thumbnail'],
//         price: data['price'],
//         id: data['id'],
//         title: data['title']);
//   }
// }

class MyRoutes {
  static String likedpage = "likepage";
  static String ProductDetail = "ProductDetailPage";
  static String AddedCartPage = "AddedCartPage";
  static String PersonalDetail = "PersonalDetailPage";
  static String PdfPage = "PdfPage";
}
