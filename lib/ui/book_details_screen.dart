import 'dart:ui';

import 'package:provider/provider.dart';
import '../../network/book_model.dart';
import '../../data/models/book.dart';
import '../../data/memory_repository.dart';

import 'package:flutter/material.dart';
import 'package:librum/librum_theme.dart';
import 'package:librum/navigation/librum_pages.dart';
import 'package:librum/network/book_model.dart';

class BookDetails extends StatelessWidget {
  final Book book;
  const BookDetails({
    required this.book,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<MemoryRepository>(context);
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    repository.insertBook(book);
                  },
                  icon: const Icon(
                    Icons.favorite_outline_rounded,
                    color: Colors.red,
                  ),
                ),
              ],
              elevation: 0.0,
              expandedHeight: MediaQuery.of(context).size.height / 1.7,
              floating: true,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  book.title ?? '',
                  style: const TextStyle(color: Colors.black),
                ),
                background: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            book.image ?? 'assets/book_placholder.png'),
                      ),
                    ),
                    child: Container(
                      color: Colors.black.withOpacity(0.25),
                      child: Image.network(
                          book.image ?? 'assets/book_placeholder.png'),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Text(
                      book.authors.toString(),
                      style: LibrumTheme.lightTextTheme.headline1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InputChip(
                          label: Text(book.categories.toString()),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_outlined,
                              color: Colors.amber,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              book.rating.toString(),
                              style: LibrumTheme.lightTextTheme.headline2,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      book.description ?? '',
                      style: LibrumTheme.lightTextTheme.bodyText1,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
