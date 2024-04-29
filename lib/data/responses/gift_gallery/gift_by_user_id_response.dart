import 'package:json_annotation/json_annotation.dart';

part 'gift_by_user_id_response.g.dart';

@JsonSerializable()
class GiftByUserIdResponse {
  @JsonKey(name: "Id")
  int? id;
  @JsonKey(name: "giftName")
  String? giftName;
  @JsonKey(name: "giftEn_Name")
  String? giftEnName;
  @JsonKey(name: "giftPoints")
  double? giftPoints;
  @JsonKey(name: "Quantity")
  int? quantity;
  @JsonKey(name: "giftPicture")
  String? giftPicture;

  GiftByUserIdResponse({
    this.id,
    this.giftName,
    this.giftEnName,
    this.giftPoints,
    this.quantity,
    this.giftPicture,
  });

  factory GiftByUserIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GiftByUserIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GiftByUserIdResponseToJson(this);
}
