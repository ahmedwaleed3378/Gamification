// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_single_question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitSingleQuestionResponse _$SubmitSingleQuestionResponseFromJson(
        Map<String, dynamic> json) =>
    SubmitSingleQuestionResponse(
      returnValue: json['returnValue'] as int?,
      returnedChoice: json['returnedChoice'] as String?,
    );

Map<String, dynamic> _$SubmitSingleQuestionResponseToJson(
        SubmitSingleQuestionResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'returnedChoice': instance.returnedChoice,
    };
