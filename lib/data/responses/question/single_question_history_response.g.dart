// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_question_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleQuestionHistoryResponse _$SingleQuestionHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    SingleQuestionHistoryResponse(
      returnValue: json['returnValue'] as int?,
      returnedChoice: json['returnedChoice'] as String?,
    );

Map<String, dynamic> _$SingleQuestionHistoryResponseToJson(
        SingleQuestionHistoryResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'returnedChoice': instance.returnedChoice,
    };
