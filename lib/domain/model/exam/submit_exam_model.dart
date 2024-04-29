class SubmitExamModel {
  String message;
  double result;
  double totalMark;
  String url;
  bool repeatable;
  int repeatableExamCount;
  int? returnValue;
  String? returnString;

  SubmitExamModel(
    this.message,
    this.result,
    this.totalMark,
    this.url,
    this.repeatable,
    this.repeatableExamCount,
    this.returnValue,
    this.returnString,
  );
}
