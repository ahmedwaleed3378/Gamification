// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teaching_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestTeachingResponse _$RequestTeachingResponseFromJson(
        Map<String, dynamic> json) =>
    RequestTeachingResponse(
      countItems: json['countItems'] as int?,
      requests: (json['Requests'] as List<dynamic>?)
          ?.map((e) =>
              RequestTeachingItemsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RequestTeachingResponseToJson(
        RequestTeachingResponse instance) =>
    <String, dynamic>{
      'countItems': instance.countItems,
      'Requests': instance.requests,
    };

RequestTeachingItemsResponse _$RequestTeachingItemsResponseFromJson(
        Map<String, dynamic> json) =>
    RequestTeachingItemsResponse(
      id: json['id'] as int?,
      employeeName: json['employee_name'] as String?,
      courseArName: json['course_ar_name'] as String?,
      courseEnName: json['course_en_name'] as String?,
      status: json['status'] as bool?,
      numberOfDays: json['numberOfDays'] as int?,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$RequestTeachingItemsResponseToJson(
        RequestTeachingItemsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employee_name': instance.employeeName,
      'course_ar_name': instance.courseArName,
      'course_en_name': instance.courseEnName,
      'status': instance.status,
      'numberOfDays': instance.numberOfDays,
      'details': instance.details,
    };
