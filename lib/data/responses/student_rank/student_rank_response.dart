import 'package:json_annotation/json_annotation.dart';

part 'student_rank_response.g.dart';

@JsonSerializable()
class StudentRankResponse {
  @JsonKey(name: "top3Students")
  List<StudentResponse?>? top3Students;
  @JsonKey(name: "mylogginStudentShortList")
  List<StudentResponse?>? mylogginStudentShortList;
  @JsonKey(name: "students_rank_list")
  List<StudentResponse?>? studentsRankList;
  @JsonKey(name: "resetDays")
  int? resetDays;
  @JsonKey(name: "resetHours")
  int? resetHours;
  @JsonKey(name: "resetMinutes")
  int? resetMinutes;
  @JsonKey(name: "resetSeconds")
  int? resetSeconds;

  @JsonKey(name: "Instructions")
  List<String>? instructions;
  StudentRankResponse({
    this.top3Students,
    this.mylogginStudentShortList,
    this.studentsRankList,
    this.resetDays,
    this.resetHours,
    this.resetMinutes,
    this.instructions,
  });

  factory StudentRankResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentRankResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentRankResponseToJson(this);
}

@JsonSerializable()
class StudentResponse {
  @JsonKey(name: "userId")
  int? userId;
  @JsonKey(name: "userExperience")
  double? totalPoints;
  @JsonKey(name: "userName")
  String? arName;
  @JsonKey(name: "userProfile")
  String? userProfile;
  @JsonKey(name: "userRank")
  int? userRank;
  StudentResponse(
      {this.userId,
      this.totalPoints,
      this.arName,
      this.userRank,
      this.userProfile});
  factory StudentResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentResponseToJson(this);
}
