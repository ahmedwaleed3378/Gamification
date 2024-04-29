class SubjectExamsModel {
  int examId;
  String examArName;
  String examEnName;
  bool isCompleted;
  bool notResolved;

  SubjectExamsModel(
    this.examId,
    this.examArName,
    this.examEnName,
    this.isCompleted,
    this.notResolved,
  );
}
