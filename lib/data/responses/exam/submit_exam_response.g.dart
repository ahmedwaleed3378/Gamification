// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_exam_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitExamResponse _$SubmitExamResponseFromJson(Map<String, dynamic> json) =>
    SubmitExamResponse(
      message: json['message'] as String?,
      result: (json['result'] as num?)?.toDouble(),
      totalMark: (json['total_mark'] as num?)?.toDouble(),
      url: json['url'] as String?,
      repeatable: json['repeatable'] as bool?,
      repeatableExamCount: json['repeatableExam_Count'] as int?,
      returnValue: json['returnValue'] as int?,
      returnString: json['returnString'] as String?,
    );

Map<String, dynamic> _$SubmitExamResponseToJson(SubmitExamResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'returnString': instance.returnString,
      'message': instance.message,
      'result': instance.result,
      'total_mark': instance.totalMark,
      'url': instance.url,
      'repeatable': instance.repeatable,
      'repeatableExam_Count': instance.repeatableExamCount,
    };
