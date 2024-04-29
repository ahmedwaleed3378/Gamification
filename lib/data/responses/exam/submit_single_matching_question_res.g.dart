// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_single_matching_question_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitSingleMatchingQuestionResponse
    _$SubmitSingleMatchingQuestionResponseFromJson(Map<String, dynamic> json) =>
        SubmitSingleMatchingQuestionResponse(
          returnValue: json['returnValue'] as int?,
          returnedMatchingChoices:
              (json['returnedMatchingChoices'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList(),
        );

Map<String, dynamic> _$SubmitSingleMatchingQuestionResponseToJson(
        SubmitSingleMatchingQuestionResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'returnedMatchingChoices': instance.returnedMatchingChoices,
    };

SubmitSingleMatchingQuestionHistoryResponse
    _$SubmitSingleMatchingQuestionHistoryResponseFromJson(
            Map<String, dynamic> json) =>
        SubmitSingleMatchingQuestionHistoryResponse(
          returnValue: json['returnValue'] as int?,
          returnedChoice: json['returnedChoice'] as String?,
        );

Map<String, dynamic> _$SubmitSingleMatchingQuestionHistoryResponseToJson(
        SubmitSingleMatchingQuestionHistoryResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'returnedChoice': instance.returnedChoice,
    };

SubmitSingleQVoiceQuestionResponse _$SubmitSingleQVoiceQuestionResponseFromJson(
        Map<String, dynamic> json) =>
    SubmitSingleQVoiceQuestionResponse(
      returnValue: json['returnValue'] as int?,
    );

Map<String, dynamic> _$SubmitSingleQVoiceQuestionResponseToJson(
        SubmitSingleQVoiceQuestionResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
    };
