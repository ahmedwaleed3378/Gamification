import 'package:gamification/data/responses/unit_data/unit_data_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_response.g.dart';

@JsonSerializable()
class SubjectUnitResponse {
  @JsonKey(name:"unitId")
  int? unitId;
  @JsonKey(name:"subjectid")
  int? subjectId;
  @JsonKey(name:"unit_ar_name")
  String? unitArName;
  @JsonKey(name:"unit_en_name")
  String? unitEnName;
  @JsonKey(name:"subject_ar_name")
  String? subjectArName;
  @JsonKey(name:"subject_en_name")
  String? subjectEnName;
  @JsonKey(name:"content")
  List<UnitDataModelResponse>? content;
  @JsonKey(name:"orderNum")
  int? orderNum;
  @JsonKey(name:"isMandatory")
  bool? isMandatory;

  SubjectUnitResponse({
    this.unitId,
    this.subjectId,
    this.unitArName,
    this.unitEnName,
    this.subjectArName,
    this.subjectEnName,
    this.content,
    this.orderNum,
    this.isMandatory,
  });

  factory SubjectUnitResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectUnitResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectUnitResponseToJson(this);
}
