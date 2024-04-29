import 'package:gamification/presentation/exam/viewmodel/exam_viewmodel.dart';

class ExamVModel {
  // HeadsModel head;
  String examName;
  int examPeriodMinute;
  String subjectName;
  int examId;
  int numberOfPages;
  ExamViewModel examViewModel;
  bool isResult;
  double totalPoints;
  String mark;
  int subjectId;

  ExamVModel({
    // required this.head,
    required this.examName,
    required this.examPeriodMinute,
    required this.subjectName,
    required this.examId,
    required this.numberOfPages,
    required this.examViewModel,
    required this.isResult,
    required this.totalPoints,
    required this.mark,
    required this.subjectId,
  });
}
