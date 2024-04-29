import 'package:json_annotation/json_annotation.dart';

part 'submit_exam_response.g.dart';

@JsonSerializable()
class SubmitExamResponse {
  @JsonKey(name: 'returnValue')
  int? returnValue;
  @JsonKey(name: 'returnString')
  String? returnString;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'result')
  double? result;
  @JsonKey(name: 'total_mark')
  double? totalMark;
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'repeatable')
  bool? repeatable;
  @JsonKey(name: 'repeatableExam_Count')
  int? repeatableExamCount;

  SubmitExamResponse({
    this.message,
    this.result,
    this.totalMark,
    this.url,
    this.repeatable,
    this.repeatableExamCount,
    this.returnValue,
    this.returnString,
  });

  factory SubmitExamResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitExamResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitExamResponseToJson(this);
}
