import 'package:json_annotation/json_annotation.dart';

part 'single_question_response.g.dart';

@JsonSerializable()
class SingleQuestionResponse {
  @JsonKey(name: "returnValue")
  int? returnValue;
  @JsonKey(name: "returnedChoice")
  List<String>? returnedChoice;

  SingleQuestionResponse({
    this.returnValue,
    this.returnedChoice,
  });

  factory SingleQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleQuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SingleQuestionResponseToJson(this);

}
