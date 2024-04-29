// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_subcourse_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategorySubCourseResponse _$CategorySubCourseResponseFromJson(
        Map<String, dynamic> json) =>
    CategorySubCourseResponse(
      id: json['id'] as int?,
      courseArName: json['course_ar_name'] as String?,
      courseEnName: json['course_en_name'] as String?,
      approve: json['approve'] as bool?,
      hasRequestBefore: json['hasRequestBefore'] as bool?,
      attachFile: json['attach_file'] as String?,
      courseTime: json['courseTime'] as int?,
    );

Map<String, dynamic> _$CategorySubCourseResponseToJson(
        CategorySubCourseResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_ar_name': instance.courseArName,
      'course_en_name': instance.courseEnName,
      'approve': instance.approve,
      'hasRequestBefore': instance.hasRequestBefore,
      'attach_file': instance.attachFile,
      'courseTime': instance.courseTime,
    };
