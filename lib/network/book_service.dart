import 'dart:io' show Platform;

import 'package:http/http.dart';

const String apiUrl = 'https://www.googleapis.com/books/v1/volumes?q=the+art';
// final apiKey = Platform.environment['../../../apiKey'];

class BookService {
  Future getData(String url) async {
    print('Calling url: $apiUrl');

    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getBooks(String query) async {
    final BookData = await getData('$apiUrl?q=$query');

    return BookData;
  }
}
