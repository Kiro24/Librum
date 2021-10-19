import './models/book.dart';

abstract class Repository {
  Future<List<Book>> findAllBooks();
  Stream<List<Book>> watchAllBook();

  Future<Book> findBookById(int id);

  Future<int> insertBook(Book book);

  Future<void> deleteBook(Book book);

  Future init();

  void close();
}
