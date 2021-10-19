import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class APIBookQuery {
  factory APIBookQuery.fromJson(Map<String, dynamic> json) =>
      _$APIBookQueryFromJson(json);

  Map<String, dynamic> toJson() => _$APIBookQueryToJson(this);

  String kind;
  int totalItems;
  List<APIItems> items;

  APIBookQuery({
    required this.kind,
    required this.totalItems,
    required this.items,
  });
}

@JsonSerializable()
class APIItems {
  @JsonKey(name: 'volumeInfo')
  APIBook book;

  APIItems({
    required this.book,
  });

  factory APIItems.fromJson(Map<String, dynamic> json) =>
      _$APIItemsFromJson(json);
  Map<String, dynamic> toJson() => _$APIItemsToJson(this);
}

@JsonSerializable()
class APIBook {
  String title;
  List<String>? authors;
  String? description;
  List<String>? categories;
  double? averageRating;
  APIImageLinks? imageLinks;

  APIBook({
    required this.title,
    required this.authors,
    required this.description,
    required this.categories,
    required this.averageRating,
    required this.imageLinks,
  });

  factory APIBook.fromJson(Map<String, dynamic> json) =>
      _$APIBookFromJson(json);
  Map<String, dynamic> toJson() => _$APIBookToJson(this);
}

@JsonSerializable()
class APIImageLinks {
  String smallThumbnail;

  APIImageLinks({
    required this.smallThumbnail,
  });

  factory APIImageLinks.fromJson(Map<String, dynamic> json) =>
      _$APIImageLinksFromJson(json);
  Map<String, dynamic> toJson() => _$APIImageLinksToJson(this);
}

@JsonSerializable()
class APIAuthor {
  String name;

  APIAuthor({
    required this.name,
  });

  factory APIAuthor.fromJson(Map<String, dynamic> json) =>
      _$APIAuthorFromJson(json);
  Map<String, dynamic> toJson() => _$APIAuthorToJson(this);
}

@JsonSerializable()
class APICategory {
  String type;

  APICategory({
    required this.type,
  });

  factory APICategory.fromJson(Map<String, dynamic> json) =>
      _$APICategoryFromJson(json);
  Map<String, dynamic> toJson() => _$APICategoryToJson(this);
}
