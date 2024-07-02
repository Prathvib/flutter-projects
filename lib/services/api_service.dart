import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book.dart';


class BookApiService {
  static const String _baseUrl = 'https://simple-books-api.glitch.me'; // API base URL

  Future<List<Book>> fetchBooks() async {
    final response = await http.get(Uri.parse('$_baseUrl/books?type=fiction'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((book) => Book.fromJson(book)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }
}
