library;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show MethodChannel;
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

part 'upgrade_util_method_channel.dart';

part 'upgrade_util_platform_interface.dart';

class UpgradeUtil {
  Future<String?> getPlatformVersion() {
    return UpgradeUtilPlatform.instance.getPlatformVersion();
  }
}
