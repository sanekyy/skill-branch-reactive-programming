import 'package:flutter/material.dart';

class GeneratorsSample extends StatefulWidget {
  @override
  _GeneratorsSampleState createState() => _GeneratorsSampleState();
}

class _GeneratorsSampleState extends State<GeneratorsSample> {
  @override
  void initState() {
    super.initState();

    final myIterable = getRange(0, 100).take(5);

    for (final value in myIterable) {
      print(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Iterable<int> getRange(int start, int finish) sync* {
    for (int i = start; i <= finish; i++) {
      print("calculate $i value");
      yield i;
      print("yield $i done");
    }
  }
}
