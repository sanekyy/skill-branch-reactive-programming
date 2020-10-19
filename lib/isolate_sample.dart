import 'dart:async';

import 'package:flutter/material.dart';

class IsolateSample extends StatefulWidget {
  @override
  _IsolateSampleState createState() => _IsolateSampleState();
}

class _IsolateSampleState extends State<IsolateSample> {
  String _value = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    NumberCreator().stream.listen((event) {
      setState(() {
        _value = "$event";
      });

      if (event == 5) {
        doSomeWork();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_value);
  }

  void doSomeWork() async {
    for (int i = 0; i < 100; i++) {
      print("start part № $i");
      await doSomePartOfWork();
    }
  }

  Future<int> doSomePartOfWork() async {
    for (int i = 0; i < 10000 * 1000; i++) {
      if (i % 10000000 == 0) {
        print(i);
      }
    }

    return Future.delayed(Duration(microseconds: 1), () => 10);
  }
}

class NumberCreator {
  final _streamController = StreamController<int>();

  Stream<int> get stream => _streamController.stream;

  Timer _timer;

  NumberCreator() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _streamController.sink.add(timer.tick);
    });
  }
}
