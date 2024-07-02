import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/api_service.dart';
import '../services/database_helper.dart';

class BookViewModel extends ChangeNotifier {
  List<Book> books = [];
  List<Book> savedBooks = [];
  bool isLoading = false;
  String? errorMessage;

  final BookApiService apiService = BookApiService();
  final DatabaseHelper dbHelper = DatabaseHelper();

  BookViewModel() {
    fetchSavedBooks();
  }

  Future<void> fetchBooks() async {
    isLoading = true;
    notifyListeners();

    try {
      books = await apiService.fetchBooks();
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Failed to load books';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchSavedBooks() async {
    savedBooks = await dbHelper.getSavedBooks();
    notifyListeners();
  }

  Future<void> toggleFavorite(Book book) async {
    if (savedBooks.contains(book)) {
      savedBooks.remove(book);
      await dbHelper.deleteBook(book.id);
    } else {
      savedBooks.add(book);
      await dbHelper.insertBook(book);
    }
    notifyListeners();
  }
}
