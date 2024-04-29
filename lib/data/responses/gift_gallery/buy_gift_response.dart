import 'package:json_annotation/json_annotation.dart';

part 'buy_gift_response.g.dart';

@JsonSerializable()
class BuyGiftResponse {
  @JsonKey(name: "returnValue")
  int? returnValue;

  BuyGiftResponse({
    this.returnValue,
  });

  factory BuyGiftResponse.fromJson(Map<String, dynamic> json) =>
      _$BuyGiftResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BuyGiftResponseToJson(this);
}


@JsonSerializable()
class AssignGiftResponse {
  @JsonKey(name: "returnMessege")
  String? returnMessage;
  @JsonKey(name: "returnValue")
  int? returnValue;

  AssignGiftResponse({
    this.returnMessage,
    this.returnValue,
  });

  factory AssignGiftResponse.fromJson(Map<String, dynamic> json) =>
      _$AssignGiftResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AssignGiftResponseToJson(this);
}
