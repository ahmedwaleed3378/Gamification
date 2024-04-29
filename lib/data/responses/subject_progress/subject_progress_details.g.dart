// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_progress_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectProgressIdResponse _$SubjectProgressIdResponseFromJson(
        Map<String, dynamic> json) =>
    SubjectProgressIdResponse(
      subjectEducationalYears: json['subjectEducationalYear'] == null
          ? null
          : SubjectProgressDetailsResponse.fromJson(
              json['subjectEducationalYear'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubjectProgressIdResponseToJson(
        SubjectProgressIdResponse instance) =>
    <String, dynamic>{
      'subjectEducationalYear': instance.subjectEducationalYears,
    };

SubjectProgressDetailsResponse _$SubjectProgressDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    SubjectProgressDetailsResponse(
      subjectId: json['Subject_id'] as int?,
      eduYearId: json['edu_year_id'] as int?,
      subjectArName: json['Subject_ar_name'] as String?,
      subjectEnName: json['Subject_en_name'] as String?,
      eduYearArName: json['eduYear_ar_name'] as String?,
      eduYearEnName: json['eduYear_en_name'] as String?,
      subjectImage: json['subjectImage'] as String?,
      eduUnit: (json['eduUnit'] as List<dynamic>?)
          ?.map((e) => EduUnitResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      studentTotalExperienceOfSubject:
          (json['studentTotalExperienceOfSubject'] as num?)?.toDouble(),
      studentTotalPointsOfSubject:
          (json['StudentTotalPointsOfSubject'] as num?)?.toDouble(),
      subjectAverage:
          (json['SubjectStudent_Average_Degree'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SubjectProgressDetailsResponseToJson(
        SubjectProgressDetailsResponse instance) =>
    <String, dynamic>{
      'Subject_id': instance.subjectId,
      'edu_year_id': instance.eduYearId,
      'StudentTotalPointsOfSubject': instance.studentTotalPointsOfSubject,
      'studentTotalExperienceOfSubject':
          instance.studentTotalExperienceOfSubject,
      'SubjectStudent_Average_Degree': instance.subjectAverage,
      'Subject_ar_name': instance.subjectArName,
      'Subject_en_name': instance.subjectEnName,
      'eduYear_ar_name': instance.eduYearArName,
      'eduYear_en_name': instance.eduYearEnName,
      'subjectImage': instance.subjectImage,
      'eduUnit': instance.eduUnit,
    };

EduUnitResponse _$EduUnitResponseFromJson(Map<String, dynamic> json) =>
    EduUnitResponse(
      subjectId: json['unit_id'] as int?,
      unitArName: json['unit_ar_name'] as String?,
      unitEnName: json['unit_en_name'] as String?,
      unitImage: json['unit_image'] as String?,
      studentTotalExperienceOfUnit:
          (json['studentTotalExperienceOfUnit'] as num?)?.toDouble(),
      studentTotalPointsOfUnit:
          (json['studentTotalPointsOfUnit'] as num?)?.toDouble(),
      unitAvrege: (json['UnitStudent_Average_Degree'] as num?)?.toDouble(),
    )..exams = (json['exams'] as List<dynamic>?)
        ?.map((e) => ExamResponse.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$EduUnitResponseToJson(EduUnitResponse instance) =>
    <String, dynamic>{
      'unit_id': instance.subjectId,
      'unit_ar_name': instance.unitArName,
      'unit_en_name': instance.unitEnName,
      'unit_image': instance.unitImage,
      'studentTotalPointsOfUnit': instance.studentTotalPointsOfUnit,
      'studentTotalExperienceOfUnit': instance.studentTotalExperienceOfUnit,
      'UnitStudent_Average_Degree': instance.unitAvrege,
      'exams': instance.exams,
    };

ExamResponse _$ExamResponseFromJson(Map<String, dynamic> json) => ExamResponse(
      examId: json['exam_id'] as int?,
      examArName: json['exam_ar_name'] as String?,
      examEnName: json['exam_en_name'] as String?,
      studentTotalPointsOfExam:
          (json['studentTotalPointsOfExam'] as num?)?.toDouble(),
      studentTotalExperienceOfExam:
          (json['studentTotalExperienceOfExam'] as num?)?.toDouble(),
      examStudentAverageDegree:
          (json['ExamStudent_Average_Degree'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ExamResponseToJson(ExamResponse instance) =>
    <String, dynamic>{
      'exam_id': instance.examId,
      'exam_ar_name': instance.examArName,
      'exam_en_name': instance.examEnName,
      'studentTotalPointsOfExam': instance.studentTotalPointsOfExam,
      'studentTotalExperienceOfExam': instance.studentTotalExperienceOfExam,
      'ExamStudent_Average_Degree': instance.examStudentAverageDegree,
    };
