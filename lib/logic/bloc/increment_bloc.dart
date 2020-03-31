import 'dart:async';

import 'package:reservation_room_app/logic/bloc/bloc_provider.dart';

class IncrementBloc extends BlocBase {
  int _counter;

  StreamController<int> _counterController = StreamController<int>();

  StreamSink<int> get _inAdd => _counterController.sink; //可理解为管道源
  Stream<int> get outCounter => _counterController.stream; //通过控制器暴露stream

  StreamController _actionController = StreamController();

  StreamSink get incrementCounter => _actionController.sink;

  IncrementBloc() {
    _counter = 0;
    _actionController.stream.listen(_handleLogic);
  }

  void _handleLogic(event) {
    _counter = _counter + 1;
    _inAdd.add(_counter);
  }

  @override
  void dispose() {
    _counterController.close();
    _actionController.close();
  }
}
