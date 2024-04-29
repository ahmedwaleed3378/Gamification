// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_gifts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllGiftsResponse _$AllGiftsResponseFromJson(Map<String, dynamic> json) =>
    AllGiftsResponse(
      profileData: json['ProfileData'] == null
          ? null
          : ProfileDataResponse.fromJson(
              json['ProfileData'] as Map<String, dynamic>),
      allGifts: (json['AllGifts'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GiftResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllGiftsResponseToJson(AllGiftsResponse instance) =>
    <String, dynamic>{
      'ProfileData': instance.profileData,
      'AllGifts': instance.allGifts,
    };

GiftResponse _$GiftResponseFromJson(Map<String, dynamic> json) => GiftResponse(
      giftId: json['giftId'] as int?,
      giftArName: json['Gift_Ar_Name'] as String?,
      giftEnName: json['giftEn_Name'] as String?,
      giftPicture: json['GiftPicture'] as String?,
      giftQuantity: json['GiftQuantity'] as int?,
      giftPoints: (json['GiftPoint'] as num?)?.toDouble(),
      giftCategory: json['GiftCategory'] as int?,
      giftDescreption: json['GiftDescreption'] as String?,
      giftCreationUserId: json['GiftCreationUserId'] as int?,
    );

Map<String, dynamic> _$GiftResponseToJson(GiftResponse instance) =>
    <String, dynamic>{
      'giftId': instance.giftId,
      'Gift_Ar_Name': instance.giftArName,
      'giftEn_Name': instance.giftEnName,
      'GiftPicture': instance.giftPicture,
      'GiftQuantity': instance.giftQuantity,
      'GiftPoint': instance.giftPoints,
      'GiftCategory': instance.giftCategory,
      'GiftDescreption': instance.giftDescreption,
      'GiftCreationUserId': instance.giftCreationUserId,
    };

ProfileDataResponse _$ProfileDataResponseFromJson(Map<String, dynamic> json) =>
    ProfileDataResponse(
      userProfilePhoto: json['userProfilePhoto'] as String?,
      loginCounter: json['LoginCounter'] as int?,
      teacherName: (json['TotalPoints'] as num?)?.toDouble(),
      availablePoints: (json['AvailablePoints'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProfileDataResponseToJson(
        ProfileDataResponse instance) =>
    <String, dynamic>{
      'userProfilePhoto': instance.userProfilePhoto,
      'LoginCounter': instance.loginCounter,
      'TotalPoints': instance.teacherName,
      'AvailablePoints': instance.availablePoints,
    };
