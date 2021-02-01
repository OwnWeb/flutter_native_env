# flutter_native_env

A flutter plugin getting android and iOS native env variables by calling `ProcessInfo.processInfo.environment[]` on iOS and `System.getProperty()` on android.

It can be used to easily fetch environment variables added during build or no-code testing, like [flutter_is_waldo](https://pub.dev/packages/flutter_is_waldo).

## Usage
Have a look on [installation page](https://pub.dev/packages/flutter_native_env/install).

```dart
import 'dart:async';
import 'package:flutter_native_env/flutter_native_env.dart';

String platformArch = await FlutterNativeEnv.getNativeEnv('os.arch', 'unknown', iosPropertyName: 'SIMULATOR_ARCHS');  // e.g. "x86_64"
```

You will find links to the API docs on the [pub API reference page](https://pub.dev/documentation/flutter_native_env/latest/flutter_native_env/flutter_native_env-library.html).
