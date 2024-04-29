// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectsProgressResponse _$SubjectsProgressResponseFromJson(
        Map<String, dynamic> json) =>
    SubjectsProgressResponse(
      subjectEducationalYears:
          (json['subjectEducationalYear'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : SubjectProgressResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$SubjectsProgressResponseToJson(
        SubjectsProgressResponse instance) =>
    <String, dynamic>{
      'subjectEducationalYear': instance.subjectEducationalYears,
    };

SubjectProgressResponse _$SubjectProgressResponseFromJson(
        Map<String, dynamic> json) =>
    SubjectProgressResponse(
      subjectId: json['subject_id'] as int?,
      eduYearId: json['edu_year_id'] as int?,
      subjectArName: json['subject_ar_name'] as String?,
      subjectEnName: json['subject_en_name'] as String?,
      eduYearArName: json['eduYear_ar_name'] as String?,
      eduYearEnName: json['eduYear_en_name'] as String?,
      subjectImage: json['subjectImage'] as String?,
      examCount: json['exam_count'] as int?,
      progressBar: json['progressBar'] as int?,
      unitCount: json['unit_count'] as int?,
      subjectDescription: json['subjectDescription'] as String?,
    );

Map<String, dynamic> _$SubjectProgressResponseToJson(
        SubjectProgressResponse instance) =>
    <String, dynamic>{
      'subject_id': instance.subjectId,
      'edu_year_id': instance.eduYearId,
      'exam_count': instance.examCount,
      'unit_count': instance.unitCount,
      'progressBar': instance.progressBar,
      'subject_ar_name': instance.subjectArName,
      'subject_en_name': instance.subjectEnName,
      'eduYear_ar_name': instance.eduYearArName,
      'eduYear_en_name': instance.eduYearEnName,
      'subjectImage': instance.subjectImage,
      'subjectDescription': instance.subjectDescription,
    };
