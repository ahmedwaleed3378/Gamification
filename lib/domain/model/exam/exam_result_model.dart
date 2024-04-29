import 'package:gamification/domain/model/exam/exam_details_model.dart';

class ExamResultModel {
  ExModel? ex;
  ItemModel? item;
  String teacherName;
  String subjectName;

  ExamResultModel(
    this.ex,
    this.item,
    this.teacherName,
    this.subjectName,
  );
}

class ItemModel {
  DetailsResultModel? details;
  List<GroupsModel>? groups;

  ItemModel(
    this.details,
    this.groups,
  );
}

class ExModel {
  double pointsGained;
  double userExamPoint;
  double userExamExperince;
  bool showExamFinishMessage;
  bool showExamContent;
  bool showResult;
  int totalMark;
  int questionCount;
  double examResult;
  int examRate;
  ExamStudentModel? examStudent;
  bool examRequiresTeacherInput;
  bool isResultAvailable;
  int solvedExamStudentID;
  bool repeatable;
  int repeatableExamCount;

  ExModel(
    this.pointsGained,
    this.userExamPoint,
    this.userExamExperince,
    this.showExamFinishMessage,
    this.showExamContent,
    this.showResult,
    this.totalMark,
    this.questionCount,
    this.examResult,
    this.examRate,
    this.examStudent,
    this.examRequiresTeacherInput,
    this.isResultAvailable,
    this.solvedExamStudentID,
    this.repeatable,
    this.repeatableExamCount,
  );
}

class ExamStudentModel {
  int id;
  int examId;
  String examDate;
  String submitDate;
  double examAmount;
  bool state;
  bool isSubmitted;
  int correctComplete;
  String examStartTime;
  String examEndTime;
  double examGrade;
  double studentGrade;

  ExamStudentModel(
    this.id,
    this.examId,
    this.examDate,
    this.submitDate,
    this.examAmount,
    this.state,
    this.isSubmitted,
    this.correctComplete,
    this.examStartTime,
    this.examEndTime,
    this.examGrade,
    this.studentGrade,
  );
}

class DetailsResultModel {
  int id;
  int examPeriodMinute;
  String examArName;
  String examEnName;
  double studentMark;
  bool isAvailable;

  DetailsResultModel(
    this.id,
    this.examPeriodMinute,
    this.examArName,

    this.examEnName,
    this.studentMark,
    this.isAvailable,
  );
}

class QuestionDetailsResultModel {
  int questionId;
  String questionText;
  String questionAttach;
  String questionType;
  double questionMark;
  int questionTypeId;
  StudentChoiceResultModel? studentChoice;
  List<StudentCompleteChoiceResultModel>? studentCompleteChoice;
  List<StudentCompleteContainerChoiceResultModel>?
      studentCompleteContainerChoice;
  List<StudentMatchingChoiceResultModel>? studentMatchingChoice;
  StudentVoiceChoiceResultModel? studentVoiceChoice;
  StudentTranslateChoiceResultModel? studentTranslateChoice;

  QuestionDetailsResultModel(
    this.questionId,
    this.questionText,
    this.questionAttach,
    this.questionType,
    this.questionMark,
    this.questionTypeId,
    this.studentChoice,
    this.studentCompleteChoice,
    this.studentCompleteContainerChoice,
    this.studentMatchingChoice,
    this.studentVoiceChoice,
    this.studentTranslateChoice,
  );
}

class StudentChoiceResultModel {
  int id;
  int examId;
  int studentUserId;
  int questionId;
  int studentChoiceId;
  double questionFinalMark;
  String result;

  StudentChoiceResultModel(
      this.id,
      this.examId,
      this.studentUserId,
      this.questionId,
      this.studentChoiceId,
      this.questionFinalMark,
      this.result);
}

class StudentCompleteChoiceResultModel {
  int id;
  int examId;
  int questionId;
  int questionSentenceId;
  int questionAnswerId;
  int examStudentQuestionId;
  int studentUserId;
  int mark;
  bool result;

  StudentCompleteChoiceResultModel(
      this.id,
      this.examId,
      this.questionId,
      this.questionSentenceId,
      this.questionAnswerId,
      this.examStudentQuestionId,
      this.studentUserId,
      this.mark,
      this.result);
}

class StudentCompleteContainerChoiceResultModel {
  int id;
  int examId;
  int questionId;
  int questionSentenceId;
  int questionAnswerId;
  int examStudentQuestionId;
  int studentUserId;
  int mark;
  bool result;

  StudentCompleteContainerChoiceResultModel(
      this.id,
      this.examId,
      this.questionId,
      this.questionSentenceId,
      this.questionAnswerId,
      this.examStudentQuestionId,
      this.studentUserId,
      this.mark,
      this.result);
}

class StudentMatchingChoiceResultModel {
  int id;
  int examId;
  int studentUserId;
  int questionId;
  int questionDetRightSideId;
  int questionDetLeftSideId;
  int examStudentQuestionId;
  bool result;
  int mark;

  StudentMatchingChoiceResultModel(
      this.id,
      this.examId,
      this.studentUserId,
      this.questionId,
      this.questionDetRightSideId,
      this.questionDetLeftSideId,
      this.examStudentQuestionId,
      this.result,
      this.mark);
}

class StudentVoiceChoiceResultModel {
  int id;
  int studentUserId;
  int examId;
  int questionId;
  int voiceQuestionAnswerId;
  int examStudentQuestionId;
  String voiceQuestionAnswer;
  bool result;
  int mark;

  StudentVoiceChoiceResultModel(
      this.id,
      this.studentUserId,
      this.examId,
      this.questionId,
      this.voiceQuestionAnswerId,
      this.examStudentQuestionId,
      this.voiceQuestionAnswer,
      this.result,
      this.mark);
}

class StudentTranslateChoiceResultModel {
  int id;
  int examId;
  int questionId;
  int examStudentQuestionId;
  int translateQuestionId;
  int studentUserId;
  String translateAnswerText;
  int mark;
  String result;

  StudentTranslateChoiceResultModel(
      this.id,
      this.examId,
      this.questionId,
      this.examStudentQuestionId,
      this.translateQuestionId,
      this.studentUserId,
      this.translateAnswerText,
      this.mark,
      this.result);
}

class McqResultModel {
  int id;
  int questionId;
  String mcqText;
  String mcqAttach;
  bool isCorrect;

  McqResultModel(
    this.id,
    this.questionId,
    this.mcqText,
    this.mcqAttach,
    this.isCorrect,
  );
}

class QCompleteResultModel {
  List<QCompleteSequenceResultModel>? questionSequence;
  List<QCompleteAnswerResultModel>? questionAnswer;

  QCompleteResultModel(
    this.questionSequence,
    this.questionAnswer,
  );
}

class QCompleteSequenceResultModel {
  int questionSentenceId;
  int questionId;
  String firstSentence;
  String secondSentence;
  int mark;

  QCompleteSequenceResultModel(
    this.questionSentenceId,
    this.questionId,
    this.firstSentence,
    this.secondSentence,
    this.mark,
  );
}

class QCompleteAnswerResultModel {
  int questionAnswerId;
  String answer;

  QCompleteAnswerResultModel(
    this.questionAnswerId,
    this.answer,
  );
}

class QContainerResultModel {
  List<QContainerQuestionSequenceResultModel>? questionSequence;
  List<QContainerAnswerResultModel>? questionAnswer;

  QContainerResultModel(this.questionSequence, this.questionAnswer);
}

class QContainerQuestionSequenceResultModel {
  int questionSentenceId;
  int questionId;
  String sentence;
  int mark;

  QContainerQuestionSequenceResultModel(
    this.questionSentenceId,
    this.questionId,
    this.sentence,
    this.mark,
  );
}

class QContainerAnswerResultModel {
  int questionAnswerId;
  String answer;

  QContainerAnswerResultModel(
    this.questionAnswerId,
    this.answer,
  );
}

class MatchingQuestionResultModel {
  List<RightSideMatchingResultModel>? rightSideMatching;
  List<LeftSideMatchingResultModel>? leftSideMatching;

  MatchingQuestionResultModel(
    this.rightSideMatching,
    this.leftSideMatching,
  );
}

class RightSideMatchingResultModel {
  int id;
  int questionId;
  String rightSideText;
  int mark;

  RightSideMatchingResultModel(
    this.id,
    this.questionId,
    this.rightSideText,
    this.mark,
  );
}

class LeftSideMatchingResultModel {
  int id;
  int questionId;
  String leftSideText;

  LeftSideMatchingResultModel(
    this.id,
    this.questionId,
    this.leftSideText,
  );
}

class QVoiceResultModel {
  List<QVoiceQuestionAudioResultModel>? questionAudio;
  List<QVoiceQuestionAnswerResultModel>? questionAnswer;

  QVoiceResultModel(
    this.questionAudio,
    this.questionAnswer,
  );
}

class QVoiceQuestionAudioResultModel {
  int id;
  int questionId;
  String voiceQuestion;
  String imageQuestion;
  int mark;

  QVoiceQuestionAudioResultModel(
    this.id,
    this.questionId,
    this.voiceQuestion,
    this.imageQuestion,
    this.mark,
  );
}

class QVoiceQuestionAnswerResultModel {
  int id;
  List<String>? answer;

  QVoiceQuestionAnswerResultModel(
    this.id,
    this.answer,
  );
}

class QTranslateResultModel {
  List<QuestionTranslateResultModel>? questionTranslate;
  QuestionTranslateAnswerModel? questionTranslateAnswer;

  QTranslateResultModel(
    this.questionTranslate,
    this.questionTranslateAnswer,
  );
}

class QuestionTranslateResultModel {
  int id;
  int questionId;
  String questionVoice;
  String questionText;
  int mark;

  QuestionTranslateResultModel(
    this.id,
    this.questionId,
    this.questionVoice,
    this.questionText,
    this.mark,
  );
}
