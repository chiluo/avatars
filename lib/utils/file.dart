import 'dart:core';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';

class FileUtil {
  // JSON字符串转为Map结构
  static Map<String, dynamic> jsonDecode2Map(jsonstr) =>
      json.decode(jsonstr) as Map<String, dynamic>;

  // 读取本地静态JSON文件转为Map结构
  static Future<Map<String, dynamic>> readJsonFile(String path) async {
    String jsonStr = await rootBundle.loadString(path);
    return jsonDecode2Map(jsonStr.toString());
  }

  // 获取本地文件，该路径没有文件则会创建一个该路径新文件
  static Future<File> getAppConfigFile(String path) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$path');
  }

  // 文件存储
  static Future<void> saveFile(String content, String filePath) async {
    File file = await getAppConfigFile(filePath);
    file.writeAsString(content);
  }

  // 文件读取
  static Future<String> getFile(String filePath) async {
    File file = await getAppConfigFile(filePath);
    // 判断本地配置文件是否存在
    if (!await file.exists()) return '';
    return file.readAsString();
  }
}
