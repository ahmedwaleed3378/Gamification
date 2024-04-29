class UnitDataModel {
  UnitDataContentModel unitData;
  List<UnitDataModelModel>? model;
  dynamic completePercentageUnit;

  UnitDataModel(
    this.unitData,
    this.model,
    this.completePercentageUnit,
  );
}

class UnitDataContentModel {
  int unitId;
  String unitArName;
  String unitEnName;
  int subjectId;
  String subjectArName;
  String subjectEnName;
  dynamic isMandatory = false;
  int orderNum;
  String attach;

  UnitDataContentModel(
    this.unitId,
    this.unitArName,
    this.unitEnName,
    this.subjectId,
    this.subjectArName,
    this.subjectEnName,
    this.isMandatory,
    this.orderNum,
    this.attach,
  );
}

class UnitDataModelModel {
  String type;
  int id;
  String arName;
  String enName;
  int order;
  int examTypeId;
  int periodMinute;
  bool isMandatory;
  String availableDateFrom;
  String availableDateTo;
  dynamic isPublish;
  String fromHour;
  String toHour;
  int percentageToPass;
  bool isComplete;
  int numViews;
  int attachTypeId;
  String attachTypeName;
  int fileTypeId;
  String fileTypeName;
  String attach;
  bool isOnline;

  UnitDataModelModel(
    this.type,
    this.id,
    this.arName,
    this.enName,
    this.order,
    this.examTypeId,
    this.periodMinute,
    this.isMandatory,
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
  );
}
