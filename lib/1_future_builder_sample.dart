import 'package:flutter/material.dart';

class FutureBuilderSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      initialData: "initial",
      future: _loadSomeData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        } else if (snapshot.hasData) {
          return Text("value: ${snapshot.data}");
        } else {
          return Text("no value yet");
        }
      },
    );
  }

  Future<String> _loadSomeData() {
    return Future.delayed(Duration(seconds: 3), () => "Some data");
  }
}
