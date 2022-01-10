import 'dart:convert';

class BookModel {
  String id;
  String title;
  String description;
  String subtitle;
  String author;
  String bookImageUrl;
  String price;
  String address;
  BookModel({
    required this.title,
    required this.id,
    required this.description,
    required this.subtitle,
    required this.author,
    required this.bookImageUrl,
    required this.price,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'subtitle': subtitle,
      'author': author,
      'bookImageUrl': bookImageUrl,
      'price': price,
      'address': address,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      subtitle: map['subtitle'] ?? '',
      author: map['author'] ?? '',
      bookImageUrl: map['bookImageUrl'] ?? '',
      price: map['price'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) => BookModel.fromMap(json.decode(source));
}
 