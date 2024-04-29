// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_by_user_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftByUserIdResponse _$GiftByUserIdResponseFromJson(
        Map<String, dynamic> json) =>
    GiftByUserIdResponse(
      id: json['Id'] as int?,
      giftName: json['giftName'] as String?,
      giftEnName: json['giftEn_Name'] as String?,
      giftPoints: (json['giftPoints'] as num?)?.toDouble(),
      quantity: json['Quantity'] as int?,
      giftPicture: json['giftPicture'] as String?,
    );

Map<String, dynamic> _$GiftByUserIdResponseToJson(
        GiftByUserIdResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'giftName': instance.giftName,
      'giftEn_Name': instance.giftEnName,
      'giftPoints': instance.giftPoints,
      'Quantity': instance.quantity,
      'giftPicture': instance.giftPicture,
    };
