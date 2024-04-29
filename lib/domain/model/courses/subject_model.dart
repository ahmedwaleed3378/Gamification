import 'package:gamification/domain/model/unit_data/unit_data_model.dart';

class SubjectUnitModel {
  int unitId;
  int subjectId;
  String unitArName;
  String unitEnName;
  String subjectArName;
  String subjectEnName;
  List<UnitDataModelModel>? content;
  int orderNum;
  bool isMandatory;

  SubjectUnitModel(
    this.unitId,
    this.subjectId,
    this.unitArName,
    this.unitEnName,
    this.subjectArName,
    this.subjectEnName,
    this.content,
    this.orderNum,
    this.isMandatory,
  );
}
