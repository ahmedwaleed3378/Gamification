import 'package:json_annotation/json_annotation.dart';

part 'searched_unit_response.g.dart';

@JsonSerializable()
class SearchedUnitResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "subject_id")
  int? subjectId;
  @JsonKey(name: "unit_ar_name")
  String? unitArName;
  @JsonKey(name: "unit_en_name")
  String? unitEnName;
  @JsonKey(name: "state")
  bool? state;
  @JsonKey(name: "SesemesterID")
  int? sesemesterID;
  @JsonKey(name: "unitThumbnailId")
  int? unitThumbnailId;
  @JsonKey(name: "unitDescription")
  String? unitDescription;
  @JsonKey(name: "CreationUserId")
  int? creationUserId;
  @JsonKey(name: "CreationDate")
  String? creationDate;
  @JsonKey(name: "EditedUserId")
  int? editedUserId;
  @JsonKey(name: "EditedDate")
  String? editedDate;
  @JsonKey(name: "centerId")
  int? centerId;
  @JsonKey(name: "CreateBranchId")
  int? createBranchId;
  @JsonKey(name: "UpdateBranchId")
  int? updateBranchId;
  @JsonKey(name: "orderNum")
  int? orderNum;
  @JsonKey(name: "isMandatory")
  bool? isMandatory;
  @JsonKey(name: "unitThumb")
  // String? unitThumb;
  // @JsonKey(name: "thumbnailPic")
  String? thumbnailPic;
  @JsonKey(name: "totalPrice")
  double? totalPrice;
  @JsonKey(name: "discountPrice")
  double? discountPrice;
  @JsonKey(name: "firstMaterialId")
  int? firstMaterialId;
  @JsonKey(name: "matCount")
  double? matCount;
  @JsonKey(name: "examCount")
  double? examCount;
  @JsonKey(name: "docAttachCount")
  int? docAttachCount;
  @JsonKey(name: "offlineMatCount")
  int? offlineMatCount;
  @JsonKey(name: "attach_path")
  String? attachPath;

  SearchedUnitResponse({
    this.id,
    this.subjectId,
    this.unitArName,
    this.unitEnName,
    this.state,
    this.sesemesterID,
    this.unitThumbnailId,
    this.unitDescription,
    this.creationUserId,
    this.creationDate,
    this.editedUserId,
    this.editedDate,
    this.centerId,
    this.createBranchId,
    this.updateBranchId,
    this.orderNum,
    this.isMandatory,
    // this.unitThumb,
    this.thumbnailPic,
    this.totalPrice,
    this.discountPrice,
    this.firstMaterialId,
    this.matCount,
    this.examCount,
    this.docAttachCount,
    this.offlineMatCount,
    this.attachPath,
  });

  factory SearchedUnitResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchedUnitResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchedUnitResponseToJson(this);

}