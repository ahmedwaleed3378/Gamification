class SubjectsProgressModel {
  List<SubjectProgressModel?> subjectEducationalYears;
  SubjectsProgressModel({required this.subjectEducationalYears});
}

class SubjectProgressModel {
  final int subjectId;

  final int eduYearId;

  final int examCount;

  final int unitCount;

  final int progressBar;

  final String subjectArName;

  final String subjectEnName;

  final String eduYearArName;

  final String eduYearEnName;

  final String subjectImage;

  String subjectDescription;
  SubjectProgressModel({
    required this.subjectId,
    required this.eduYearId,
    required this.examCount,
    required this.unitCount,
    required this.progressBar,
    required this.subjectArName,
    required this.subjectEnName,
    required this.eduYearArName,
    required this.eduYearEnName,
    required this.subjectImage,
    required this.subjectDescription,
  });
}
