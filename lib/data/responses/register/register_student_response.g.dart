// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_student_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterStudentResponse _$RegisterStudentResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterStudentResponse(
      returnValue: json['returnValue'] as int?,
      returnString: json['returnString'] as String?,
      studentID: json['student_ID'] as int?,
      userID: json['user_ID'] as int?,
    );

Map<String, dynamic> _$RegisterStudentResponseToJson(
        RegisterStudentResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'returnString': instance.returnString,
      'student_ID': instance.studentID,
      'user_ID': instance.userID,
    };
