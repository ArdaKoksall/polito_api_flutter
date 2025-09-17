import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoHelper {
  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  static Future<Map<String, String>> getDeviceData() async {
    if (kIsWeb) {
      final webInfo = await _deviceInfoPlugin.webBrowserInfo;
      return {
        'platform': 'Web',
        'name': webInfo.browserName.toString(),
        'version': webInfo.appVersion?.split(' ').first ?? 'Unknown',
        'model': webInfo.browserName.toString(),
        'manufacturer': 'Browser',
      };
    } else {
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfoPlugin.androidInfo;
        return {
          'platform': 'Android',
          'name': androidInfo.device,
          'version': androidInfo.version.release,
          'model': androidInfo.model,
          'manufacturer': androidInfo.manufacturer,
        };
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfoPlugin.iosInfo;
        return {
          'platform': 'iOS',
          'name': iosInfo.name,
          'version': iosInfo.systemVersion,
          'model': iosInfo.model,
          'manufacturer': 'Apple',
        };
      } else if (Platform.isWindows) {
        final windowsInfo = await _deviceInfoPlugin.windowsInfo;
        return {
          'platform': 'Windows',
          'name': windowsInfo.computerName,
          'version': windowsInfo.displayVersion,
          'model': windowsInfo.productName,
          'manufacturer': 'Microsoft',
        };
      } else if (Platform.isLinux) {
        final linuxInfo = await _deviceInfoPlugin.linuxInfo;
        return {
          'platform': 'Linux',
          'name': linuxInfo.name,
          'version': linuxInfo.version ?? 'Unknown',
          'model': linuxInfo.prettyName,
          'manufacturer': linuxInfo.id,
        };
      } else if (Platform.isMacOS) {
        final macInfo = await _deviceInfoPlugin.macOsInfo;
        return {
          'platform': 'macOS',
          'name': macInfo.computerName,
          'version': macInfo.osRelease,
          'model': macInfo.model,
          'manufacturer': 'Apple',
        };
      } else {
        return {
          'platform': 'Unknown',
          'name': 'Unknown',
          'version': 'Unknown',
          'model': 'Unknown',
          'manufacturer': 'Unknown',
        };
      }
    }
  }
}
