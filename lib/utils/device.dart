import 'dart:core';
import 'file.dart';
import 'package:device_info_plus/device_info_plus.dart';

class Device {
  // iphone全部机型代码
  static Future<Map<String, dynamic>> getiPhoneDeviceJson() async {
    return await FileUtil.readJsonFile("assets/config/device.json");
  }

  static Future<List<String>> getiPhoneDeviceKeys() async {
    Map<String, dynamic> deviceJson = await getiPhoneDeviceJson();
    return deviceJson.keys.toList();
  }

  // 获取当前设备iphone机型信息
  static Future<IosDeviceInfo> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    return await deviceInfo.iosInfo;
  }

  // 根据iPhone机型判断是否是全面屏尺寸的iPhone
  static Future<bool> getiOSDeviceInfo() async {
    List<String> deviceKeys = await getiPhoneDeviceKeys();
    IosDeviceInfo iosInfo = await getDeviceInfo();
    int index = deviceKeys.indexOf(iosInfo.utsname.machine!);
    return index < 25;
  }
}
