import 'package:flutter/material.dart';
import 'package:flutter_native_example/battery_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String? batteryLevel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Native Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final result = await BatteryService.getBatteryLevel();

                  setState(() {
                    batteryLevel = "$result";
                  });
                },
                child: const Text("Get Battery Level"),
              ),
              Text("Battery Level ${batteryLevel ?? ''} %"),
            ],
          ),
        ),
      ),
    );
  }
}
