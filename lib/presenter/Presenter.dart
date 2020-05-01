

import 'package:fluttermvpdemo/model/CounterModel.dart';
import 'package:fluttermvpdemo/view/Counter.dart';

class Presenter {
  void incrementCounter() {}
  void decrementCounter() {}
  set counterView(Counter value) {}
}

class BasicCounterPresenter implements Presenter {

  CounterModel _counterViewModel;
  Counter _counterView;

  BasicCounterPresenter() {
    this._counterViewModel = new CounterModel(0);
  }

  @override
  void incrementCounter() {
    this._counterViewModel.counter++;
    this._counterView.refreshCounter(this._counterViewModel);
  }

  @override
  void decrementCounter() {
    this._counterViewModel.counter--;
    this._counterView.refreshCounter(this._counterViewModel);
  }

  @override
  set counterView(Counter value) {
    _counterView = value;
    this._counterView.refreshCounter(this._counterViewModel);
  }


}