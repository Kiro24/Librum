// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIBookQuery _$APIBookQueryFromJson(Map<String, dynamic> json) => APIBookQuery(
      kind: json['kind'] as String,
      totalItems: json['totalItems'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => APIItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$APIBookQueryToJson(APIBookQuery instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'totalItems': instance.totalItems,
      'items': instance.items,
    };

APIItems _$APIItemsFromJson(Map<String, dynamic> json) => APIItems(
      book: APIBook.fromJson(json['volumeInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$APIItemsToJson(APIItems instance) => <String, dynamic>{
      'volumeInfo': instance.book,
    };

APIBook _$APIBookFromJson(Map<String, dynamic> json) => APIBook(
      title: json['title'] as String,
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      imageLinks: json['imageLinks'] == null
          ? null
          : APIImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$APIBookToJson(APIBook instance) => <String, dynamic>{
      'title': instance.title,
      'authors': instance.authors,
      'description': instance.description,
      'categories': instance.categories,
      'averageRating': instance.averageRating,
      'imageLinks': instance.imageLinks,
    };

APIImageLinks _$APIImageLinksFromJson(Map<String, dynamic> json) =>
    APIImageLinks(
      smallThumbnail: json['smallThumbnail'] as String,
    );

Map<String, dynamic> _$APIImageLinksToJson(APIImageLinks instance) =>
    <String, dynamic>{
      'smallThumbnail': instance.smallThumbnail,
    };

APIAuthor _$APIAuthorFromJson(Map<String, dynamic> json) => APIAuthor(
      name: json['name'] as String,
    );

Map<String, dynamic> _$APIAuthorToJson(APIAuthor instance) => <String, dynamic>{
      'name': instance.name,
    };

APICategory _$APICategoryFromJson(Map<String, dynamic> json) => APICategory(
      type: json['type'] as String,
    );

Map<String, dynamic> _$APICategoryToJson(APICategory instance) =>
    <String, dynamic>{
      'type': instance.type,
    };
