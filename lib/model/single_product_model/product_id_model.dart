class ProductIdModel {
  final int productId;
  ProductIdModel({
    required this.productId,
  });
}

// class ProductIdModel {
//     ProductIdModel({
//         required this.productId,
//         required this.title,
//         required this.price,
//         required this.description,
//         required this.category,
//         required this.image,
//         required this.rating,
//     });

//     int productId;
//     String title;
//     int price;
//     String description;
//     String category;
//     String image;
//     Rating rating;

//     factory ProductIdModel.fromJson(Map<String, dynamic> json) => ProductIdModel(
//         productId: json["id"],
//         title: json["title"],
//         price: json["price"],
//         description: json["description"],
//         category: json["category"],
//         image: json["image"],
//         rating: Rating.fromJson(json["rating"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": productId,
//         "title": title,
//         "price": price,
//         "description": description,
//         "category": category,
//         "image": image,
//         "rating": rating.toJson(),
//     };
// }

// class Rating {
//     Rating({
//         required this.rate,
//         required this.count,
//     });

//     double rate;
//     int count;

//     factory Rating.fromJson(Map<String, dynamic> json) => Rating(
//         rate: json["rate"]?.toDouble(),
//         count: json["count"],
//     );

//     Map<String, dynamic> toJson() => {
//         "rate": rate,
//         "count": count,
//     };
// }
