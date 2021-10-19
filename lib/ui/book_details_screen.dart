import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:librum/librum_theme.dart';
import 'package:librum/navigation/librum_pages.dart';
import 'package:librum/network/book_model.dart';

class BookDetails extends StatefulWidget {
  final APIBook book;
  // final Function(Book, int) onUpdate;
  // final Book? originalBook;
  // final int index;
  // final bool isUpdating;

  // static MaterialPage page({
  // Book? item,
  // int index = -1,
  // required Function(Book, int) onUpdate,
  // }) {
  //   return MaterialPage(
  //     name: LibrumPages.bookDetails,
  //     key: ValueKey(LibrumPages.bookDetails),
  //     child: BookDetails(
  //       originalBook: item,
  //       index: index,
  //       onUpdate: onUpdate,
  //     ),
  //   );
  // }

  // const BookDetails({
  //   Key? key,
  //   required this.onUpdate,
  //   this.originalBook,
  //   this.index = -1,
  // })  : isUpdating = (originalBook != null),
  //       super(key: key);

  const BookDetails({
    required this.book,
    Key? key,
  }) : super(key: key);

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: const [
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.favorite_outline_rounded,
                    color: Colors.red,
                  ),
                )
              ],
              elevation: 0.0,
              expandedHeight: MediaQuery.of(context).size.height / 1.7,
              floating: true,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  widget.book.title,
                  style: const TextStyle(color: Colors.black),
                ),
                background: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://picsum.photos/200/300'),
                      ),
                    ),
                    child: Container(
                      color: Colors.black.withOpacity(0.25),
                      child: Image.network('https://picsum.photos/200/300'),
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
                      widget.book.authors.toString(),
                      style: LibrumTheme.lightTextTheme.headline1,
                    ),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: InputChip(
                    //     label: Text(widget.book!.category),
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InputChip(
                          label: Text(widget.book.categories.toString()),
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
                              widget.book.averageRating.toString(),
                              style: LibrumTheme.lightTextTheme.headline2,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      widget.book.description!,
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
