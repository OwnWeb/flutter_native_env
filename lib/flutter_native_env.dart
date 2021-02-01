import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

/// Provides the [getNativeEnv] method
class FlutterNativeEnv {
  static const MethodChannel _channel =
      const MethodChannel('flutter_native_env');

  ///
  /// Returns the native value of [propertyName], or [defaultValue] if tis property isn't set.
  /// Different property names can be used with [androidPropertyName] and [iosPropertyName]
  static Future<String> getNativeEnv(String property, String defaultValue,
      {String iosPropertyName, String androidPropertyName}) async {
    var propertyName = property;

    if (Platform.isAndroid && androidPropertyName != null) {
      propertyName = androidPropertyName;
    } else if (Platform.isIOS && iosPropertyName != null) {
      propertyName = iosPropertyName;
    }

    return await _channel.invokeMethod(
        'getNativeEnv', {'property': propertyName, 'default': defaultValue});
  }
}
