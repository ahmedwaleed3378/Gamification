// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_courses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCoursesRequestResponse _$AllCoursesRequestResponseFromJson(
        Map<String, dynamic> json) =>
    AllCoursesRequestResponse(
      returnValue: json['returnValue'] as int?,
      courses: (json['Courses'] as List<dynamic>?)
          ?.map((e) =>
              CoursesRequestItemsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllCoursesRequestResponseToJson(
        AllCoursesRequestResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'Courses': instance.courses,
    };

CoursesRequestItemsResponse _$CoursesRequestItemsResponseFromJson(
        Map<String, dynamic> json) =>
    CoursesRequestItemsResponse(
      id: json['id'] as int?,
      courseArName: json['course_ar_name'] as String?,
      courseEnName: json['course_en_name'] as String?,
    );

Map<String, dynamic> _$CoursesRequestItemsResponseToJson(
        CoursesRequestItemsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_ar_name': instance.courseArName,
      'course_en_name': instance.courseEnName,
    };
