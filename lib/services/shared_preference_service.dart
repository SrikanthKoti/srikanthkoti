// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/app.logger.dart';
import '../features/login/data/user_model.dart';

/// Provides a local storage which allows you to save key/value pairs
class SharedPreferencesService {
  static const String UserKey = 'user';

  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;
  static Future<SharedPreferencesService> getInstance({
    bool enableLogs = false,
  }) async {
    _instance ??= SharedPreferencesService(enableLogs: enableLogs);
    _preferences ??= await SharedPreferences.getInstance();

    return _instance!;
  }

  final _log = getLogger('SharedPreferencesService');

  final bool? enableLogs;
  SharedPreferencesService({this.enableLogs});

  void dispose() {
    _log.i('');
    _preferences?.clear();
  }

  User? get user {
    var userJson = getFromDisk(UserKey);
    return userJson != null ? User.fromJson(json.decode(userJson)) : null;
  }

  set user(User? userToSave) {
    saveToDisk(UserKey, json.encode(userToSave?.toJson()));
  }

  ThemeMode getThemeMode(String key) {
    final value = _preferences?.get(key);
    if (enableLogs!) _log.v('key:$key value:$value');
    if (value == null) {
      return ThemeMode.dark;
    }
    if (value.toString().split('.').last == 'light') {
      return ThemeMode.light;
    }
    return ThemeMode.dark;
  }

  dynamic getFromDisk(String key) {
    final value = _preferences?.get(key);
    if (enableLogs!) _log.v('key:$key value:$value');
    return value;
  }

  void saveToDisk(String key, dynamic value) {
    if (enableLogs!) _log.v('key:$key value:$value');

    switch (value.runtimeType) {
      case String:
        _preferences?.setString(key, value);
        break;
      case bool:
        _preferences?.setBool(key, value);
        break;
      case int:
        _preferences?.setInt(key, value);
        break;
      case double:
        _preferences?.setDouble(key, value);
        break;
      case List<String>:
        _preferences?.setStringList(key, value);
        break;
    }
  }
}

// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

// import '../features/login/data/user_model.dart';

// class SharedPreferencesManager {
//   static SharedPreferences? _prefs;
//   //==================================================
//   // If _prefs is null
//   static Future<SharedPreferences> get _prefInstance async =>
//       _prefs ?? (await SharedPreferences.getInstance());

//   // Call this during the start of your app so that we can get
//   // the pref instance once and use the same each time
//   static Future<SharedPreferences> init() async {
//     _prefs = await _prefInstance;
//     return _prefs!;
//   }

//   //==================================================
//   static String getString(String? strKey) {
//     String strValue = '';
//     if (_prefs!.getString(strKey!) != null) {
//       strValue = _prefs!.getString(strKey)!;
//     }
//     return strValue;
//   }

//   static void setString(String? strKey, String? strValue) {
//     if (strKey != null && strValue != null) {
//       _prefs!.setString(strKey, strValue);
//     }
//   }

//   //==================================================
//   static int getInt(String? strKey) {
//     int nValue = 0;
//     if (strKey != null && _prefs != null && _prefs!.containsKey(strKey)) {
//       nValue = _prefs!.getInt(strKey)!;
//     }
//     return nValue;
//   }

//   static void setInt(String? strKey, int nValue) {
//     if (strKey != null) {
//       _prefs!.setInt(strKey, nValue);
//     }
//   }

//   //==================================================
//   static double getDouble(String? strKey) {
//     double dValue = 0.0;
//     if (strKey != null) {
//       dValue = _prefs!.getDouble(strKey)!;
//     }
//     return dValue;
//   }

//   static void setDouble(String? strKey, double dValue) {
//     if (strKey != null) {
//       _prefs!.setDouble(strKey, dValue);
//     }
//   }

//   //==================================================
//   static bool getBool(String? strKey) {
//     bool bValue = false;
//     if (strKey != null) {
//       bValue = _prefs!.getBool(strKey) ?? false;
//     }
//     return bValue;
//   }

//   static void setBool(String? strKey, bool bValue) {
//     if (strKey != null) {
//       _prefs!.setBool(strKey, bValue);
//     }
//   }

//   //==================================================
//   static List<String> getStringList(String? strKey) {
//     List<String> listOfValue = [];
//     if (strKey != null) {
//       listOfValue = _prefs!.getStringList(strKey)!;
//     }
//     return listOfValue;
//   }

//   static void setStringList(String? strKey, List<String> listOfValue) {
//     if (strKey != null) {
//       _prefs!.setStringList(strKey, listOfValue);
//     }
//   }

//   //==================================================
//   static Object get(String? strKey) {
//     Object obj = false;
//     if (strKey != null) {
//       obj = _prefs!.get(strKey)!;
//     }
//     return obj;
//   }
//   //==================================================
// }
