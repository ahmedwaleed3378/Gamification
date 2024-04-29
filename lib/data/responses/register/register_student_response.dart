import 'package:json_annotation/json_annotation.dart';

part 'register_student_response.g.dart';

@JsonSerializable()
class RegisterStudentResponse {
  @JsonKey(name: "returnValue")
  int? returnValue;
  @JsonKey(name: "returnString")
  String? returnString;
  @JsonKey(name: "student_ID")
  int? studentID;
  @JsonKey(name: "user_ID")
  int? userID;

  RegisterStudentResponse({
    this.returnValue,
    this.returnString,
    this.studentID,
    this.userID,
  });

  factory RegisterStudentResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterStudentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterStudentResponseToJson(this);
}
