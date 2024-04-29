import 'package:json_annotation/json_annotation.dart';

part 'success_request_response.g.dart';

@JsonSerializable()
class SuccessRequestResponse {
  @JsonKey(name: "returnValue")
  int? returnValue;
  @JsonKey(name: "returnString")
  String? returnString;

  SuccessRequestResponse({
    this.returnValue,
    this.returnString,
  });

  factory SuccessRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$SuccessRequestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SuccessRequestResponseToJson(this);
}