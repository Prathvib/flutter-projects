import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/book_viewmodel.dart';
import '../models/book.dart';
import 'saved_books_screen.dart';

class BookListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookViewModel = Provider.of<BookViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Books पुस्तकें'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SavedBooksScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              'https://images.pexels.com/photos/733854/pexels-photo-733854.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: 60,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 204, 220, 187),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Books पुस्तकें',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '"A room without books is like a body without a soul."',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  if (bookViewModel.isLoading)
                    Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepPurple,
                      ),
                    )
                  else if (bookViewModel.errorMessage != null)
                    Center(
                      child: Text(
                        bookViewModel.errorMessage!,
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        itemCount: bookViewModel.books.length,
                        itemBuilder: (context, index) {
                          final book = bookViewModel.books[index];
                          final isFavorite =
                              bookViewModel.savedBooks.contains(book);
                          return Card(
                            elevation: 5,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(15),
                              title: Text(
                                book.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              subtitle: Text(
                                'Type: ${book.type}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavorite ? Colors.red : null,
                                ),
                                onPressed: () {
                                  bookViewModel.toggleFavorite(book);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      bookViewModel.fetchBooks();
                    },
                    child: Text(
                      'Fetch Books',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontFamily: 'Lato',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 204, 220, 187),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: TextStyle(fontSize: 18, fontFamily: 'Lato'),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                     '"Books are a uniquely portable magic."',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
