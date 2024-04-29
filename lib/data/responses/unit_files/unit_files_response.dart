import 'package:json_annotation/json_annotation.dart';

part 'unit_files_response.g.dart';

@JsonSerializable()
class UnitFileResponse {
  @JsonKey(name: "UnitData")
  List<UnitFileDataResponse>? unitData;

  UnitFileResponse({this.unitData});

  factory UnitFileResponse.fromJson(Map<String, dynamic> json) =>
      _$UnitFileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnitFileResponseToJson(this);
}

@JsonSerializable()
class UnitFileDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "ar_name")
  String? arName;
  @JsonKey(name: "en_name")
  String? enName;
  @JsonKey(name: "order")
  int? order;
  @JsonKey(name: "subject_id")
  int? subjectId;
  @JsonKey(name: "subject_ar_name")
  String? subjectArName;
  @JsonKey(name: "subject_en_name")
  String? subjectEnName;
  @JsonKey(name: "isMandatory")
  bool? isMandatory;
  @JsonKey(name: "attach")
  String? attach;
  @JsonKey(name: "FileEduUnit")
  List<dynamic>? fileEduUnit;

  UnitFileDataResponse({
    this.id,
    this.arName,
    this.enName,
    this.order,
    this.subjectId,
    this.subjectArName,
    this.subjectEnName,
    this.isMandatory,
    this.attach,
    this.fileEduUnit,
  });

  factory UnitFileDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UnitFileDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnitFileDataResponseToJson(this);
}
