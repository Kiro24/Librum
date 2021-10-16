import 'package:flutter/material.dart';
import 'package:librum/librum_theme.dart';

import 'models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              // offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                'https://picsum.photos/200/300',
                height: 150.0,
                width: 100.0,
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Column(
              children: [
                Text(
                  book.author,
                  style: LibrumTheme.lightTextTheme.bodyText2,
                ),
                Text(
                  book.title,
                  style: LibrumTheme.lightTextTheme.headline3,
                ),
                Row(
                  children: [
                    const Icon(Icons.star_rate_rounded),
                    Text(
                      book.rating.toString(),
                      style: LibrumTheme.lightTextTheme.bodyText2,
                    ),
                  ],
                ),
                InputChip(label: Text(book.category)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
