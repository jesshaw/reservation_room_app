import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test("broadcast stream", () {
    final StreamController<int> ctrl = StreamController<int>.broadcast();

    final StreamSubscription subscription = ctrl.stream.where((value) => (value % 2 == 0))
        .listen((value) => print('$value'));

    for (int i = 1; i < 11; i++) {
      ctrl.sink.add(i);
    }

    ctrl.close();
  });
}
