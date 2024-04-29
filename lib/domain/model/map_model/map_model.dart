class MapModel {
  SubjectMapModel subjectMapModel;

  MapModel(
    this.subjectMapModel,
  );
}

class SubjectMapModel {
  int subjectId;
  String subjectArMame;
  String subjectEnName;
  int eduYearId;
  String eduYearArName;
  String eduYearEnName;
  String subjectImage;
  List<SubjectExamsModel> examsModel;
  List<EduUnitModel> eduUnitModel;
  SubjectMapModel({
    required this.subjectId,
    required this.subjectArMame,
    required this.subjectEnName,
    required this.eduYearId,
    required this.eduYearArName,
    required this.eduYearEnName,
    required this.subjectImage,
    required this.examsModel,
    required this.eduUnitModel,
  });
}

class EduUnitModel {
  int unitId;
  String unitArName;
  String unitEnName;
  String unitImage;
  List<SubjectExamsModel> unitExams;

  EduUnitModel({
    required this.unitId,
    required this.unitArName,
    required this.unitEnName,
    required this.unitImage,
    required this.unitExams,
  });
}

class SubjectExamsModel {
  int examId;
  String examArName;
  String examEnName;
  bool isCompleted;
  bool notResolved;
  final int examTime;
  final double totalResult;
  final double userExamPoint;
  final double userExamExperince;
  final double examMark;
  final double examExperience;

  SubjectExamsModel(
    this.examId,
    this.examArName,
    this.examEnName,
    this.isCompleted,
    this.notResolved,
    this.examTime,
    this.totalResult,
    this.userExamPoint,
    this.userExamExperince,
    this.examMark,
    this.examExperience,
  );
}
