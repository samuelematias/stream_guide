import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamController<double> controller = StreamController<double>();
  StreamSubscription<double> streamSubscription;

  @override
  void dispose() {
    controller?.close();
    streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Center(
          child: Wrap(
            children: [
              MaterialButton(
                child: Text('Subscribe'),
                color: Colors.yellow,
                // With manual random streamSubscription
                onPressed: () async {
                  getRandomValues().listen((value) {
                    print('1st: $value');
                  });
                },

                // With manual random
                // onPressed: () async {
                //   var value1 = await getRandomValue();
                //   var value2 = await getRandomValue();
                // },

                // With String streamSubscription
                // onPressed: () {
                //   // Stream the controller manages
                //   Stream stream = controller.stream;
                //   streamSubscription = stream.listen((value) {
                //     print('Value from the controller $value');
                //   });
                // },
              ),

              // With String streamSubscription
              // MaterialButton(
              //   child: Text('Emit value'),
              //   color: Colors.blue[200],
              //   onPressed: () {
              //     controller.add(12);
              //   },
              // ),

              // With String streamSubscription
              // MaterialButton(
              //   child: Text('Unsubscribe'),
              //   color: Colors.red[200],
              //   onPressed: () {
              //     streamSubscription.cancel();
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // With manual random streamSubscription
  Stream<double> getRandomValues() async* {
    var random = Random(2);

    while (true) {
      await Future.delayed(Duration(seconds: 1));
      // yield is basically telling the
      // function that we want return this value
      // but we will still continue the execution
      // of this function.
      yield random.nextDouble();
    }
  }

  // With manual random
  // Future<double> getRandomValue() async {
  //   var random = Random(2);
  //   await Future.delayed(Duration(seconds: 1));
  //   return random.nextDouble();
  // }
}
