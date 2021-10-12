import 'package:flutter/material.dart';
import 'package:librum/librum_theme.dart';

class BookCard extends StatefulWidget {
  const BookCard({Key? key}) : super(key: key);

  @override
  _BookCardState createState() => _BookCardState();
}

const String bookTitle = "Lorem Ipsum";
const String author = "Dolor Sit";
const String rating = "4.5";
const String category = "Lorem";

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
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
                author,
                style: LibrumTheme.lightTextTheme.bodyText2,
              ),
              Text(
                bookTitle,
                style: LibrumTheme.lightTextTheme.headline3,
              ),
              Row(
                children: [
                  const Icon(Icons.star_rate_rounded),
                  Text(
                    rating,
                    style: LibrumTheme.lightTextTheme.bodyText2,
                  ),
                ],
              ),
              const InputChip(label: Text(category)),
            ],
          )
        ],
      ),
    );
  }
}
