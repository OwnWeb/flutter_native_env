import Flutter
import UIKit
import os.log

public class SwiftFlutterNativeEnvPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_native_env", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterNativeEnvPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard call.method == "getNativeEnv" else {
        result(FlutterMethodNotImplemented)
        return
    }
    self.getNativeEnv(call, result: result)
  }
    
    private func getNativeEnv(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments else {
            return
        }
        if let myArgs = args as? [String: Any],
            let property = myArgs["property"] as? String,
            let defaultValue = myArgs["default"] as? String {
            
            if #available(iOS 10.0, *) {
                os_log("ProcessInfo.processInfo.environment = %@", ProcessInfo.processInfo.environment)
            } else {
                // Fallback on earlier versions
            }
            
            result(ProcessInfo.processInfo.environment[property] ?? defaultValue)
        } else {
            result(FlutterError(code: "-1", message: "iOS could not extract " +
                                    "flutter arguments in method: (getNativeEnv)", details: nil))
        }
        
    }
}
