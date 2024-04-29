import 'package:json_annotation/json_annotation.dart';

part 'sub_course_response.g.dart';

@JsonSerializable()
class SubCourseResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "eduCompId")
  int? eduCompId;
  @JsonKey(name: "subCourse_ar_name")
  String? subCourseArName;
  @JsonKey(name: "subCourse_en_name")
  String? subCourseEnName;
  @JsonKey(name: "subjectDescription")
  String? subjectDescription;
  @JsonKey(name: "subjectPromoVideoPath")
  String? subjectPromoVideoPath;
  @JsonKey(name: "Diploma_id")
  int? diplomaId;
  @JsonKey(name: "main_course_ar_name")
  String? mainCourseArName;
  @JsonKey(name: "main_course_en_name")
  String? mainCourseEnName;
  @JsonKey(name: "attach_path")
  String? attachPath;
  @JsonKey(name: "isArabic")
  bool? isArabic;
  @JsonKey(name: "isEnglish")
  bool? isEnglish;
  @JsonKey(name: "isFollow")
  bool? isFollow;
  @JsonKey(name: "CourseCertificate")
  bool? courseCertificate;
  @JsonKey(name: "subCourseMinutes")
  int? subCourseMinutes;
  @JsonKey(name: "course_categories")
  List<CourseCategoriesResponse>? courseCategories;
  @JsonKey(name: "department")
  List<CourseDepartmentResponse>? department;

  SubCourseResponse({
    this.id,
    this.eduCompId,
    this.subCourseArName,
    this.subCourseEnName,
    this.subjectDescription,
    this.subjectPromoVideoPath,
    this.diplomaId,
    this.mainCourseArName,
    this.mainCourseEnName,
    this.attachPath,
    this.isArabic,
    this.isEnglish,
    this.isFollow,
    this.courseCertificate,
    this.subCourseMinutes,
    this.courseCategories,
    this.department,
  });

  factory SubCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$SubCourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubCourseResponseToJson(this);
}

@JsonSerializable()
class CourseCategoriesResponse {
  @JsonKey(name: "category_id")
  int? categoryId;
  @JsonKey(name: "educational_category_id")
  int? educationalCategoryId;
  @JsonKey(name: "category_ar_name")
  String? categoryArName;
  @JsonKey(name: "category_en_name")
  String? categoryEnName;

  CourseCategoriesResponse({
    this.categoryId,
    this.educationalCategoryId,
    this.categoryArName,
    this.categoryEnName,
  });

  factory CourseCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseCategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseCategoriesResponseToJson(this);
}

@JsonSerializable()
class CourseDepartmentResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "ar_name")
  String? arName;
  @JsonKey(name: "en_name")
  String? enName;
  @JsonKey(name: "is_active")
  bool? isActive;
  @JsonKey(name: "is_mandatory")
  bool? isMandatory;
  @JsonKey(name: "jobTitle")
  List<CourseJobTitleResponse>? jobTitle;

  CourseDepartmentResponse({
    this.id,
    this.arName,
    this.enName,
    this.isActive,
    this.isMandatory,
    this.jobTitle,
  });

  factory CourseDepartmentResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseDepartmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDepartmentResponseToJson(this);
}

@JsonSerializable()
class CourseJobTitleResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "jobTitleCourseId")
  int? jobTitleCourseId;
  @JsonKey(name: "depJobId")
  int? depJobId;
  @JsonKey(name: "is_mandatory")
  bool? isMandatory;
  @JsonKey(name: "ar_name")
  String? arName;
  @JsonKey(name: "en_name")
  String? enName;
  @JsonKey(name: "is_active")
  bool? isActive;
  @JsonKey(name: "from_date")
  String? fromDate;
  @JsonKey(name: "to_date")
  String? toDate;

  CourseJobTitleResponse({
    this.id,
    this.jobTitleCourseId,
    this.depJobId,
    this.isMandatory,
    this.arName,
    this.enName,
    this.isActive,
    this.fromDate,
    this.toDate,
  });

  factory CourseJobTitleResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseJobTitleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseJobTitleResponseToJson(this);
}
