import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferenceHelper {
  static late SharedPreferences _prefsInstance;
  var _prefs;
  static const String _userModel = "userModel";
  static const String _fcmToken = "fcmToken";
  static const String _userId = "userId";
  static const String _userToken = "userToken";
  static const String _isLoggedIn = "isLoggedIn";
  static const String _latitude = "latitude";
  static const String _longitude = "longitude";
  static const String _address = "address";
  static const String _rememberMe = "rememberMe";
  static const String _username = "username";
  static const String _userpass = "userpass";
  static const String _userAgreement = "userAgreement";
  static final JsonDecoder _decoder = JsonDecoder();
  static final JsonEncoder _encoder = JsonEncoder.withIndent('  ');

  static final SharedPreferenceHelper _singleton =
  SharedPreferenceHelper._internal();

  SharedPreferenceHelper._internal() {
    _prefs ??= SharedPreferences.getInstance();
  }

  static Future<SharedPreferences> init() async {
    _prefsInstance = await SharedPreferences.getInstance();
    return _prefsInstance;
  }

  factory SharedPreferenceHelper() {
    return _singleton;
  }

  _savePref(String key, Object? value) async {
    var prefs = _prefsInstance;
    if (prefs.containsKey(key)) {
      prefs.remove(key);
    }
    if (value is bool) {
      return prefs.setBool(key, value);
    } else if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is String) {
      return prefs.setString(key, value);
    } else if (value is double || value is Float) {
      return prefs.setDouble(key, value as double);
    }
  }

  T _getPref<T>(String key) {
    return _prefsInstance.get(key) as T;
  }

  void clearAll() {
    var token = getFcmToken();
    _prefsInstance.clear();
    saveFcmToken(token);
  }

  String? getFcmToken() {
    return _getPref(_fcmToken);
  }

  void saveFcmToken(String? token) {
    _savePref(_fcmToken, token);
  }

  int? getUserId() {
    return _getPref(_userId);
  }

  void saveUserId(num? userId) {
    _savePref(_userId, userId);
  }

  String? getUserToken() {
    return _getPref(_userToken);
  }

  void saveRememberMe(bool? userId) {
    _savePref(_rememberMe, userId);
  }

  bool? getRememberMe() {
    return _getPref(_rememberMe) ?? false;
  }

  String? getUserName() {
    return _getPref(_username);
  }

  String? getUserPass() {
    return _getPref(_userpass);
  }

  void saveUserName(String? token) {
    _savePref(_username, token);
  }

  void saveUserPass(String? token) {
    _savePref(_userpass, token);
  }

  void saveUserAgreement(bool? value) {
    _savePref(_userAgreement, value);
  }

  bool getUserAgreement() {
    return _getPref(_userAgreement) ?? false;
  }

  void saveUserToken(String? token) {
    _savePref(_userToken, token);
    debugPrint("${token} is Saved");
  }

  // UserModel? getUserModel() {
  //   String? user = _getPref(_userModel);
  //   if (user != null) {
  //     Map<String, dynamic> userMap = _decoder.convert(user);
  //     return UserModel.fromJson(userMap);
  //   } else {
  //     return null;
  //   }
  // }
  //
  // void saveUserModel(UserModel? userModel) {
  //   if (userModel != null) {
  //     String value = _encoder.convert(userModel);
  //     _savePref(_userModel, value);
  //   } else {
  //     _savePref(_userModel, null);
  //   }
  // }

  double? getLatitude() {
    return _getPref(_latitude);
  }

  void saveLatitude(lat) {
    _savePref(_latitude, lat);
  }

  double? getLongitude() {
    return _getPref(_longitude);
  }

  void saveLongitude(long) {
    _savePref(_longitude, long);
  }

  String? getAddress() {
    return _getPref(_address);
  }

  void saveAddress(String? type) {
    _savePref(_address, type);
  }

  bool getIsLoggedIn() {
    return _getPref(_isLoggedIn) ?? false;
  }

  void saveIsLoggedIn(bool value) {
    _savePref(_isLoggedIn, value);
  }
}
