class Book {
  final String id;
  final String title;
  final String author;
  final double rating;
  final String category;
  final String description;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.rating,
    required this.category,
    required this.description,
  });

  Book copyWith({
    String? id,
    String? title,
    String? author,
    double? rating,
    String? category,
    String? description,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      rating: rating ?? this.rating,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }
}
