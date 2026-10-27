import Flutter
import UIKit

public class UpgradeUtilPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "upgrade_util", binaryMessenger: registrar.messenger())
    let instance = UpgradeUtilPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "launch":
      launch(call.arguments as? [String: Any], result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  /// 打开链接
  ///
  /// 唤起前先以 `canOpenURL` 探测链接是否可被处理，不可处理时直接返回 false。
  private func launch(_ args: [String: Any]?, result: @escaping FlutterResult) {
    guard let urlString = args?["url"] as? String, let url = URL(string: urlString) else {
      result(
        FlutterError(
          code: "INVALID_ARGUMENT",
          message: "launch requires a valid url, got: \(String(describing: args?["url"])).",
          details: nil
        )
      )
      return
    }
    guard UIApplication.shared.canOpenURL(url) else {
      result(false)
      return
    }
    UIApplication.shared.open(url, options: [:]) { success in result(success) }
  }
}