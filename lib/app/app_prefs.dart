import 'package:flutter/material.dart';
import 'package:gamification/app/constants.dart';
import 'package:gamification/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = 'PREFS_KEY_LANG';
const String PREFS_KEY_IS_LOGGED_IN = 'PREFS_KEY_IS_LOGGED_IN';
const String PREFS_KEY_ONBOARDONG_VIEWED = "PREFS_KEY_ONBOARDONG_VIEWED";
const String PREFS_KEY_FIRST_SPLASH_VIEWED = "PREFS_KEY_FIRST_SPLASH_VIEWED";
// User Data
const String TOKEN = 'TOKEN';
const String USER_ID = 'USER_ID';
const String YEAR_ID = 'YEAR_ID';
const String STUDENT_ID = 'STUDENT_ID';
const String USER_AR_NAME = 'USER_AR_NAME';
const String USER_PICTURE = 'USER_PICTURE';
const String USER_TYPE_ID = 'USER_TYPE_ID';
const String USER_TYPE_AR_NAME = 'USER_TYPE_AR_NAME';
const String ROLE_ID = 'ROLE_ID';
const String TYPE_ID = 'TYPE_ID';
const String EMAIL = 'EMAIL';
const String MOBILE_NUMBER = 'MOBILE_NUMBER';
const String USER_GIM_NUM = 'USER_GIM_NUM';
const String USER_FLASH_NUM = 'USER_FLASH_NUM';
const String USER_STAGE = 'USER_STAGE';
const String USER_EDU_YEAR = 'USER_EDU_YEAR';
const String STREAKS = 'STREAKS';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ARABIC.getValue();
    }
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.ARABIC.getValue()) {
      /// set english
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      /// set arabic
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
    }
  }

  Future<void> customChangeAppLanguage(String language) async {
    _sharedPreferences.setString(PREFS_KEY_LANG, language);
  }

  Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }



  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_LOGGED_IN) ?? false;
  }

  Future<void> setOnBoardingViewed() async {
    await _sharedPreferences.setBool(PREFS_KEY_ONBOARDONG_VIEWED, true);
  }


  Future<bool> getOnBoardingViewed() async {
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDONG_VIEWED) ?? false;
  }

  Future<void> setUserFirstSplashViewed() async {
    _sharedPreferences.setBool(PREFS_KEY_FIRST_SPLASH_VIEWED, true);
  }
  Future<bool> getFirstSplashViewed() async {
    return _sharedPreferences.getBool(PREFS_KEY_FIRST_SPLASH_VIEWED) ?? false;
  }

  ///********** USER DATA SETTER & GETTER **********

  setUserToken(String token) async {
    _sharedPreferences.setString(TOKEN, token);
  }

  getUserToken() {
    return _sharedPreferences.getString(TOKEN) ?? "";
  }
  setUserStrikes(int strikes) async {
    _sharedPreferences.setInt(STREAKS, strikes);
  }

 int getUserStreaks() {
    return _sharedPreferences.getInt(STREAKS) ?? 0;
  }
  
  setEmail(String email) async {
    _sharedPreferences.setString(EMAIL, email);
  }

  getEmail() {
    return _sharedPreferences.getString(EMAIL) ?? "";
  }

  setMobileNumber(String mobileNumber) async {
    _sharedPreferences.setString(MOBILE_NUMBER, mobileNumber);
  }

  getMobileNumber() {
    return _sharedPreferences.getString(MOBILE_NUMBER) ?? "";
  }

  setUserStage(String stage) async {
    _sharedPreferences.setString(USER_STAGE, stage);
  }

  getUserStage() {
    return _sharedPreferences.getString(USER_STAGE) ?? "";
  }

  setUserEduYear(String eduYear) async {
    _sharedPreferences.setString(USER_EDU_YEAR, eduYear);
  }

  getUserEduYear() {
    return _sharedPreferences.getString(USER_EDU_YEAR) ?? "";
  }

  Future<void> setUserArName(String userArName) async {
    _sharedPreferences.setString(USER_AR_NAME, userArName);
  }

  Future<void> setUserPicture(String userPicture) async {
    _sharedPreferences.setString(USER_PICTURE, userPicture);
  }

  getUserArName() {
    return _sharedPreferences.getString(USER_AR_NAME) ?? "";
  }

  getUserPicture() {
    return _sharedPreferences.getString(USER_PICTURE) ?? "";
  }

  Future<void> setUserGimNum(int userGimNum) async {
    _sharedPreferences.setString(USER_GIM_NUM, userGimNum.toString());
  }

  int getUserGimNum() {
    return int.parse(_sharedPreferences.getString(USER_GIM_NUM) ??
        Constants.zero.toString());
  }

  Future<void> setUserFlashNum(int userFlashNum) async {
    _sharedPreferences.setString(USER_FLASH_NUM, userFlashNum.toString());
  }

  int getUserFlashNum() {
    return int.parse(_sharedPreferences.getString(USER_FLASH_NUM) ??
        Constants.zero.toString());
  }

  Future<void> setUserTypeArName(String userTypeArName) async {
    _sharedPreferences.setString(USER_TYPE_AR_NAME, userTypeArName);
  }

  Future<String> getUserTypeArName() async {
    return _sharedPreferences.getString(USER_TYPE_AR_NAME) ?? "";
  }

  Future<void> setUserId(int userId) async {
    _sharedPreferences.setInt(USER_ID, userId);
  }

  getUserId() {
    return _sharedPreferences.getInt(USER_ID) ?? Constants.zero;
  }

  Future<void> setYearId(int yearId) async {
    _sharedPreferences.setInt(YEAR_ID, yearId);
  }

  Future<int> getYearId() async {
    return _sharedPreferences.getInt(YEAR_ID) ?? Constants.zero;
  }

  Future<void> setStudentId(int studentId) async {
    _sharedPreferences.setInt(STUDENT_ID, studentId);
  }

  Future<int> getStudentId() async {
    return _sharedPreferences.getInt(STUDENT_ID) ?? Constants.zero;
  }

  Future<void> setUserTypeId(int userTypeId) async {
    _sharedPreferences.setInt(USER_TYPE_ID, userTypeId);
  }

  Future<int> getUserTypeId() async {
    return _sharedPreferences.getInt(USER_TYPE_ID) ?? Constants.zero;
  }

  Future<void> setRoleId(int roleId) async {
    _sharedPreferences.setInt(ROLE_ID, roleId);
  }

  Future<int> getRoleId() async {
    return _sharedPreferences.getInt(ROLE_ID) ?? Constants.zero;
  }

  Future<void> setTypeId(int typeId) async {
    _sharedPreferences.setInt(TYPE_ID, typeId);
  }

  Future<int> getTypeId() async {
    return _sharedPreferences.getInt(TYPE_ID) ?? Constants.zero;
  }

  // remove user data

  Future<void> logout() async {
    await _sharedPreferences.remove(PREFS_KEY_IS_LOGGED_IN);
    await _sharedPreferences.remove(TOKEN);
    await _sharedPreferences.remove(USER_ID);
    await _sharedPreferences.remove(YEAR_ID);
    await _sharedPreferences.remove(STUDENT_ID);
    await _sharedPreferences.remove(USER_AR_NAME);
    await _sharedPreferences.remove(USER_PICTURE);
    await _sharedPreferences.remove(USER_TYPE_ID);
    await _sharedPreferences.remove(USER_TYPE_AR_NAME);
    await _sharedPreferences.remove(ROLE_ID);
    await _sharedPreferences.remove(TYPE_ID);
    await _sharedPreferences.remove(USER_GIM_NUM);
    await _sharedPreferences.remove(USER_FLASH_NUM);
    await _sharedPreferences.remove(STREAKS);
    _sharedPreferences.clear();
  }
}
