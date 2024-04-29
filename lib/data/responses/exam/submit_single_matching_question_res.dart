import 'package:json_annotation/json_annotation.dart';

part 'submit_single_matching_question_res.g.dart';

@JsonSerializable()
class SubmitSingleMatchingQuestionResponse {
  @JsonKey(name: 'returnValue')
  int? returnValue;
  @JsonKey(name: 'returnedMatchingChoices')
  List<String>? returnedMatchingChoices;

  SubmitSingleMatchingQuestionResponse({this.returnValue, this.returnedMatchingChoices});


  factory SubmitSingleMatchingQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitSingleMatchingQuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitSingleMatchingQuestionResponseToJson(this);
}

@JsonSerializable()
class SubmitSingleMatchingQuestionHistoryResponse {
  @JsonKey(name: 'returnValue')
  int? returnValue;
  @JsonKey(name: 'returnedChoice')
  String? returnedChoice;

  SubmitSingleMatchingQuestionHistoryResponse({this.returnValue, this.returnedChoice});


  factory SubmitSingleMatchingQuestionHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitSingleMatchingQuestionHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitSingleMatchingQuestionHistoryResponseToJson(this);
}

@JsonSerializable()
class SubmitSingleQVoiceQuestionResponse {
  @JsonKey(name: 'returnValue')
  int? returnValue;

  SubmitSingleQVoiceQuestionResponse({this.returnValue});

  factory SubmitSingleQVoiceQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitSingleQVoiceQuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitSingleQVoiceQuestionResponseToJson(this);
}