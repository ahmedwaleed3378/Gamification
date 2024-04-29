import 'package:json_annotation/json_annotation.dart';

part 'subject_progress_details.g.dart';

@JsonSerializable()
class SubjectProgressIdResponse {
  @JsonKey(name: "subjectEducationalYear")
  SubjectProgressDetailsResponse? subjectEducationalYears;
  SubjectProgressIdResponse({this.subjectEducationalYears});

  factory SubjectProgressIdResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectProgressIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectProgressIdResponseToJson(this);
}

@JsonSerializable()
class SubjectProgressDetailsResponse {
  @JsonKey(name: "Subject_id")
  int? subjectId;
  @JsonKey(name: "edu_year_id")
  int? eduYearId;
  @JsonKey(name: "StudentTotalPointsOfSubject")
  double? studentTotalPointsOfSubject;
  @JsonKey(name: "studentTotalExperienceOfSubject")
  double? studentTotalExperienceOfSubject;
  @JsonKey(name: "SubjectStudent_Average_Degree")
  double? subjectAverage;
  @JsonKey(name: "Subject_ar_name")
  String? subjectArName;
  @JsonKey(name: "Subject_en_name")
  String? subjectEnName;
  @JsonKey(name: "eduYear_ar_name")
  String? eduYearArName;
  @JsonKey(name: "eduYear_en_name")
  String? eduYearEnName;
  @JsonKey(name: "subjectImage")
  String? subjectImage;
  @JsonKey(name: "eduUnit")
  List<EduUnitResponse>? eduUnit;

  SubjectProgressDetailsResponse({
    this.subjectId,
    this.eduYearId,
    this.subjectArName,
    this.subjectEnName,
    this.eduYearArName,
    this.eduYearEnName,
    this.subjectImage,
    this.eduUnit,
    this.studentTotalExperienceOfSubject,
    this.studentTotalPointsOfSubject,
    this.subjectAverage,
  });

  factory SubjectProgressDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectProgressDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectProgressDetailsResponseToJson(this);
}

@JsonSerializable()
class EduUnitResponse {
  @JsonKey(name: "unit_id")
  int? subjectId;
  @JsonKey(name: "unit_ar_name")
  String? unitArName;
  @JsonKey(name: "unit_en_name")
  String? unitEnName;
  @JsonKey(name: "unit_image")
  String? unitImage;
  @JsonKey(name: "studentTotalPointsOfUnit")
  double? studentTotalPointsOfUnit;
  @JsonKey(name: "studentTotalExperienceOfUnit")
  double? studentTotalExperienceOfUnit;
  @JsonKey(name: "UnitStudent_Average_Degree")
  double? unitAvrege;
  @JsonKey(name: "exams")
  List<ExamResponse>? exams;

  EduUnitResponse({
    this.subjectId,
    this.unitArName,
    this.unitEnName,
    this.unitImage,
    //  this.exams,
    this.studentTotalExperienceOfUnit,
    this.studentTotalPointsOfUnit,
    this.unitAvrege,
  });

  factory EduUnitResponse.fromJson(Map<String, dynamic> json) =>
      _$EduUnitResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EduUnitResponseToJson(this);
}

@JsonSerializable()
class ExamResponse {
  @JsonKey(name: "exam_id")
  int? examId;
  @JsonKey(name: "exam_ar_name")
  String? examArName;
  @JsonKey(name: "exam_en_name")
  String? examEnName;
  @JsonKey(name: "studentTotalPointsOfExam")
  double? studentTotalPointsOfExam;
  @JsonKey(name: "studentTotalExperienceOfExam")
  double? studentTotalExperienceOfExam;
  @JsonKey(name: "ExamStudent_Average_Degree")
  double? examStudentAverageDegree;
  ExamResponse({
    this.examId,
    this.examArName,
    this.examEnName,
    this.studentTotalPointsOfExam,
    this.studentTotalExperienceOfExam,
    this.examStudentAverageDegree,
  });

  factory ExamResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamResponseToJson(this);
}
