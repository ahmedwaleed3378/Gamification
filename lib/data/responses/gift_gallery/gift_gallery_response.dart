import 'package:json_annotation/json_annotation.dart';

part 'gift_gallery_response.g.dart';

@JsonSerializable()
class GiftGalleryResponse {
  @JsonKey(name: "giftGallery")
  List<GiftGalleryContentResponse>? giftGallery;
  @JsonKey(name: "itemsCount")
  int? itemsCount;

  GiftGalleryResponse({
    this.giftGallery,
    this.itemsCount,
  });

  factory GiftGalleryResponse.fromJson(Map<String, dynamic> json) =>
      _$GiftGalleryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GiftGalleryResponseToJson(this);
}

@JsonSerializable()
class GiftGalleryContentResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "arabicName")
  String? arabicName;
  @JsonKey(name: "englishName")
  String? englishName;
  @JsonKey(name: "qty")
  int? qty;
  @JsonKey(name: "points")
  double? points;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "attach_path")
  String? attachPath;

  GiftGalleryContentResponse({
    this.id,
    this.arabicName,
    this.englishName,
    this.qty,
    this.points,
    this.description,
    this.attachPath,
  });

  factory GiftGalleryContentResponse.fromJson(Map<String, dynamic> json) =>
      _$GiftGalleryContentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GiftGalleryContentResponseToJson(this);
}
