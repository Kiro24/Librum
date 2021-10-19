import './models/book.dart';

abstract class Repository {
  List<Book> findAllBooks();

  Book findBookById(int id);

  int insertBook(Book book);

  void deleteBook(Book book);

  Future init();

  void close();
}
