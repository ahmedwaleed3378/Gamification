// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects_of_year.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentSubjectsResponse _$StudentSubjectsResponseFromJson(
        Map<String, dynamic> json) =>
    StudentSubjectsResponse(
      subjectEducationalYears:
          (json['subjectEducationalYears'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : SubjectResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
      recentSubjects: (json['recentSubjects'] as List<dynamic>?)
          ?.map(
              (e) => RecentSubjectsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      profileData: json['ProfileData'] == null
          ? null
          : ProfileDataResponse.fromJson(
              json['ProfileData'] as Map<String, dynamic>),
      isOpen: json['isOpen'] as bool?,
    );

Map<String, dynamic> _$StudentSubjectsResponseToJson(
        StudentSubjectsResponse instance) =>
    <String, dynamic>{
      'subjectEducationalYears': instance.subjectEducationalYears,
      'recentSubjects': instance.recentSubjects,
      'ProfileData': instance.profileData,
      'isOpen': instance.isOpen,
    };

SubjectResponse _$SubjectResponseFromJson(Map<String, dynamic> json) =>
    SubjectResponse(
      subjectId: json['subject_id'] as int?,
      eduYearId: json['edu_year_id'] as int?,
      subjectArName: json['subject_ar_name'] as String?,
      subjectEnName: json['subject_en_name'] as String?,
      eduYearArName: json['eduYear_ar_name'] as String?,
      eduYearEnName: json['eduYear_en_name'] as String?,
      subjectImage: json['subjectImage'] as String?,
    );

Map<String, dynamic> _$SubjectResponseToJson(SubjectResponse instance) =>
    <String, dynamic>{
      'subject_id': instance.subjectId,
      'edu_year_id': instance.eduYearId,
      'subject_ar_name': instance.subjectArName,
      'subject_en_name': instance.subjectEnName,
      'eduYear_ar_name': instance.eduYearArName,
      'eduYear_en_name': instance.eduYearEnName,
      'subjectImage': instance.subjectImage,
    };

RecentSubjectsResponse _$RecentSubjectsResponseFromJson(
        Map<String, dynamic> json) =>
    RecentSubjectsResponse(
      subjectId: json['subject_id'] as int?,
      subjectArName: json['subject_ar_name'] as String?,
      subjectEnName: json['subject_en_name'] as String?,
      subjectImage: json['subjectImage'] as String?,
      userExamNotSolvedCount: json['userExamNotSolvedCount'] as int?,
    );

Map<String, dynamic> _$RecentSubjectsResponseToJson(
        RecentSubjectsResponse instance) =>
    <String, dynamic>{
      'subject_id': instance.subjectId,
      'subject_ar_name': instance.subjectArName,
      'subject_en_name': instance.subjectEnName,
      'subjectImage': instance.subjectImage,
      'userExamNotSolvedCount': instance.userExamNotSolvedCount,
    };

ProfileDataResponse _$ProfileDataResponseFromJson(Map<String, dynamic> json) =>
    ProfileDataResponse(
      userProfilePhoto: json['userProfilePhoto'] as String?,
      loginCounter: json['LoginCounter'] as int?,
      teacherName: (json['TotalPoints'] as num?)?.toDouble(),
      availablePoints: (json['AvailablePoints'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProfileDataResponseToJson(
        ProfileDataResponse instance) =>
    <String, dynamic>{
      'userProfilePhoto': instance.userProfilePhoto,
      'LoginCounter': instance.loginCounter,
      'TotalPoints': instance.teacherName,
      'AvailablePoints': instance.availablePoints,
    };
