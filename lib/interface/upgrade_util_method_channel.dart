part of 'upgrade_util.dart';

/// An implementation of [UpgradeUtilPlatform] that uses method channels.
class MethodChannelUpgradeUtil extends UpgradeUtilPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final MethodChannel methodChannel = const MethodChannel('upgrade_util');

  @override
  Future<String?> getPlatformVersion() async {
    final String? version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
