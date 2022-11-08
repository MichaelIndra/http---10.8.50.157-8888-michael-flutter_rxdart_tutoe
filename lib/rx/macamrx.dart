import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MacamRx {
  void publishRX() {
    PublishSubject<int> subject = PublishSubject();
    subject.stream.listen(
      (data) {
        debugPrint("listener publish 1 : $data");
      },
      onDone: () => debugPrint("selesai listener publish 1"),
    );

    subject.sink.add(1);
    subject.sink.add(2);

    subject.stream.listen(
      (data) {
        debugPrint("listener publish 2 : $data");
      },
      onDone: () => debugPrint("selesai listener publish 2"),
    );

    subject.sink.add(10);
    subject.sink.add(11);

    subject.close();
  }

  void behaviorRX() {
    BehaviorSubject<int> subject = BehaviorSubject();
    subject.stream.listen(
      (data) {
        debugPrint("listener behavior 1 : $data");
      },
      onDone: () => debugPrint("selesai listener behavior 1"),
    );

    subject.sink.add(1);
    subject.sink.add(2);

    subject.stream.listen(
      (data) {
        debugPrint("listener behavior 2 : $data");
      },
      onDone: () => debugPrint("selesai listener behavior 2"),
    );

    subject.sink.add(10);
    subject.sink.add(11);

    subject.close();
  }
}
