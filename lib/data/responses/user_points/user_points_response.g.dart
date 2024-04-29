// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_points_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPointsResponse _$UserPointsResponseFromJson(Map<String, dynamic> json) =>
    UserPointsResponse(
      allPoints: (json['Allpoints'] as num?)?.toDouble(),
      usedPoints: (json['Usedpoints'] as num?)?.toDouble(),
      unUsedPoints: (json['UnUsedpoints'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserPointsResponseToJson(UserPointsResponse instance) =>
    <String, dynamic>{
      'Allpoints': instance.allPoints,
      'Usedpoints': instance.usedPoints,
      'UnUsedpoints': instance.unUsedPoints,
    };
