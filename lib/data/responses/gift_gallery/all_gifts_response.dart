import 'package:json_annotation/json_annotation.dart';

part 'all_gifts_response.g.dart';

@JsonSerializable()
class AllGiftsResponse {
  @JsonKey(name: "ProfileData")
  ProfileDataResponse? profileData;
  @JsonKey(name: "AllGifts")
  List<GiftResponse?>? allGifts;
  AllGiftsResponse({this.profileData, this.allGifts});

  factory AllGiftsResponse.fromJson(Map<String, dynamic> json) =>
      _$AllGiftsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllGiftsResponseToJson(this);
}

@JsonSerializable()
class GiftResponse {
  @JsonKey(name: "giftId")
  int? giftId;
  @JsonKey(name: "Gift_Ar_Name")
  String? giftArName;
  @JsonKey(name: "giftEn_Name")
  String? giftEnName;
  @JsonKey(name: "GiftPicture")
  String? giftPicture;
  @JsonKey(name: "GiftQuantity")
  int? giftQuantity;
  @JsonKey(name: "GiftPoint")
  double? giftPoints;
  @JsonKey(name: "GiftCategory")
  int? giftCategory;
  @JsonKey(name: "GiftDescreption")
  String? giftDescreption;
  @JsonKey(name: "GiftCreationUserId")
  int? giftCreationUserId;
  GiftResponse({
    this.giftId,
    this.giftArName,
    this.giftEnName,
    this.giftPicture,
    this.giftQuantity,
    this.giftPoints,
    this.giftCategory,
    this.giftDescreption,
    this.giftCreationUserId,
  });
  factory GiftResponse.fromJson(Map<String, dynamic> json) =>
      _$GiftResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GiftResponseToJson(this);
}

@JsonSerializable()
class ProfileDataResponse {
  @JsonKey(name: "userProfilePhoto")
  String? userProfilePhoto;
  @JsonKey(name: "LoginCounter")
  int? loginCounter;
  @JsonKey(name: "TotalPoints")
  double? teacherName;
  @JsonKey(name: "AvailablePoints")
  double? availablePoints;
  ProfileDataResponse({
    this.userProfilePhoto,
    this.loginCounter,
    this.teacherName,
    this.availablePoints,
  });
  factory ProfileDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataResponseToJson(this);
}
