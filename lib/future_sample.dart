import 'package:flutter/material.dart';

class FutureSample extends StatefulWidget {
  @override
  _FutureSampleState createState() => _FutureSampleState();
}

class _FutureSampleState extends State<FutureSample> {
  @override
  void initState() {
    super.initState();

    final future = Future(() {
      print("start future");
      return 23;
    });

    print("init state done");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
