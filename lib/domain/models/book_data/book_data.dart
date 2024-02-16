import 'dart:convert';

BookData? bookDataFromJson(String str) => BookData.fromJson(json.decode(str));

String bookDataToJson(BookData? data) => json.encode(data!.toJson());

class BookData {
  BookData({this.error, this.total, this.page, this.bookDetails, this.title});

  final String? error;
  final String? total;
  final String? page;
  final List<BookDetail>? bookDetails;
  final String? title;

  factory BookData.fromJson(Map<String, dynamic> json) => BookData(
      error: (json["error"]),
      total: (json["total"]),
      page: (json["page"]),
      bookDetails: List<BookDetail>.from(
          json["books"].map((x) => BookDetail.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "error": error,
        "total": total,
        "page": page,
        "books": List<dynamic>.from(bookDetails!.map((x) => x.toJson())),
        "title": title
      };
}

class BookDetail {
  BookDetail(
      {this.title,
      this.subtitle,
      this.isbn13,
      this.price,
      this.image,
      this.url});

  final String? title;
  final String? subtitle;
  final String? isbn13;
  final String? price;
  final String? image;
  final String? url;

  factory BookDetail.fromJson(Map<String, dynamic> json) => BookDetail(
        title: json["title"],
        subtitle: json["subtitle"],
        isbn13: json["isbn13"],
        price: json["price"],
        image: json["image"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "isbn13": isbn13,
        "price": price,
        "image": image,
        "url": url,
      };
}
