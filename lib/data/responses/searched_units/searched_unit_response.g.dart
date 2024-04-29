// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched_unit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchedUnitResponse _$SearchedUnitResponseFromJson(
        Map<String, dynamic> json) =>
    SearchedUnitResponse(
      id: json['id'] as int?,
      subjectId: json['subject_id'] as int?,
      unitArName: json['unit_ar_name'] as String?,
      unitEnName: json['unit_en_name'] as String?,
      state: json['state'] as bool?,
      sesemesterID: json['SesemesterID'] as int?,
      unitThumbnailId: json['unitThumbnailId'] as int?,
      unitDescription: json['unitDescription'] as String?,
      creationUserId: json['CreationUserId'] as int?,
      creationDate: json['CreationDate'] as String?,
      editedUserId: json['EditedUserId'] as int?,
      editedDate: json['EditedDate'] as String?,
      centerId: json['centerId'] as int?,
      createBranchId: json['CreateBranchId'] as int?,
      updateBranchId: json['UpdateBranchId'] as int?,
      orderNum: json['orderNum'] as int?,
      isMandatory: json['isMandatory'] as bool?,
      thumbnailPic: json['unitThumb'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      discountPrice: (json['discountPrice'] as num?)?.toDouble(),
      firstMaterialId: json['firstMaterialId'] as int?,
      matCount: (json['matCount'] as num?)?.toDouble(),
      examCount: (json['examCount'] as num?)?.toDouble(),
      docAttachCount: json['docAttachCount'] as int?,
      offlineMatCount: json['offlineMatCount'] as int?,
      attachPath: json['attach_path'] as String?,
    );

Map<String, dynamic> _$SearchedUnitResponseToJson(
        SearchedUnitResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject_id': instance.subjectId,
      'unit_ar_name': instance.unitArName,
      'unit_en_name': instance.unitEnName,
      'state': instance.state,
      'SesemesterID': instance.sesemesterID,
      'unitThumbnailId': instance.unitThumbnailId,
      'unitDescription': instance.unitDescription,
      'CreationUserId': instance.creationUserId,
      'CreationDate': instance.creationDate,
      'EditedUserId': instance.editedUserId,
      'EditedDate': instance.editedDate,
      'centerId': instance.centerId,
      'CreateBranchId': instance.createBranchId,
      'UpdateBranchId': instance.updateBranchId,
      'orderNum': instance.orderNum,
      'isMandatory': instance.isMandatory,
      'unitThumb': instance.thumbnailPic,
      'totalPrice': instance.totalPrice,
      'discountPrice': instance.discountPrice,
      'firstMaterialId': instance.firstMaterialId,
      'matCount': instance.matCount,
      'examCount': instance.examCount,
      'docAttachCount': instance.docAttachCount,
      'offlineMatCount': instance.offlineMatCount,
      'attach_path': instance.attachPath,
    };
