import 'package:json_annotation/json_annotation.dart';

part 'all_courses_response.g.dart';

@JsonSerializable()
class AllCoursesRequestResponse {
  @JsonKey(name: "returnValue")
  int? returnValue;
  @JsonKey(name: "Courses")
  List<CoursesRequestItemsResponse>? courses;

  AllCoursesRequestResponse({
    this.returnValue,
    this.courses,
  });

  factory AllCoursesRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$AllCoursesRequestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllCoursesRequestResponseToJson(this);
}

@JsonSerializable()
class CoursesRequestItemsResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "course_ar_name")
  String? courseArName;
  @JsonKey(name: "course_en_name")
  String? courseEnName;

  CoursesRequestItemsResponse({
    this.id,
    this.courseArName,
    this.courseEnName,
  });

  factory CoursesRequestItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$CoursesRequestItemsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoursesRequestItemsResponseToJson(this);
}
