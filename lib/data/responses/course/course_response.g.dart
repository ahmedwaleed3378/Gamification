// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseMainResponse _$CourseMainResponseFromJson(Map<String, dynamic> json) =>
    CourseMainResponse(
      basicCoursesList: (json['basicCoursesList'] as List<dynamic>?)
          ?.map(
              (e) => CourseContentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommendedCoursesList: (json['recommendedCoursesList'] as List<dynamic>?)
          ?.map(
              (e) => CourseContentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseMainResponseToJson(CourseMainResponse instance) =>
    <String, dynamic>{
      'basicCoursesList': instance.basicCoursesList,
      'recommendedCoursesList': instance.recommendedCoursesList,
    };

CourseContentResponse _$CourseContentResponseFromJson(
        Map<String, dynamic> json) =>
    CourseContentResponse(
      subjectId: json['subject_id'] as int?,
      subjectArName: json['subject_ar_name'] as String?,
      subjectEnName: json['subject_en_name'] as String?,
      subjectDescreption: json['subjectDescreption'] as String?,
      subjectPromoLink: json['subjectPromoLink'] as String?,
      courseCertificate: json['courseCertificate'] as bool?,
      courseMinutes: json['courseMinutes'] as int?,
      isArabic: json['isArabic'] as bool?,
      isEnglish: json['isEnglish'] as bool?,
      diplomaId: json['Diploma_id'] as int?,
      diplomaArName: json['Diploma_ar_name'] as String?,
      diplomaEnName: json['Diploma_en_name'] as String?,
      eduCompId: json['eduCompId'] as int?,
      attachPath: json['attach_path'] as String?,
      whatYouLearn: (json['whatYouLearn'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      exams: json['exams'] as int?,
      files: json['files'] as int?,
      teacherArName: json['teacher_ar_name'] as String?,
      subjectUserNumbers: json['subjectUserNumbers'] as int?,
      isCurrent: json['isCurrent'] as bool?,
    );

Map<String, dynamic> _$CourseContentResponseToJson(
        CourseContentResponse instance) =>
    <String, dynamic>{
      'subject_id': instance.subjectId,
      'subject_ar_name': instance.subjectArName,
      'subject_en_name': instance.subjectEnName,
      'subjectDescreption': instance.subjectDescreption,
      'subjectPromoLink': instance.subjectPromoLink,
      'courseCertificate': instance.courseCertificate,
      'courseMinutes': instance.courseMinutes,
      'isArabic': instance.isArabic,
      'isEnglish': instance.isEnglish,
      'Diploma_id': instance.diplomaId,
      'Diploma_ar_name': instance.diplomaArName,
      'Diploma_en_name': instance.diplomaEnName,
      'eduCompId': instance.eduCompId,
      'attach_path': instance.attachPath,
      'whatYouLearn': instance.whatYouLearn,
      'exams': instance.exams,
      'files': instance.files,
      'teacher_ar_name': instance.teacherArName,
      'subjectUserNumbers': instance.subjectUserNumbers,
      'isCurrent': instance.isCurrent,
    };
