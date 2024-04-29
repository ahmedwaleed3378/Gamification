import 'package:json_annotation/json_annotation.dart';

part 'category_subcourse_response.g.dart';

@JsonSerializable()
class CategorySubCourseResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "course_ar_name")
  String? courseArName;
  @JsonKey(name: "course_en_name")
  String? courseEnName;
  @JsonKey(name: "approve")
  bool? approve;
  @JsonKey(name: "hasRequestBefore")
  bool? hasRequestBefore;
  @JsonKey(name: "attach_file")
  String? attachFile;
  @JsonKey(name: "courseTime")
  int? courseTime;

  CategorySubCourseResponse({
    this.id,
    this.courseArName,
    this.courseEnName,
    this.approve,
    this.hasRequestBefore,
    this.attachFile,
    this.courseTime,
  });

  factory CategorySubCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$CategorySubCourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategorySubCourseResponseToJson(this);
}
