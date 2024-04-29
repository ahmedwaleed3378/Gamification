// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_rank_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentRankResponse _$StudentRankResponseFromJson(Map<String, dynamic> json) =>
    StudentRankResponse(
      top3Students: (json['top3Students'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : StudentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      mylogginStudentShortList:
          (json['mylogginStudentShortList'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : StudentResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
      studentsRankList: (json['students_rank_list'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : StudentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      resetDays: json['resetDays'] as int?,
      resetHours: json['resetHours'] as int?,
      resetMinutes: json['resetMinutes'] as int?,
      instructions: (json['Instructions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    )..resetSeconds = json['resetSeconds'] as int?;

Map<String, dynamic> _$StudentRankResponseToJson(
        StudentRankResponse instance) =>
    <String, dynamic>{
      'top3Students': instance.top3Students,
      'mylogginStudentShortList': instance.mylogginStudentShortList,
      'students_rank_list': instance.studentsRankList,
      'resetDays': instance.resetDays,
      'resetHours': instance.resetHours,
      'resetMinutes': instance.resetMinutes,
      'resetSeconds': instance.resetSeconds,
      'Instructions': instance.instructions,
    };

StudentResponse _$StudentResponseFromJson(Map<String, dynamic> json) =>
    StudentResponse(
      userId: json['userId'] as int?,
      totalPoints: (json['userExperience'] as num?)?.toDouble(),
      arName: json['userName'] as String?,
      userRank: json['userRank'] as int?,
      userProfile: json['userProfile'] as String?,
    );

Map<String, dynamic> _$StudentResponseToJson(StudentResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userExperience': instance.totalPoints,
      'userName': instance.arName,
      'userProfile': instance.userProfile,
      'userRank': instance.userRank,
    };
