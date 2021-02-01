import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_env/flutter_native_env.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _envValue = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformArch;
    // Platform messages may fail, so we use a try/catch PlatformException.
    platformArch = await FlutterNativeEnv.getNativeEnv('os.arch', 'unknown',
        iosPropertyName: 'SIMULATOR_ARCHS');

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _envValue = platformArch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Native Env'),
        ),
        body: Center(
          child: Text('Operating system architecture: $_envValue\n'),
        ),
      ),
    );
  }
}
