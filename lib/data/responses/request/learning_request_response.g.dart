// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestLearningResponse _$RequestLearningResponseFromJson(
        Map<String, dynamic> json) =>
    RequestLearningResponse(
      countItems: json['countItems'] as int?,
      requests: (json['Requests'] as List<dynamic>?)
          ?.map((e) =>
              RequestLearningItemsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RequestLearningResponseToJson(
        RequestLearningResponse instance) =>
    <String, dynamic>{
      'countItems': instance.countItems,
      'Requests': instance.requests,
    };

RequestLearningItemsResponse _$RequestLearningItemsResponseFromJson(
        Map<String, dynamic> json) =>
    RequestLearningItemsResponse(
      id: json['id'] as int?,
      courseArName: json['course_ar_name'] as String?,
      courseEnName: json['course_en_name'] as String?,
      status: json['status'] as bool?,
      numberOfDays: json['numberOfDays'] as int?,
      reasonOfRequest: json['reasonOfRequest'] as String?,
    );

Map<String, dynamic> _$RequestLearningItemsResponseToJson(
        RequestLearningItemsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_ar_name': instance.courseArName,
      'course_en_name': instance.courseEnName,
      'status': instance.status,
      'numberOfDays': instance.numberOfDays,
      'reasonOfRequest': instance.reasonOfRequest,
    };
