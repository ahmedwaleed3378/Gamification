// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      returnValue: json['returnValue'] as int?,
      returnString: json['returnString'] as String?,
      yearId: json['yearId'] as int?,
      studentId: json['studentId'] as int?,
      userId: json['user_id'] as int?,
      userArName: json['user_ar_name'] as String?,
      userPicture: json['user_picture'] as String?,
      userTypeId: json['user_type_id'] as int?,
      userTypeArName: json['user_type_ar_name'] as String?,
      authToken: json['authToken'] == null
          ? null
          : AuthToken.fromJson(json['authToken'] as Map<String, dynamic>),
      userStage: json['user_stageName'] as String?,
      userEduYaer: json['user_eduYearName'] as String?,
      totallPoints: (json['TotallPoints'] as num?)?.toDouble(),
      loginCounter: json['loginCounter'] as int?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'returnString': instance.returnString,
      'yearId': instance.yearId,
      'studentId': instance.studentId,
      'user_id': instance.userId,
      'user_ar_name': instance.userArName,
      'user_picture': instance.userPicture,
      'user_type_id': instance.userTypeId,
      'user_type_ar_name': instance.userTypeArName,
      'user_stageName': instance.userStage,
      'user_eduYearName': instance.userEduYaer,
      'authToken': instance.authToken,
      'TotallPoints': instance.totallPoints,
      'loginCounter': instance.loginCounter,
    };

AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) => AuthToken(
      eduCompList: (json['EduCompList'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      token: json['token'] as String?,
      returnValue: json['returnValue'] as int?,
      roleId: json['role_Id'] as int?,
      typeId: json['type_Id'] as int?,
    );

Map<String, dynamic> _$AuthTokenToJson(AuthToken instance) => <String, dynamic>{
      'EduCompList': instance.eduCompList,
      'token': instance.token,
      'returnValue': instance.returnValue,
      'role_Id': instance.roleId,
      'type_Id': instance.typeId,
    };
