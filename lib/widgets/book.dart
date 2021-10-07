import 'package:bookapp/theme/sharedFontStyle.dart';
import 'package:flutter/material.dart';

class Book extends StatefulWidget {
  String bookName;
  String writerName;
  String bookImg;
  Book(this.bookName, this.writerName, this.bookImg);
  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 235,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                image: DecorationImage(
                    image: NetworkImage(
                      '${widget.bookImg}',
                    ),
                    fit: BoxFit.fill)),
          ),
          ListTile(
            title: Text(
              '${widget.bookName}',
              style: mainTextStyle,
            ),
            subtitle: Text(
              '${widget.writerName}',
              style: secondaryTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
