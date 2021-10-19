import 'dart:core';
import 'package:flutter/foundation.dart';

import 'repository.dart';

import 'models/book.dart';

class MemoryRepository extends Repository with ChangeNotifier {
  final List<Book> _currentBooks = <Book>[];

  @override
  List<Book> findAllBooks() {
    return _currentBooks;
  }

  @override
  Book findBookById(int id) {
    return _currentBooks.firstWhere((book) => book.id == id);
  }

  @override
  int insertBook(Book book) {
    _currentBooks.add(book);

    notifyListeners();

    return 0;
  }

  @override
  void deleteBook(Book book) {
    _currentBooks.remove(book);

    notifyListeners();
  }

  @override
  Future init() {
    return Future.value(null);
  }

  @override
  void close() {}
}
