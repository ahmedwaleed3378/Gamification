import 'package:json_annotation/json_annotation.dart';

part 'submit_single_question_response.g.dart';

@JsonSerializable()
class SubmitSingleQuestionResponse {
  @JsonKey(name: 'returnValue')
  int? returnValue;
  @JsonKey(name: 'returnedChoice')
  String? returnedChoice;

  SubmitSingleQuestionResponse({
    this.returnValue,
    this.returnedChoice,
  });

  factory SubmitSingleQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitSingleQuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitSingleQuestionResponseToJson(this);
}
