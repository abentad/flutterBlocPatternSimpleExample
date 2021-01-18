import 'dart:async';

enum counterAction {
  Increament,
  Decreament,
  Reset,
}

class CounterBloc {
  int counter;
  //bloc
  final _stateStreamController = StreamController<int>();
  StreamSink<int> get counterSink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;

  //bloc
  final _eventStreamController = StreamController<counterAction>();
  StreamSink<counterAction> get eventSink => _eventStreamController.sink;
  Stream<counterAction> get eventStream => _eventStreamController.stream;

  CounterBloc() {
    counter = 0;
    eventStream.listen((event) {
      if (event == counterAction.Increament)
        counter++;
      else if (event == counterAction.Decreament)
        counter--;
      else if (event == counterAction.Reset) counter = 0;

      counterSink.add(counter);
    });
  }
}
