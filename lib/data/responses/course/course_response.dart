import 'package:json_annotation/json_annotation.dart';

part 'course_response.g.dart';

@JsonSerializable()
class CourseMainResponse {
  @JsonKey(name: "basicCoursesList")
  List<CourseContentResponse>? basicCoursesList;
  @JsonKey(name: "recommendedCoursesList")
  List<CourseContentResponse>? recommendedCoursesList;

  CourseMainResponse({
    this.basicCoursesList,
    this.recommendedCoursesList,
  });

  factory CourseMainResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseMainResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseMainResponseToJson(this);
}

@JsonSerializable()
class CourseContentResponse {
  @JsonKey(name: "subject_id")
  int? subjectId;
  @JsonKey(name: "subject_ar_name")
  String? subjectArName;
  @JsonKey(name: "subject_en_name")
  String? subjectEnName;
  @JsonKey(name: "subjectDescreption")
  String? subjectDescreption;
  @JsonKey(name: "subjectPromoLink")
  String? subjectPromoLink;
  @JsonKey(name: "courseCertificate")
  bool? courseCertificate;
  @JsonKey(name: "courseMinutes")
  int? courseMinutes;
  @JsonKey(name: "isArabic")
  bool? isArabic;
  @JsonKey(name: "isEnglish")
  bool? isEnglish;
  @JsonKey(name: "Diploma_id")
  int? diplomaId;
  @JsonKey(name: "Diploma_ar_name")
  String? diplomaArName;
  @JsonKey(name: "Diploma_en_name")
  String? diplomaEnName;
  @JsonKey(name: "eduCompId")
  int? eduCompId;
  @JsonKey(name: "attach_path")
  String? attachPath;
  @JsonKey(name: "whatYouLearn")
  List<String>? whatYouLearn;
  @JsonKey(name: "exams")
  int? exams;
  @JsonKey(name: "files")
  int? files;
  @JsonKey(name: "teacher_ar_name")
  String? teacherArName;
  @JsonKey(name: "subjectUserNumbers")
  int? subjectUserNumbers;
  @JsonKey(name: "isCurrent")
  bool? isCurrent;

  CourseContentResponse({
    this.subjectId,
    this.subjectArName,
    this.subjectEnName,
    this.subjectDescreption,
    this.subjectPromoLink,
    this.courseCertificate,
    this.courseMinutes,
    this.isArabic,
    this.isEnglish,
    this.diplomaId,
    this.diplomaArName,
    this.diplomaEnName,
    this.eduCompId,
    this.attachPath,
    this.whatYouLearn,
    this.exams,
    this.files,
    this.teacherArName,
    this.subjectUserNumbers,
    this.isCurrent,
  });

  factory CourseContentResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseContentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseContentResponseToJson(this);

}
