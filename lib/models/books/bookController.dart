import 'dart:convert';

import 'package:bookapp/models/books/bookModel.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

mixin BookController on Model {
  List<BookModel> _allBooks = [];
  List<BookModel> get allBooksGetter => _allBooks;

  Future<void> getBooks() async {
    List<BookModel> _getAllBooks = [];
    http.Response _response = await http.get(
        Uri.parse('https://book-7e5a1-default-rtdb.firebaseio.com/books.json'));
    Map<String, dynamic> _data = json.decode(_response.body);

    _data.forEach((key, value) {
      BookModel _newBook = BookModel(
          key, value['bookName'], value['bookImage'], value['writerName']);
      _getAllBooks.add(_newBook);
    });
    _allBooks = _getAllBooks;
    notifyListeners();
  }

  // Future<void> addNewBook() async {
  //   Map<String, dynamic> _data = {"hellow": "hh"};
  //   String _body = json.encode(_data);
  //   http.post(
  //       Uri.parse('https://book-7e5a1-default-rtdb.firebaseio.com/books.json'),
  //       body: _body);
  // }
}
