import 'package:flutter/material.dart';

class AsyncAwaitSample extends StatefulWidget {
  @override
  _AsyncAwaitSampleState createState() => _AsyncAwaitSampleState();
}

class _AsyncAwaitSampleState extends State<AsyncAwaitSample> {
  @override
  void initState() {
    super.initState();

    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<int> _loadData() async {
    print("_loadData: start load");

    final dataFuture = _loadFromDisk();
    print("_loadData: dataFuture returned");
    dataFuture.then((value) => print("_loadData: loaded value - $value"));

    print("_loadData: started");

    // try {
    //   return _loadFromDisk();
    // } catch (e) {
    //   return 123;
    // } finally {}
  }

  Future<int> _loadFromDisk() async {
    print("_loadFromDisk: start load");

    // на этой строчке выполнение функции будет приостановлено и Future будет возвращён вызывающему
    final data = await Future.delayed(Duration(seconds: 1), () => 123);

    print("data loaded");
    return data;
  }
}
