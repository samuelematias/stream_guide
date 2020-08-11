import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamController<double> controller = StreamController<double>.broadcast();
  StreamSubscription<double> streamSubscription;

  @override
  void dispose() {
    controller?.close();
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
                onPressed: () {
                  // Stream the controller manages
                  Stream stream = controller.stream;
                  streamSubscription = stream.listen((value) {
                    print('Value from the controller $value');
                  });
                },
              ),
              MaterialButton(
                child: Text('Emit value'),
                color: Colors.blue[200],
                onPressed: () {
                  controller.add(12);
                },
              ),
              MaterialButton(
                child: Text('Unsubscribe'),
                color: Colors.red[200],
                onPressed: () {
                  streamSubscription.cancel();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
