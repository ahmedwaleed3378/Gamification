class SubjectProgressIdModel {
  SubjectProgressDetailsModel? subjectEducationalYears;
  SubjectProgressIdModel({required this.subjectEducationalYears});
}

class SubjectProgressDetailsModel {
  final int subjectId;

  final int eduYearId;

  final double studentTotalPointsOfSubject;

  final double studentTotalExperienceOfSubject;

  final double subjectAverage;

  final String subjectArName;

  final String subjectEnName;

  final String eduYearArName;

  final String eduYearEnName;

  final String subjectImage;

  final List<EduUnitModel> eduUnit;

  SubjectProgressDetailsModel({
    required this.subjectId,
    required this.eduYearId,
    required this.subjectArName,
    required this.subjectEnName,
    required this.eduYearArName,
    required this.eduYearEnName,
    required this.subjectImage,
    required this.eduUnit,
    required this.studentTotalExperienceOfSubject,
    required this.studentTotalPointsOfSubject,
    required this.subjectAverage,
  });
}

class EduUnitModel {
  final int subjectId;

  final String unitArName;

  final String unitEnName;

  final String unitImage;

  final double studentTotalPointsOfUnit;

  final double studentTotalExperienceOfUnit;

  final double unitAvrege;

  List<UnitExamModel> exams;
  EduUnitModel({
    required this.subjectId,
    required this.unitArName,
    required this.unitEnName,
    required this.unitImage,
    required this.studentTotalPointsOfUnit,
    required this.studentTotalExperienceOfUnit,
    required this.unitAvrege,
    required this.exams,
 
  });
  //
}

class UnitExamModel {
  int examId;
  String examArName;
  String examEnName;
  double studentTotalPointsOfExam;
  double studentTotalExperienceOfExam;
  double examStudentAverageDegree;
  UnitExamModel(
    this.examId,
    this.examArName,
    this.examEnName,
    this.studentTotalPointsOfExam,
    this.studentTotalExperienceOfExam,
    this.examStudentAverageDegree,
  );
}
