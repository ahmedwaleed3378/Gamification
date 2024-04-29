import 'package:json_annotation/json_annotation.dart';

part 'teaching_request_response.g.dart';

@JsonSerializable()
class RequestTeachingResponse {
  @JsonKey(name: "countItems")
  int? countItems;
  @JsonKey(name: "Requests")
  List<RequestTeachingItemsResponse>? requests;

  RequestTeachingResponse({
    this.countItems,
    this.requests,
  });

  factory RequestTeachingResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestTeachingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RequestTeachingResponseToJson(this);
}

@JsonSerializable()
class RequestTeachingItemsResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "employee_name")
  String? employeeName;
  @JsonKey(name: "course_ar_name")
  String? courseArName;
  @JsonKey(name: "course_en_name")
  String? courseEnName;
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "numberOfDays")
  int? numberOfDays;
  @JsonKey(name: "details")
  String? details;

  RequestTeachingItemsResponse({
    this.id,
    this.employeeName,
    this.courseArName,
    this.courseEnName,
    this.status,
    this.numberOfDays,
    this.details,
  });

  factory RequestTeachingItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestTeachingItemsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RequestTeachingItemsResponseToJson(this);
}
