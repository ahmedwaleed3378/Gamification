import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "returnValue")
  int? returnValue;
  @JsonKey(name: "returnString")
  String? returnString;
  @JsonKey(name: "yearId")
  int? yearId;
  @JsonKey(name: "studentId")
  int? studentId;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "user_ar_name")
  String? userArName;
  @JsonKey(name: "user_picture")
  String? userPicture;
  @JsonKey(name: "user_type_id")
  int? userTypeId;
  @JsonKey(name: "user_type_ar_name")
  String? userTypeArName;
  @JsonKey(name: "user_stageName")
  String? userStage;
  @JsonKey(name: "user_eduYearName")
  String? userEduYaer;
  @JsonKey(name: "authToken")
  AuthToken? authToken;
  @JsonKey(name: "TotallPoints")
  double?totallPoints;
  @JsonKey(name: "loginCounter")
  int?loginCounter;

  LoginResponse({
    this.returnValue,
    this.returnString,
    this.yearId,
    this.studentId,
    this.userId,
    this.userArName,
    this.userPicture,
    this.userTypeId,
    this.userTypeArName,
    this.authToken,
    this.userStage,
    this.userEduYaer,
    this.totallPoints,
    this.loginCounter
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class AuthToken {
  @JsonKey(name: "EduCompList")
  List<int>? eduCompList;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "returnValue")
  int? returnValue;
  @JsonKey(name: "role_Id")
  int? roleId;
  @JsonKey(name: "type_Id")
  int? typeId;

  AuthToken({
    this.eduCompList,
    this.token,
    this.returnValue,
    this.roleId,
    this.typeId,
  });
  factory AuthToken.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenToJson(this);
}
