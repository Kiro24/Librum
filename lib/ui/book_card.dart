import 'package:flutter/material.dart';
import 'package:librum/librum_theme.dart';
import 'package:librum/network/book_model.dart';

Widget bookCard(APIBook book, double width) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: width,
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
              book.imageLinks == null
                  ? 'https://via.placeholder.com/100x150.png/09f/fff'
                  : book.imageLinks!.smallThumbnail,
              height: 150.0,
              width: 100.0,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Flexible(
            child: Column(
              children: [
                book.authors == null
                    ? Container()
                    : Text(
                        book.authors![0].toString(),
                        overflow: TextOverflow.ellipsis,
                        style: LibrumTheme.lightTextTheme.bodyText2,
                      ),
                Text(
                  book.title,
                  overflow: TextOverflow.ellipsis,
                  style: LibrumTheme.lightTextTheme.headline3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                    ),
                    Text(
                      book.averageRating == null
                          ? 'N/A'
                          : book.averageRating.toString(),
                      style: LibrumTheme.lightTextTheme.bodyText2,
                    ),
                  ],
                ),
                book.categories == null
                    ? Container()
                    : InputChip(
                        label: Text(
                        book.categories![0].toString(),
                        overflow: TextOverflow.clip,
                      )),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
