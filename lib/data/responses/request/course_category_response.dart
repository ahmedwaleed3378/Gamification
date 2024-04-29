import 'package:json_annotation/json_annotation.dart';

part 'course_category_response.g.dart';

@JsonSerializable()
class AllCourseCategoryResponse {
  @JsonKey(name: "returnValue")
  int? returnValue;
  @JsonKey(name: "courseCategoryList")
  List<CourseCategoryListResponse>? courseCategoryList;

  AllCourseCategoryResponse({
    this.returnValue,
    this.courseCategoryList,
  });

  factory AllCourseCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$AllCourseCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllCourseCategoryResponseToJson(this);
}

@JsonSerializable()
class CourseCategoryListResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "ar_name")
  String? arName;
  @JsonKey(name: "en_name")
  String? enName;

  CourseCategoryListResponse({
    this.id,
    this.arName,
    this.enName,
  });

  factory CourseCategoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseCategoryListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseCategoryListResponseToJson(this);
}
