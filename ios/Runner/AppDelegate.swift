import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let ssimChannel = FlutterMethodChannel(name: "com.example.ssim", binaryMessenger: controller.binaryMessenger)
        
        ssimChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            if call.method == "calculateSSIM" {
                self.onCalculateSSIM(call: call, result: result)
            } else {
                result(FlutterMethodNotImplemented)
            }
        })
        
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func onCalculateSSIM(call: FlutterMethodCall, result: @escaping FlutterResult ) -> Void {
        guard let args = call.arguments else {
            return
        }
        
        if let myArgs = args as? [String: Any],
           let img1Bytes = myArgs["img1"] as? FlutterStandardTypedData,
           let img2Bytes = myArgs["img2"] as? FlutterStandardTypedData {
            
            // Convert FlutterStandardTypedData to Data
            let data1 = img1Bytes.data
            let data2 = img2Bytes.data
            
            // Create UIImage from data
            if let image1 = UIImage(data: data1),
               let image2 = UIImage(data: data2) {
                
                let ssim = OpenCVWrapper.calculateSSIMBetweenImage(image1, andImage: image2)
                result(ssim)
            } else {
                result(FlutterError(code: "INVALID_ARGUMENT",
                                    message: "Invalid image data",
                                    details: nil))
            }
        }
    }
}
