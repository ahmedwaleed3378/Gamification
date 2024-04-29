import 'package:json_annotation/json_annotation.dart';

part 'subjects_of_year.g.dart';

@JsonSerializable()
class StudentSubjectsResponse {
  @JsonKey(name: "subjectEducationalYears")
  List<SubjectResponse?>? subjectEducationalYears;

  @JsonKey(name: "recentSubjects")
  List<RecentSubjectsResponse>? recentSubjects;
  @JsonKey(name: "ProfileData")
  ProfileDataResponse? profileData;
  @JsonKey(name: "isOpen")
  bool? isOpen;

  StudentSubjectsResponse({
    this.subjectEducationalYears,
    this.recentSubjects,
    this.profileData,
    this.isOpen
  });

  factory StudentSubjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentSubjectsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentSubjectsResponseToJson(this);
}

@JsonSerializable()
class SubjectResponse {
  @JsonKey(name: "subject_id")
  int? subjectId;
  @JsonKey(name: "edu_year_id")
  int? eduYearId;
  @JsonKey(name: "subject_ar_name")
  String? subjectArName;
  @JsonKey(name: "subject_en_name")
  String? subjectEnName;
  @JsonKey(name: "eduYear_ar_name")
  String? eduYearArName;
  @JsonKey(name: "eduYear_en_name")
  String? eduYearEnName;
  @JsonKey(name: "subjectImage")
  String? subjectImage;
  SubjectResponse({
    this.subjectId,
    this.eduYearId,
    this.subjectArName,
    this.subjectEnName,
    this.eduYearArName,
    this.eduYearEnName,
    this.subjectImage,
  });

  factory SubjectResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectResponseToJson(this);
}

@JsonSerializable()
class RecentSubjectsResponse {
  @JsonKey(name: "subject_id")
  int? subjectId;
  @JsonKey(name: "subject_ar_name")
  String? subjectArName;
  @JsonKey(name: "subject_en_name")
  String? subjectEnName;
  @JsonKey(name: "subjectImage")
  String? subjectImage;
  @JsonKey(name: "userExamNotSolvedCount")
  int? userExamNotSolvedCount;
  RecentSubjectsResponse(
      {this.subjectId,
      this.subjectArName,
      this.subjectEnName,
      this.subjectImage,
      this.userExamNotSolvedCount});

  factory RecentSubjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$RecentSubjectsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecentSubjectsResponseToJson(this);
}

@JsonSerializable()
class ProfileDataResponse {
  @JsonKey(name: "userProfilePhoto")
  String? userProfilePhoto;
  @JsonKey(name: "LoginCounter")
  int? loginCounter;
  @JsonKey(name: "TotalPoints")
  double? teacherName;
  @JsonKey(name: "AvailablePoints")
  double? availablePoints;
  ProfileDataResponse({
    this.userProfilePhoto,
    this.loginCounter,
    this.teacherName,
    this.availablePoints,
  });
  factory ProfileDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataResponseToJson(this);
}
