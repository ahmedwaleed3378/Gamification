import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  @JsonKey(name: "user")
  UserResponse? user;
  @JsonKey(name: "picturePath")
  String? picturePath;
  @JsonKey(name: "userType")
  int? userType;
  @JsonKey(name: "student_eduYearId")
  int? eduYearId;
  @JsonKey(name: "oldPassword")
  String? oldPassword;
  @JsonKey(name: "newPassword")
  String? newPassword;
  @JsonKey(name: "confirmPassword")
  String? confirmPassword;
  @JsonKey(name: "profilePicture")
  String? profilePicture;
  @JsonKey(name: "teacher_subjects")
  String? teacherSubjects;
  @JsonKey(name: "student_mv")
  String? studentMv;
  @JsonKey(name: "examSubjects")
  String? examSubjects;
  @JsonKey(name: "student")
  String? student;
  @JsonKey(name: "teacher")
  String? teacher;
  @JsonKey(name: "student_stage")
  String? studentStage;
  @JsonKey(name: "student_eduYear")
  String? studentEduYear;
  @JsonKey(name: "TotallPoints")
  double? totallPoints;
  @JsonKey(name: "isEduYearEditable")
  bool? isEduYearEditable;

  ProfileResponse(
      {this.user,
      this.picturePath,
      this.userType,
      this.oldPassword,
      this.newPassword,
      this.confirmPassword,
      this.profilePicture,
      this.teacherSubjects,
      this.studentMv,
      this.examSubjects,
      this.student,
      this.teacher,
      this.studentStage,
      this.studentEduYear,
      this.totallPoints,
      this.isEduYearEditable,
      this.eduYearId
      });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "user_ID")
  int? userID;
  @JsonKey(name: "account_email")
  String? accountEmail;
  @JsonKey(name: "account_password")
  String? accountPassword;
  @JsonKey(name: "ConfirmPassword")
  String? confirmPassword;
  @JsonKey(name: "roleId")
  int? roleId;
  @JsonKey(name: "reserveId")
  int? reserveId;
  @JsonKey(name: "IsAdmin")
  bool? isAdmin;
  @JsonKey(name: "profilePictureId")
  int? profilePictureId;
  @JsonKey(name: "ar_name")
  String? arName;
  @JsonKey(name: "date_of_birth")
  String? dateOfBirth;
  @JsonKey(name: "gender_id")
  int? genderId;
  @JsonKey(name: "gov_id")
  int? govId;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "mobile")
  String? mobile;
  @JsonKey(name: "state")
  bool? state;
  @JsonKey(name: "credits")
  double? credits;
  @JsonKey(name: "IsTestAccount")
  bool? isTestAccount;
  @JsonKey(name: "country_id")
  int? countryId;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "fullyRegistered")
  bool? fullyRegistered;
  @JsonKey(name: "verified")
  bool? verified;
  @JsonKey(name: "creationDate")
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
  @JsonKey(name: "RegistrationReferCode")
  String? registrationReferCode;
  @JsonKey(name: "userTypeId")
  int? userTypeId;
  @JsonKey(name: "loginCounter")
  int? loginCounter;

  UserResponse(
      {this.userID,
      this.accountEmail,
      this.accountPassword,
      this.confirmPassword,
      this.roleId,
      this.reserveId,
      this.isAdmin,
      this.profilePictureId,
      this.arName,
      this.dateOfBirth,
      this.genderId,
      this.govId,
      this.code,
      this.mobile,
      this.state,
      this.credits,
      this.isTestAccount,
      this.countryId,
      this.description,
      this.fullyRegistered,
      this.verified,
      this.creationDate,
      this.creationUserId,
      this.editedUserId,
      this.editedDate,
      this.centerId,
      this.createBranchId,
      this.updateBranchId,
      this.registrationReferCode,
      this.userTypeId,
      this.loginCounter});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class EditProfileResponse {
  @JsonKey(name: "returnValue")
  int? returnValue;
  @JsonKey(name: "returnMsg")
  String? returnMsg;
  EditProfileResponse(this.returnValue, this.returnMsg);
  factory EditProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileResponseToJson(this);
}
