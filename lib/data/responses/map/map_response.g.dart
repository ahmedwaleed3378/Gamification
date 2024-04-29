// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapResponse _$MapResponseFromJson(Map<String, dynamic> json) => MapResponse(
      subjectMapResponse: json['subjectEducationalYears'] == null
          ? null
          : SubjectMapResponse.fromJson(
              json['subjectEducationalYears'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MapResponseToJson(MapResponse instance) =>
    <String, dynamic>{
      'subjectEducationalYears': instance.subjectMapResponse,
    };

SubjectMapResponse _$SubjectMapResponseFromJson(Map<String, dynamic> json) =>
    SubjectMapResponse(
      subjectId: json['subject_id'] as int?,
      subjectArMame: json['subject_ar_name'] as String?,
      subjectEnName: json['subject_en_name'] as String?,
      eduYearId: json['edu_year_id'] as int?,
      eduYearArName: json['eduYear_ar_name'] as String?,
      eduYearEnName: json['eduYear_en_name'] as String?,
      subjectImage: json['subjectImage'] as String?,
      subjectExams: (json['subjectExams'] as List<dynamic>?)
          ?.map((e) => SubjectExamsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      eduUnitResponse: (json['eduUnit'] as List<dynamic>?)
          ?.map((e) => EduUnitResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectMapResponseToJson(SubjectMapResponse instance) =>
    <String, dynamic>{
      'subject_id': instance.subjectId,
      'subject_ar_name': instance.subjectArMame,
      'subject_en_name': instance.subjectEnName,
      'edu_year_id': instance.eduYearId,
      'eduYear_ar_name': instance.eduYearArName,
      'eduYear_en_name': instance.eduYearEnName,
      'subjectImage': instance.subjectImage,
      'subjectExams': instance.subjectExams,
      'eduUnit': instance.eduUnitResponse,
    };

EduUnitResponse _$EduUnitResponseFromJson(Map<String, dynamic> json) =>
    EduUnitResponse(
      unitId: json['unit_id'] as int?,
      unitArName: json['unit_ar_name'] as String?,
      unitEnName: json['unit_en_name'] as String?,
      unitImage: json['unit_image'] as String?,
      unitExams: (json['unitExams'] as List<dynamic>?)
          ?.map((e) => SubjectExamsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EduUnitResponseToJson(EduUnitResponse instance) =>
    <String, dynamic>{
      'unit_id': instance.unitId,
      'unit_ar_name': instance.unitArName,
      'unit_en_name': instance.unitEnName,
      'unit_image': instance.unitImage,
      'unitExams': instance.unitExams,
    };

SubjectExamsResponse _$SubjectExamsResponseFromJson(
        Map<String, dynamic> json) =>
    SubjectExamsResponse(
      examId: json['exam_id'] as int?,
      examArName: json['exam_ar_name'] as String?,
      examEnName: json['exam_en_name'] as String?,
      isCompleted: json['isCompleted'] as bool?,
      notResolved: json['notResolved'] as bool?,
      examTime: json['exam_time'] as int?,
      totalResult: (json['TotalResult'] as num?)?.toDouble(),
      userExamPoint: (json['userExamPoint'] as num?)?.toDouble(),
      userExamExperince: (json['userExamExperince'] as num?)?.toDouble(),
      examMark: (json['examMark'] as num?)?.toDouble(),
      examExperience: (json['examExperience'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SubjectExamsResponseToJson(
        SubjectExamsResponse instance) =>
    <String, dynamic>{
      'exam_id': instance.examId,
      'exam_ar_name': instance.examArName,
      'exam_en_name': instance.examEnName,
      'isCompleted': instance.isCompleted,
      'notResolved': instance.notResolved,
      'exam_time': instance.examTime,
      'TotalResult': instance.totalResult,
      'userExamPoint': instance.userExamPoint,
      'userExamExperince': instance.userExamExperince,
      'examExperience': instance.examExperience,
      'examMark': instance.examMark,
    };
