import 'package:json_annotation/json_annotation.dart';

part 'map_response.g.dart';

@JsonSerializable()
class MapResponse {
  @JsonKey(name: "subjectEducationalYears")
  SubjectMapResponse? subjectMapResponse;

  MapResponse({
    this.subjectMapResponse,
  });

  factory MapResponse.fromJson(Map<String, dynamic> json) =>
      _$MapResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MapResponseToJson(this);
}

@JsonSerializable()
class SubjectMapResponse {
  @JsonKey(name: "subject_id")
  int? subjectId;
  @JsonKey(name: "subject_ar_name")
  String? subjectArMame;
  @JsonKey(name: "subject_en_name")
  String? subjectEnName;
  @JsonKey(name: "edu_year_id")
  int? eduYearId;
  @JsonKey(name: "eduYear_ar_name")
  String? eduYearArName;
  @JsonKey(name: "eduYear_en_name")
  String? eduYearEnName;
  @JsonKey(name: "subjectImage")
  String? subjectImage;
  @JsonKey(name: "subjectExams")
  List<SubjectExamsResponse>? subjectExams;
  @JsonKey(name: "eduUnit")
  List<EduUnitResponse>? eduUnitResponse;

  SubjectMapResponse({
    this.subjectId,
    this.subjectArMame,
    this.subjectEnName,
    this.eduYearId,
    this.eduYearArName,
    this.eduYearEnName,
    this.subjectImage,
    this.subjectExams,
    this.eduUnitResponse,
  });

  factory SubjectMapResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectMapResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectMapResponseToJson(this);
}

@JsonSerializable()
class EduUnitResponse {
  @JsonKey(name: "unit_id")
  int? unitId;
  @JsonKey(name: "unit_ar_name")
  String? unitArName;
  @JsonKey(name: "unit_en_name")
  String? unitEnName;
  @JsonKey(name: "unit_image")
  String? unitImage;
  @JsonKey(name: "unitExams")
  List<SubjectExamsResponse>? unitExams;
  EduUnitResponse({
    this.unitId,
    this.unitArName,
    this.unitEnName,
    this.unitImage,
    this.unitExams,
  });

  factory EduUnitResponse.fromJson(Map<String, dynamic> json) =>
      _$EduUnitResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EduUnitResponseToJson(this);
}

@JsonSerializable()
class SubjectExamsResponse {
  @JsonKey(name: "exam_id")
  int? examId;
  @JsonKey(name: "exam_ar_name")
  String? examArName;
  @JsonKey(name: "exam_en_name")
  String? examEnName;
  @JsonKey(name: "isCompleted")
  bool? isCompleted;
  @JsonKey(name: "notResolved")
  bool? notResolved;
  @JsonKey(name: "exam_time")
  int? examTime;
  @JsonKey(name: "TotalResult")
  double? totalResult;
  @JsonKey(name: "userExamPoint")
  double? userExamPoint;
  @JsonKey(name: "userExamExperince")
  double? userExamExperince;
  @JsonKey(name: "examExperience")
  double? examExperience;
  @JsonKey(name: "examMark")
  double? examMark;
  SubjectExamsResponse(
      {this.examId,
      this.examArName,
      this.examEnName,
      this.isCompleted,
      this.notResolved,
      this.examTime,
      this.totalResult,
      this.userExamPoint,
      this.userExamExperince,
      this.examMark,
      this.examExperience
      });

  factory SubjectExamsResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectExamsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectExamsResponseToJson(this);
}