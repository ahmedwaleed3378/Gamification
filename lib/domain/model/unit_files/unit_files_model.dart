class UnitFileModel {
  List<UnitFileDataModel>? unitData;

  UnitFileModel(this.unitData);
}

class UnitFileDataModel {
  int id;
  String arName;
  String enName;
  int order;
  int? subjectId;
  String? subjectArName;
  String? subjectEnName;
  bool? isMandatory;
  String? attach;
  List<dynamic>? fileEduUnit;

  UnitFileDataModel(
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
  );
}
