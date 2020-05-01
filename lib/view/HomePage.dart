import 'package:flutter/material.dart';
import 'package:fluttermvpdemo/model/CounterModel.dart';
import 'package:fluttermvpdemo/presenter/Presenter.dart';
import 'package:fluttermvpdemo/view/Counter.dart';



class HomePage extends StatefulWidget {
  final Presenter presenter;

  HomePage(this.presenter, {Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> implements Counter {

  CounterModel _viewModel;

  @override
  void initState() {
    super.initState();
    this.widget.presenter.counterView = this;
  }

  @override
  void refreshCounter(CounterModel viewModel) {
    setState(() {
      this._viewModel = viewModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Text(
                "Click buttons to add and substract."
                ,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[FloatingActionButton(
                onPressed: () {

                      this.widget.presenter.decrementCounter();

                },
                tooltip: 'Decrement',
                child: Icon(Icons.remove),
              ),Text(
                _viewModel?.counter.toString(),
                style: Theme.of(context).textTheme.display1,
              ),FloatingActionButton(
                onPressed: () {

                      this.widget.presenter.incrementCounter();

                },
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),],
            ),
          ],
        ),
      ),

    );
  }
}