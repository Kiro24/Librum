import 'dart:math';

import 'package:flutter/material.dart';
import 'package:librum/ui/book_card.dart';
import 'package:librum/librum_theme.dart';
import 'package:librum/navigation/librum_pages.dart';
import 'package:librum/ui/book_details_screen.dart';
import 'package:provider/provider.dart';
import '../../network/service_interface.dart';

import 'package:chopper/chopper.dart';
import '../../network/model_response.dart';
import '../../network/book_model.dart';
import 'package:flutter/services.dart';
import '../data/models/book.dart';

class Home extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: LibrumPages.home,
      key: ValueKey(LibrumPages.home),
      child: const Home(),
    );
  }

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

const String title = "Explore thousands of books on the go";
const String subtitle = "Famous Books";
const String searchBar = "Search for books...";

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController searchTextController;

  List<APIItems> currentSearchList = [];
  int currentCount = 0;
  int currentStartPosition = 0;
  int currentEndPosition = 20;
  int pageCount = 20;
  bool hasMore = false;
  bool loading = false;
  bool inErrorState = false;
  List<String> previousSearches = <String>[];

  @override
  void initState() {
    super.initState();
    searchTextController = TextEditingController(text: '');
    _scrollController.addListener(() {
      final triggerFetchMoreSize =
          0.7 * _scrollController.position.maxScrollExtent;

      if (_scrollController.position.pixels > triggerFetchMoreSize) {
        if (hasMore &&
            currentEndPosition < currentCount &&
            !loading &&
            !inErrorState) {
          setState(() {
            loading = true;
            currentStartPosition = currentEndPosition;
            currentEndPosition =
                min(currentStartPosition + pageCount, currentCount);
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    searchTextController.dispose();
    super.dispose();
  }

  Widget _buildBookCard(
      BuildContext topLevelContext, List<APIItems> items, int index) {
    final itemWidth = MediaQuery.of(context).size.width;

    final book = items[index].book;
    return GestureDetector(
      onTap: () {
        Navigator.push(topLevelContext, MaterialPageRoute(
          builder: (context) {
            final Book detailBook = Book(
                title: book.title,
                authors: book.authors,
                categories: book.categories,
                rating: book.averageRating,
                image: book.imageLinks!.smallThumbnail,
                description: book.description);

            return BookDetails(book: detailBook);
          },
        ));
      },
      child: bookCard(book, itemWidth),
    );
  }

  Widget _buildBookLoader(BuildContext context) {
    if (searchTextController.text.length < 3) {
      return Container();
    }

    return FutureBuilder<Response<Result<APIBookQuery>>>(
      future: Provider.of<ServiceInterface>(context)
          .queryBooks(searchTextController.text.trim()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString(),
                  textAlign: TextAlign.center, textScaleFactor: 1.3),
            );
          }

          loading = false;

          final result = snapshot.data?.body;

          if (result is Error) {
            // Hit an error
            inErrorState = true;
            return _buildBookList(context, currentSearchList);
          }

          final query = (result as Success).value;

          inErrorState = false;
          if (query != null) {
            currentSearchList.addAll(query.items);
          }
          return _buildBookList(context, currentSearchList);
        } else {
          if (currentCount == 0) {
            // Show a loading indicator while waiting for the recipes
            return const Center(child: CircularProgressIndicator());
          } else {
            return _buildBookList(context, currentSearchList);
          }
        }
      },
    );
  }

  Widget _buildBookList(BuildContext bookListContext, List<APIItems> items) {
    return Flexible(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildBookCard(bookListContext, items, index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: LibrumTheme.lightTextTheme.headline1,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Material(
              elevation: 18,
              shadowColor: Colors.grey,
              borderRadius: const BorderRadius.all(Radius.circular(100.0)),
              child: TextField(
                controller: searchTextController,
                onSubmitted: (value) {
                  startSearch(value);
                },
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0)),
                    hintText: searchBar,
                    prefixIcon: const Icon(Icons.search_rounded)),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              subtitle,
              style: LibrumTheme.lightTextTheme.headline2,
            ),
            const SizedBox(
              height: 20.0,
            ),
            _buildBookLoader(context),
          ],
        ),
      )),
    );
  }

  void startSearch(String value) {
    setState(() {
      currentSearchList.clear();
      currentCount = 0;
      currentEndPosition = pageCount;
      currentStartPosition = 0;
      hasMore = true;
      value = value.trim();
      if (!previousSearches.contains(value)) {
        previousSearches.add(value);
      }
    });
  }
}


// //TODO: remove Expanded w/o causing errors
//                 Expanded(
//                   child: ListView.separated(
//                     itemCount: 4,
//                     itemBuilder: (context, index) {
//                       final book = manager.books[index];
//                       return InkWell(
//                         child: BookCard(
//                           key: Key(book.id),
//                           book: book,
//                         ),
//                         onTap: () {
//                           manager.bookTapped(index);
//                         },
//                       );
//                     },
//                     separatorBuilder: (context, index) {
//                       return const SizedBox(height: 16.0);
//                     },
//                   ),
//                 ),