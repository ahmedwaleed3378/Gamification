import 'package:json_annotation/json_annotation.dart';

  part 'subjects_progress.g.dart';
@JsonSerializable()
class SubjectsProgressResponse {
  @JsonKey(name: "subjectEducationalYear")
  List<SubjectProgressResponse?>? subjectEducationalYears;
  SubjectsProgressResponse(
      {this.subjectEducationalYears});

  factory SubjectsProgressResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectsProgressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectsProgressResponseToJson(this);
}

@JsonSerializable()
class SubjectProgressResponse {
  @JsonKey(name: "subject_id")
  int? subjectId;
  @JsonKey(name: "edu_year_id")
  int? eduYearId;
  @JsonKey(name: "exam_count")
  int? examCount;
  @JsonKey(name: "unit_count")
  int? unitCount;
  @JsonKey(name: "progressBar")
  int? progressBar;
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
  @JsonKey(name: "subjectDescription")
  String? subjectDescription;
  SubjectProgressResponse({
    this.subjectId,
    this.eduYearId,
    this.subjectArName,
    this.subjectEnName,
    this.eduYearArName,
    this.eduYearEnName,
    this.subjectImage,
    this.examCount,
    this.progressBar,
    this.unitCount
    ,
    this.subjectDescription,
 
  });
  
  factory SubjectProgressResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectProgressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectProgressResponseToJson(this);
}
