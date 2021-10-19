import 'dart:core';
import 'dart:async';

import 'repository.dart';

import 'models/book.dart';

class MemoryRepository extends Repository {
  final List<Book> _currentBooks = <Book>[];

  Stream<List<Book>>? _bookStream;
  final StreamController _bookStreamController = StreamController<List<Book>>();

  @override
  Stream<List<Book>> watchAllBook() {
    _bookStream ??= _bookStreamController.stream as Stream<List<Book>>;
    return _bookStream!;
  }

  @override
  Future<List<Book>> findAllBooks() {
    return Future.value(_currentBooks);
  }

  @override
  Future<Book> findBookById(int id) {
    return Future.value(_currentBooks.firstWhere((book) => book.id == id));
  }

  @override
  Future<int> insertBook(Book book) {
    _currentBooks.add(book);

    _bookStreamController.sink.add(_currentBooks);

    return Future.value(0);
  }

  @override
  Future<void> deleteBook(Book book) {
    _currentBooks.remove(book);
    _bookStreamController.sink.add(_currentBooks);

    return Future.value();
  }

  @override
  Future init() {
    return Future.value();
  }

  @override
  void close() {
    _bookStreamController.close();
  }
}
