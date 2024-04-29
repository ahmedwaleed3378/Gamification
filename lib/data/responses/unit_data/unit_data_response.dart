import 'package:json_annotation/json_annotation.dart';

part 'unit_data_response.g.dart';

@JsonSerializable()
class UnitDataResponse {
  @JsonKey(name: "UnitData")
  UnitDataContentResponse? unitData;
  @JsonKey(name: "model")
  List<UnitDataModelResponse>? model;
  @JsonKey(name: "CompletePercentageUnit")
  dynamic completePercentageUnit;

  UnitDataResponse({
    this.unitData,
    this.model,
    this.completePercentageUnit,
  });

  factory UnitDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UnitDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnitDataResponseToJson(this);
}

@JsonSerializable()
class UnitDataContentResponse {
  @JsonKey(name: "unitId")
  int? unitId;
  @JsonKey(name: "unit_ar_name")
  String? unitArName;
  @JsonKey(name: "unit_en_name")
  String? unitEnName;
  @JsonKey(name: "subjectid")
  int? subjectId;
  @JsonKey(name: "subject_ar_name")
  String? subjectArName;
  @JsonKey(name: "subject_en_name")
  String? subjectEnName;
  @JsonKey(name: "isMandatory")
  dynamic isMandatory;
  @JsonKey(name: "orderNum")
  int? orderNum;
  @JsonKey(name: "attach")
  String? attach;

  UnitDataContentResponse({
    this.unitId,
    this.unitArName,
    this.unitEnName,
    this.subjectId,
    this.subjectArName,
    this.subjectEnName,
    this.isMandatory,
    this.orderNum,
    this.attach,
  });

  factory UnitDataContentResponse.fromJson(Map<String, dynamic> json) =>
      _$UnitDataContentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnitDataContentResponseToJson(this);

}

@JsonSerializable()
class UnitDataModelResponse {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "ar_name")
  String? arName;
  @JsonKey(name: "en_name")
  String? enName;
  @JsonKey(name: "order")
  int? order;
  @JsonKey(name: "exam_type_id")
  int? examTypeId;
  @JsonKey(name: "period_minute")
  int? periodMinute;
  @JsonKey(name: "isMandatory")
  bool? isMandatory;
  @JsonKey(name: "availableDateFrom")
  String? availableDateFrom;
  @JsonKey(name: "availableDateTo")
  String? availableDateTo;
  @JsonKey(name: "IsPublish")
  dynamic isPublish;
  @JsonKey(name: "fromHour")
  String? fromHour;
  @JsonKey(name: "ToHour")
  String? toHour;
  @JsonKey(name: "percentageToPass")
  int? percentageToPass;
  @JsonKey(name: "isComplete")
  bool? isComplete;
  @JsonKey(name: "Num_Views")
  int? numViews;
  @JsonKey(name: "attachTypeId")
  int? attachTypeId;
  @JsonKey(name: "attachTypeName")
  String? attachTypeName;
  @JsonKey(name: "FileTypeId")
  int? fileTypeId;
  @JsonKey(name: "FileTypeName")
  String? fileTypeName;
  @JsonKey(name: "attach")
  String? attach;
  @JsonKey(name: "isOnline")
  bool? isOnline;

  UnitDataModelResponse({
    this.type,
    this.id,
    this.arName,
    this.enName,
    this.order,
    this.examTypeId,
    this.periodMinute,
    this.isMandatory = false,
    this.availableDateFrom,
    this.availableDateTo,
    this.isPublish,
    this.fromHour,
    this.toHour,
    this.percentageToPass,
    this.isComplete,
    this.numViews,
    this.attachTypeId,
    this.attachTypeName,
    this.fileTypeId,
    this.fileTypeName,
    this.attach,
    this.isOnline,
  });

  factory UnitDataModelResponse.fromJson(Map<String, dynamic> json) =>
      _$UnitDataModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnitDataModelResponseToJson(this);
}
