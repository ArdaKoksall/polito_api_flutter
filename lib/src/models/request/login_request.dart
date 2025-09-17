import '../../device_info.dart';

class LoginRequest {
  final String username;
  final String password;
  final bool useItalian;

  LoginRequest({
    required this.username,
    required this.password,
    this.useItalian = true,
  });

  Future<Map<String, dynamic>> toJson() async {
    final Map<String, dynamic> data = {
      'loginType': "basic",
      'username': username,
      'password': password,
      'preferences': {'language': useItalian ? 'it' : 'en'},
      'device': await DeviceInfoHelper.getDeviceData(),
    };

    return data;
  }
}
