import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/book_viewmodel.dart';
import '../models/book.dart';

class SavedBooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookViewModel = Provider.of<BookViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Books'),
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
                  if (bookViewModel.savedBooks.isEmpty)
                    Center(
                      child: Text(
                        'No saved books',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Lato",
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        itemCount: bookViewModel.savedBooks.length,
                        itemBuilder: (context, index) {
                          final book = bookViewModel.savedBooks[index];
                          return GestureDetector(
                            onTap: () {
                              // Implement onTap functionality if needed
                            },
                            child: Card(
                              elevation: 5,
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10),
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
                              ),
                            ),
                          );
                        },
                      ),
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
