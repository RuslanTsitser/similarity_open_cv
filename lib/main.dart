import 'package:flutter/material.dart';

import 'calculate_ssim.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MyAppState();
}

class _MyAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            calculateSSIM(
              'https://sun9-59.userapi.com/impg/WjsjXOTEgCVVD-5NdukRsYSfU6cJy7Ge46s1Gw/i7HBfoCC6W0.jpg?size=1110x1110&quality=95&sign=06bb5e5bbd9230c0b0038e4fc0bb9194&type=album',
              'https://sun9-59.userapi.com/impg/SEOF_7bryE972iekNUtxLRViEG0H2Mak6Qd_Yg/8mGTC9VZRH0.jpg?size=1110x1110&quality=95&sign=622e1f963ab212fd74cd72273c45ff91&type=album',
            );
            // getOpenCVVersion();
            // print('hello world');
            // final plugin = OpencvPlugin();
            // plugin.getPlatformVersion().then((value) => print(value));
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Native Packages'),
        ),
      ),
    );
  }
}
