import 'package:bookapp/models/mainModel.dart';
import 'package:bookapp/screens/homePageScreen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
        model: MainModel(),
        child:
            ScopedModelDescendant(builder: (context, child, MainModel model) {
          return MaterialApp(
            home: HomePage(model),
          );
        }));
  }
}
