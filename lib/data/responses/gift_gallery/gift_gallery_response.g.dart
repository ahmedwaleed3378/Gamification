// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_gallery_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftGalleryResponse _$GiftGalleryResponseFromJson(Map<String, dynamic> json) =>
    GiftGalleryResponse(
      giftGallery: (json['giftGallery'] as List<dynamic>?)
          ?.map((e) =>
              GiftGalleryContentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemsCount: json['itemsCount'] as int?,
    );

Map<String, dynamic> _$GiftGalleryResponseToJson(
        GiftGalleryResponse instance) =>
    <String, dynamic>{
      'giftGallery': instance.giftGallery,
      'itemsCount': instance.itemsCount,
    };

GiftGalleryContentResponse _$GiftGalleryContentResponseFromJson(
        Map<String, dynamic> json) =>
    GiftGalleryContentResponse(
      id: json['id'] as int?,
      arabicName: json['arabicName'] as String?,
      englishName: json['englishName'] as String?,
      qty: json['qty'] as int?,
      points: (json['points'] as num?)?.toDouble(),
      description: json['description'] as String?,
      attachPath: json['attach_path'] as String?,
    );

Map<String, dynamic> _$GiftGalleryContentResponseToJson(
        GiftGalleryContentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'arabicName': instance.arabicName,
      'englishName': instance.englishName,
      'qty': instance.qty,
      'points': instance.points,
      'description': instance.description,
      'attach_path': instance.attachPath,
    };
