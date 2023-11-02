import 'dart:async';

import 'package:flutter/services.dart';

// ignore: avoid_classes_with_only_static_members
class AnotherBrother {
  static const MethodChannel _channel = const MethodChannel('another_brother');

  static Future<String> get platformVersion async {
    final version = await _channel.invokeMethod('getPlatformVersion');
    return version.toString();
  }
}
