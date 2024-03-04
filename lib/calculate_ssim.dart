import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

const _platform = MethodChannel('com.example.ssim');

void calculateSSIM(String img1Path, String img2Path) async {
  try {
    final img1Bytes = await http.get(Uri.parse(img1Path)).then((response) => response.bodyBytes);
    final img2Bytes = await http.get(Uri.parse(img2Path)).then((response) => response.bodyBytes);
    final double ssim = await _platform.invokeMethod('calculateSSIM', <String, dynamic>{
      'img1': img1Bytes,
      'img2': img2Bytes,
    });
    print('SSIM: $ssim');
  } on PlatformException catch (e) {
    print("Failed to calculate SSIM: '${e.message}'.");
  }
}

void getOpenCVVersion() async {
  try {
    final String version = await _platform.invokeMethod('getOpenCVVersion');
    print('OpenCV version: $version');
  } on PlatformException catch (e) {
    print("Failed to get OpenCV version: '${e.message}'.");
  }
}
