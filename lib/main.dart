import 'package:flutter/material.dart';
import 'package:fluttermvpdemo/presenter/Presenter.dart';
import 'package:fluttermvpdemo/view/HomePage.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter MVP Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(new BasicCounterPresenter(), title: 'Flutter MVP Demo'),
    );
  }
}

