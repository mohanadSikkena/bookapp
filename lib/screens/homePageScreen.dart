import 'package:bookapp/models/mainModel.dart';
import 'package:bookapp/theme/sharedColor.dart';
import 'package:bookapp/widgets/book.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  final MainModel model;
  HomePage(this.model);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.model.getBooks();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context, child, MainModel model) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.sort,
              color: mainColor,
            ),
            onPressed: () {},
          ),
          title: Text(
            'Home',
            style: TextStyle(
                color: mainColor, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: mainColor,
                ))
          ],
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: RefreshIndicator(
            onRefresh: model.getBooks,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                ),
                scrollDirection: Axis.vertical,
                itemCount: model.allBooksGetter.length,
                itemBuilder: (context, index) {
                  return Book(
                      model.allBooksGetter[index].bookName,
                      model.allBooksGetter[index].writerName,
                      model.allBooksGetter[index].bookImg);
                }),
          ),
        ),
      );
    });
  }
}
