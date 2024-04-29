// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCourseCategoryResponse _$AllCourseCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    AllCourseCategoryResponse(
      returnValue: json['returnValue'] as int?,
      courseCategoryList: (json['courseCategoryList'] as List<dynamic>?)
          ?.map((e) =>
              CourseCategoryListResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllCourseCategoryResponseToJson(
        AllCourseCategoryResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'courseCategoryList': instance.courseCategoryList,
    };

CourseCategoryListResponse _$CourseCategoryListResponseFromJson(
        Map<String, dynamic> json) =>
    CourseCategoryListResponse(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
    );

Map<String, dynamic> _$CourseCategoryListResponseToJson(
        CourseCategoryListResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ar_name': instance.arName,
      'en_name': instance.enName,
    };
