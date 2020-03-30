import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test("single subscription stream", () {
    final StreamController ctrl = StreamController();

    final StreamSubscription subscription = ctrl.stream.listen((data) => print('$data'));

    ctrl.sink.add('my name');
    ctrl.sink.add(1234);
    ctrl.sink.add({'a': 'element A', 'b': 'element B'});
    ctrl.sink.add(123.45);

    ctrl.close();
  });
}
