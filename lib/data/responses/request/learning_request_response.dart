import 'package:json_annotation/json_annotation.dart';

part 'learning_request_response.g.dart';

@JsonSerializable()
class RequestLearningResponse {
  @JsonKey(name: "countItems")
  int? countItems;
  @JsonKey(name: "Requests")
  List<RequestLearningItemsResponse>? requests;

  RequestLearningResponse({
    this.countItems,
    this.requests,
  });

  factory RequestLearningResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestLearningResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RequestLearningResponseToJson(this);
}

@JsonSerializable()
class RequestLearningItemsResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "course_ar_name")
  String? courseArName;
  @JsonKey(name: "course_en_name")
  String? courseEnName;
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "numberOfDays")
  int? numberOfDays;
  @JsonKey(name: "reasonOfRequest")
  String? reasonOfRequest;

  RequestLearningItemsResponse({
    this.id,
    this.courseArName,
    this.courseEnName,
    this.status,
    this.numberOfDays,
    this.reasonOfRequest,
  });

  factory RequestLearningItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestLearningItemsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RequestLearningItemsResponseToJson(this);
}
