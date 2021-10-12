import 'package:flutter/material.dart';
import 'package:librum/card.dart';
import 'package:librum/librum_theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

const String title = "Explore thousands of books on the go";
const String subtitle = "Famous Books";
const String searchBar = "Search for books...";

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0),
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
              const BookCard(),
            ],
          ),
        ),
      ),
    );
  }
}
