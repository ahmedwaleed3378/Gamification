import 'package:json_annotation/json_annotation.dart';

part 'single_question_history_response.g.dart';

@JsonSerializable()
class SingleQuestionHistoryResponse {
  @JsonKey(name: "returnValue")
  int? returnValue;
                
  @JsonKey(name: "returnedChoice")
  String? returnedChoice;

  SingleQuestionHistoryResponse({
    this.returnValue,
    this.returnedChoice,
  });

  factory SingleQuestionHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleQuestionHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SingleQuestionHistoryResponseToJson(this);
}
