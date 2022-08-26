import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    await SharedPreferences.getInstance().then((value) {
      sharedPreferences = value;
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  static dynamic getData({required String key}) {
    dynamic data = sharedPreferences.get(key) ?? false;

      if (data is String) return data.toString();
      if (data is int) return data.toInt();
      if (data is double) return data.toDouble();
      return data as bool;
  }
  static dynamic getDataList({required String key}) {
    dynamic data = sharedPreferences.getStringList(key) ?? [];
      if (data is List) return data.toList();
      return data;
  }

  static saveData({required String key, dynamic val}) {
    if (val is bool) return sharedPreferences.setBool(key, val);
    if (val is String) return sharedPreferences.setString(key, val);
    if (val is int) return sharedPreferences.setInt(key, val);

    return sharedPreferences.setDouble(key, val);
  }
  static saveDataList({required String key, required List<String> valList}) {
    return sharedPreferences.setStringList(key, valList);
  }
}