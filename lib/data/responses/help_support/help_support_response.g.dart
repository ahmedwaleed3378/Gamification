// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help_support_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HelpSupportResponse _$HelpSupportResponseFromJson(Map<String, dynamic> json) =>
    HelpSupportResponse(
      helpContent: json['helpContent'] == null
          ? null
          : HelpContentResponse.fromJson(
              json['helpContent'] as Map<String, dynamic>),
      commonQuestionsContent: (json['commonQuestionsContent'] as List<dynamic>?)
          ?.map((e) => CommonQuestionsContentResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      privacyContent: json['privacyContent'] as String?,
      termsContent: json['termsContent'] as String?,
    );

Map<String, dynamic> _$HelpSupportResponseToJson(
        HelpSupportResponse instance) =>
    <String, dynamic>{
      'helpContent': instance.helpContent,
      'commonQuestionsContent': instance.commonQuestionsContent,
      'privacyContent': instance.privacyContent,
      'termsContent': instance.termsContent,
    };

HelpContentResponse _$HelpContentResponseFromJson(Map<String, dynamic> json) =>
    HelpContentResponse(
      companyNumbers: (json['companyNumbers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      companyEmails: (json['companyEmails'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$HelpContentResponseToJson(
        HelpContentResponse instance) =>
    <String, dynamic>{
      'companyNumbers': instance.companyNumbers,
      'companyEmails': instance.companyEmails,
    };

CommonQuestionsContentResponse _$CommonQuestionsContentResponseFromJson(
        Map<String, dynamic> json) =>
    CommonQuestionsContentResponse(
      question: json['Question'] as String?,
      answer: json['Answer'] as String?,
    );

Map<String, dynamic> _$CommonQuestionsContentResponseToJson(
        CommonQuestionsContentResponse instance) =>
    <String, dynamic>{
      'Question': instance.question,
      'Answer': instance.answer,
    };
