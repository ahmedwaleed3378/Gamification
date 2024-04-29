import 'package:gamification/domain/model/exam/exam_details_model.dart';
import 'package:gamification/domain/model/exam/exam_result_model.dart';

class ExamMCQModel{
  // 0 not solve  ** 1 solved
  int sumbitOrSolved;
  McqResultModel? mcqResultModel;
  List<McqModel> mcqModel;
  String questionText;
  String questionAttach;
  ExamMCQModel(
      this.sumbitOrSolved , this.mcqResultModel , this.mcqModel,this.questionText , this.questionAttach
      );
}