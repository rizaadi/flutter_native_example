import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class BatteryService {
  /// prefix the channel name with a unique 'domain prefix'
  static const methodChannel =
      MethodChannel('com.example.flutter_native_example/battery');

  static Future<int?> getBatteryLevel() async {
    try {
      final batteryLevel =
          await methodChannel.invokeMethod<int>('getBatteryLevel');
      return batteryLevel;
    } catch (e) {
      debugPrint("Error: $e");
      return null;
    }
  }
}
