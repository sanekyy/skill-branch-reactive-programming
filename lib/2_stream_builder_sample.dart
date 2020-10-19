import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderSample extends StatefulWidget {
  @override
  _StreamBuilderSampleState createState() => _StreamBuilderSampleState();
}

class _StreamBuilderSampleState extends State<StreamBuilderSample> {
  String _text = "";

  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();

    final stream = NumberCreator().stream;

    _subscription = stream.listen(
      (data) {
        setState(() {
          _text = "$data";
        });
      },
    );
  }

  @override
  void dispose() {
    _subscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(_text);
  }
}

class NumberCreator {
  final _streamController = StreamController<int>();

  Stream<int> get stream => _streamController.stream;

  Timer _timer;

  NumberCreator() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick % 3 == 0) {
        _streamController.sink.addError(Exception());
      } else {
        _streamController.sink.add(timer.tick);
      }

      if (timer.tick > 12) {
        _timer.cancel();
        _streamController.sink.close();
      }
    });
  }
}

//      onError: (e) {
//         setState(() {
//           _text = "ERROR";
//         });
//       },

//       onDone: () {
//         _text = "done";
//       },

//   cancelOnError: true,

//return StreamBuilder<bool>(
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) return Container();
//
//         snapshot.data;
//
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text("No Data yet");
//         } else if (snapshot.connectionState == ConnectionState.done) {
//           return Text("Done");
//         } else if (snapshot.hasError) {
//           return Text("Error");
//         } else {
//           return Text("${snapshot.data ?? ""}");
//         }
//       },
//     );
