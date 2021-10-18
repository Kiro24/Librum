import 'package:flutter/cupertino.dart';
import 'package:librum/models/book.dart';

class BookManager extends ChangeNotifier {
  final _books = <Book>[];

  int _selectedIndex = -1;

  List<Book> get books => List.unmodifiable(_books);
  int get selectedIndex => _selectedIndex;
  Book? get selectedBook =>
      _selectedIndex == -1 ? null : _books[_selectedIndex];

  void bookTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void addBookToFavorite(int index) {}
}
