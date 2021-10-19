import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Book extends Equatable {
  int? id;
  final String? title;
  final List<String>? authors;
  final List<String>? categories;
  final String? description;
  final double? rating;
  final String? image;

  Book({
    this.id,
    this.title,
    this.authors,
    this.description,
    this.categories,
    this.rating,
    this.image,
  });

  @override
  List<Object?> get props => [
        title,
        authors,
        categories,
        description,
        rating,
        image,
      ];
}
