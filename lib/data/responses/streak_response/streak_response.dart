import 'package:json_annotation/json_annotation.dart';

part 'streak_response.g.dart';

@JsonSerializable()
class StreakResponse {
  @JsonKey(name: "counter")
  int? counter;
  @JsonKey(name: "streakeCounter")
  int? streakeCounter;
  StreakResponse({
    this.counter,
    this.streakeCounter,
  });

  factory StreakResponse.fromJson(Map<String, dynamic> json) =>
      _$StreakResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StreakResponseToJson(this);
}