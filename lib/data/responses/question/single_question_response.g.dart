// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleQuestionResponse _$SingleQuestionResponseFromJson(
        Map<String, dynamic> json) =>
    SingleQuestionResponse(
      returnValue: json['returnValue'] as int?,
      returnedChoice: (json['returnedChoice'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SingleQuestionResponseToJson(
        SingleQuestionResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'returnedChoice': instance.returnedChoice,
    };
