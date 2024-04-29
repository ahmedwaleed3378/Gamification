import 'package:json_annotation/json_annotation.dart';

part 'user_points_response.g.dart';

@JsonSerializable()
class UserPointsResponse {
  @JsonKey(name: "Allpoints")
  double? allPoints;
  @JsonKey(name: "Usedpoints")
  double? usedPoints;
  @JsonKey(name: "UnUsedpoints")
  double? unUsedPoints;

  UserPointsResponse({
    this.allPoints,
    this.usedPoints,
    this.unUsedPoints,
  });

  factory UserPointsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserPointsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserPointsResponseToJson(this);
}