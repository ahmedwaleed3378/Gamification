import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  @JsonKey(name: "returnValue")
  int? returnValue;
  @JsonKey(name: "returnString")
  String? returnString;
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
  @JsonKey(name: "token")
  TokenResponse? token;

  RegisterResponse({
    this.returnValue,
    this.returnString,
    this.userId,
    this.userArName,
    this.userPicture,
    this.userTypeId,
    this.userStage,
    this.userEduYaer,
    this.userTypeArName,
    this.token,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class TokenResponse {
  @JsonKey(name: "funcs")
  int? funcs;
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

  TokenResponse({
    this.funcs,
    this.eduCompList,
    this.token,
    this.returnValue,
    this.roleId,
    this.typeId,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}

@JsonSerializable()
class AllStagesResponse {
  @JsonKey(name: "stage")
  StageResponse? stages;
  @JsonKey(name: "stageCountryName")
  String? stageCountryName;
  AllStagesResponse({
    this.stages,
    this.stageCountryName,
  });
  factory AllStagesResponse.fromJson(Map<String, dynamic> json) =>
      _$AllStagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllStagesResponseToJson(this);
}

@JsonSerializable()
class StageResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "stage_ar_name")
  String? stageArName;
  @JsonKey(name: "stage_en_name")
  String? stageEnName;
  @JsonKey(name: "state")
  bool? state;
  @JsonKey(name: "ImagePath")
  String? imagePath;
  @JsonKey(name: "StageCountr")
  int? stageCounter;
  @JsonKey(name: "EnglishStage")
  bool? isEnhlishStage;
  @JsonKey(name: "CountryID")
  int? countryId;
  @JsonKey(name: "CreationDate")
  String? creationDate;
  @JsonKey(name: "CreationUserId")
  int? creationUserId;
  @JsonKey(name: "EditedUserId")
  int? editedUserId;
  @JsonKey(name: "EditedDate")
  String? editedDate;
  @JsonKey(name: "centerId")
  int? centerId;
  @JsonKey(name: "CreateBranchId")
  int? createBranchId;
  @JsonKey(name: "UpdateBranchId")
  int? updateBranchId;
  StageResponse({
    this.stageArName,
    this.stageEnName,
    this.state,
    this.imagePath,
    this.stageCounter,
    this.isEnhlishStage,
    this.countryId,
    this.creationDate,
    this.creationUserId,
    this.editedUserId,
    this.editedDate,
    this.centerId,
    this.createBranchId,
    this.updateBranchId,
  });

  factory StageResponse.fromJson(Map<String, dynamic> json) =>
      _$StageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StageResponseToJson(this);
}

@JsonSerializable()
class AllEduYearsResponse {
  @JsonKey(name: "eduYearsList")
  List<EduYearResponse?>? eduYears;

  AllEduYearsResponse({
    this.eduYears,
  });
  factory AllEduYearsResponse.fromJson(Map<String, dynamic> json) =>
      _$AllEduYearsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllEduYearsResponseToJson(this);
}

@JsonSerializable()
class EduYearResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "Educational_year_en_name")
  String? enName;
  @JsonKey(name: "Educational_year_ar_name")
  String? arName;
  EduYearResponse({
    this.id,
    this.enName,
    this.arName,
  });
  factory EduYearResponse.fromJson(Map<String, dynamic> json) =>
      _$EduYearResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EduYearResponseToJson(this);
}

@JsonSerializable()
class CheckEmailAndPhoneResponse {
  @JsonKey(name: "isEmailExist")
  bool? isEmailExist;
  @JsonKey(name: "isMobileExist")
  bool? isMobileExist;
  CheckEmailAndPhoneResponse({
    this.isEmailExist,
    this.isMobileExist,
  });
  factory CheckEmailAndPhoneResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckEmailAndPhoneResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckEmailAndPhoneResponseToJson(this);
}
