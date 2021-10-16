import 'package:flutter/cupertino.dart';
import 'package:librum/models/book.dart';

class BookManager extends ChangeNotifier {
  final _books = <Book>[
    Book(
        id: '0',
        title: 'Grokking Algorithms',
        author: 'Author I',
        rating: 4.5,
        category: 'Code',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi venenatis sodales mi, nec efficitur mauris venenatis id. Sed tortor ipsum, faucibus ut tortor a, facilisis pellentesque odio. Proin dictum pellentesque massa, et aliquet tellus maximus ut. Proin sagittis nibh in risus volutpat, nec congue nibh porta. Donec pharetra nunc magna, sed imperdiet purus dictum a. Proin vulputate, felis congue consequat suscipit, lectus diam interdum dui, at vehicula nunc nisi eget lectus. Sed semper nulla sit amet pharetra auctor. Nulla fringilla sem et nulla pretium maximus. Suspendisse ultricies lacus felis, a accumsan sapien imperdiet sed. Pellentesque nisl purus, pellentesque vel nibh sit amet, suscipit dapibus eros. Praesent facilisis sollicitudin mauris a efficitur. In quis diam ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget ultrices velit.\nEtiam velit enim, rutrum vitae velit mollis, efficitur luctus nunc. Curabitur vel libero ut risus blandit aliquam. Vestibulum lorem metus, sodales et blandit in, tempus ac metus. Proin bibendum turpis tellus, ac finibus lacus rhoncus sit amet. Maecenas eu laoreet elit. Curabitur a egestas augue. Nullam eget metus vel magna sagittis faucibus in vel nisi. Praesent nibh arcu, rhoncus vel ornare vel, gravida sed libero. Fusce vel tortor nec sem laoreet imperdiet id in dolor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\nMorbi viverra ac enim ut laoreet. Cras sagittis volutpat massa, non rutrum neque efficitur ac. Donec tortor lacus, facilisis id lorem quis, gravida tincidunt ante. Donec sit amet massa in purus pretium luctus. Phasellus lobortis lacus a urna mollis, vulputate rhoncus ex placerat. Vivamus lorem erat, dapibus sed massa quis, auctor pellentesque lacus. Mauris porttitor, metus sed feugiat malesuada, metus dui congue neque, ac lobortis dolor lacus tincidunt leo. Cras tristique fringilla sollicitudin. Nulla ultrices, risus ac tristique pulvinar, urna nunc egestas neque, vitae accumsan purus nisl in nulla. Mauris a neque in turpis mattis consequat.'),
    Book(
        id: '1',
        title: 'Clean Code',
        author: 'Author II',
        rating: 4,
        category: 'Code',
        description: 'Lorem ipsum dolor sit amet'),
    Book(
        id: '2',
        title: 'Pragmatic Programmer',
        author: 'Author I',
        rating: 3.5,
        category: 'Code',
        description: 'Lorem ipsum dolor sit amet'),
    Book(
        id: '3',
        title: 'Pragmatic Programmer I',
        author: 'Author II',
        rating: 3.5,
        category: 'Code',
        description: 'Lorem ipsum dolor sit amet'),
    Book(
        id: '4',
        title: 'Pragmatic Programmer IV',
        author: 'Author I',
        rating: 3.5,
        category: 'Code',
        description: 'Lorem ipsum dolor sit amet'),
  ];

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
