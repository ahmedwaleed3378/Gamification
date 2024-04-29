import 'package:gamification/domain/model/exam/exam_result_model.dart';

class ExamDetailsModel {
  int returnValue;
  MvModel? mv;
  ExamModel? exam;
  String teacherName;

  ExamDetailsModel(
    this.returnValue,
    this.mv,
    this.exam,
    this.teacherName,
  );
}

class MvModel {
  int examId;
  int studentId;
  ExamStudentResultModel? examStudent;
  SubjectModel? subject;
  String timeStart;
  String timeAnswer;
  int examTotalMark;
  String examStarTime;
  bool isAvailable;
  int questionId;

  MvModel(
    this.examId,
    this.studentId,
    this.examStudent,
    this.subject,
    this.timeStart,
    this.timeAnswer,
    this.examTotalMark,
    this.examStarTime,
    this.isAvailable,
    this.questionId,
  );
}

class ExamStudentResultModel {
  int id;
  int examId;
  int studentUserId;
  String examDate;
  String submitDate;
  bool state;
  bool isSubmitted;
  String examStartTime;
  String examEndTime;
  int examGrade;
  int studentGrade;

  ExamStudentResultModel(
    this.id,
    this.examId,
    this.studentUserId,
    this.examDate,
    this.submitDate,
    this.state,
    this.isSubmitted,
    this.examStartTime,
    this.examEndTime,
    this.examGrade,
    this.studentGrade,
  );
}

class SubjectModel {
  int subjectId;
  String subjectArName;
  String subjectEnName;
  String subjectCode;
  String subjectEndDate;
  String subjectDescription;
  String subjectThumb;
  double matCount;
  double examCount;
  double docAttachCount;
  String stageName;
  String attachPath;

  SubjectModel(
    this.subjectId,
    this.subjectArName,
    this.subjectEnName,
    this.subjectCode,
    this.subjectEndDate,
    this.subjectDescription,
    this.subjectThumb,
    this.matCount,
    this.examCount,
    this.docAttachCount,
    this.stageName,
    this.attachPath,
  );
}

class ExamModel {
  DetailsModel? details;
  int correctArticle;
  int isSolvedMcqAll;
  int artSolvedNotCorrected;
  List<GroupsModel>? groups;

  ExamModel(
    this.details,
    this.correctArticle,
    this.isSolvedMcqAll,
    this.artSolvedNotCorrected,
    this.groups,
  );
}

class DetailsModel {
  int id;
  String examArName;
  String examEnName;
  int examTypeId;
  int examPeriodMinute;
  double examGrade;
  String avilableDateFrom;
  String avilableDateTo;
  String resultDate;
  String fromHour;
  String toHour;
  String resultTime;
  int subjectID;
  int requiredMarkToPass;
  double studentMark;
  bool isAvaliable;
  bool isSolved;

  DetailsModel(
    this.id,
    this.examArName,
    this.examEnName,
    this.examTypeId,
    this.examPeriodMinute,
    this.examGrade,
    this.avilableDateFrom,
    this.avilableDateTo,
    this.resultDate,
    this.fromHour,
    this.toHour,
    this.resultTime,
    this.subjectID,
    this.requiredMarkToPass,
    this.studentMark,
    this.isAvaliable,
    this.isSolved,
  );
}

class GroupsModel {
  int groupId;
  String groupName;
  List<HeadsModel>? heads;

  GroupsModel(
    this.groupId,
    this.groupName,
    this.heads,
  );
}

class HeadsModel {
  int groupId;
  int headId;
  String headName;
  List<QuestionsModel>? questions;

  HeadsModel(
    this.groupId,
    this.headId,
    this.headName,
    this.questions,
  );
}

class QuestionsModel {
  int headId;
  int id;
  QuestionDetailsModel? questionDetails;
  QuestionDetailsResultModel? questionDetailsResults;
  List<McqModel>? mcq;
  QCompleteModel? complete;
  QContainerModel? qContainer;
  MatchingQuestionModel? matchingQuestion;
  QVoiceModel? qVoice;
  QTranslateModel? qTranslate;

  QuestionsModel(
    this.headId,
    this.id,
    this.questionDetails,
    this.questionDetailsResults,
    this.mcq,
    this.complete,
    this.qContainer,
    this.matchingQuestion,
    this.qVoice,
    this.qTranslate,
  );
}

class QuestionDetailsModel {
  int questionId;
  String questionText;
  String questionAttach;
  String questionType;
  double questionMark;
  int questionTypeId;
  String perfectAnswer;
  int studentChoice;
  List<StudentCompleteChoiceModel>? studentCompleteChoice;
  List<StudentCompleteContainerChoiceModel>? studentCompleteContainerChoice;
  List<StudentMatchingChoiceModel>? studentMatchingChoice;
  String studentVoiceChoice;
  String studentTranslateChoice;
  String answerText;
  String attachAnswer;
  int studentMark;

  QuestionDetailsModel(
    this.questionId,
    this.questionText,
    this.questionAttach,
    this.questionType,
    this.questionMark,
    this.questionTypeId,
    this.perfectAnswer,
    this.studentChoice,
    this.studentCompleteChoice,
    this.studentCompleteContainerChoice,
    this.studentMatchingChoice,
    this.studentVoiceChoice,
    this.studentTranslateChoice,
    this.answerText,
    this.attachAnswer,
    this.studentMark,
  );
}

class StudentCompleteChoiceModel {
  int id;
  int examId;
  int userId;
  int questionId;
  int questionTypeId;
  int choiceId;
  int questionSentenceId;
  int questionAnswerId;
  String attachPath;
  String answerText;
  String dateTime;
  String updatedDateTime;

  StudentCompleteChoiceModel(
    this.id,
    this.examId,
    this.userId,
    this.questionId,
    this.questionTypeId,
    this.choiceId,
    this.questionSentenceId,
    this.questionAnswerId,
    this.attachPath,
    this.answerText,
    this.dateTime,
    this.updatedDateTime,
  );
}

class StudentCompleteContainerChoiceModel {
  int scentenceId;
  int answerId;

  StudentCompleteContainerChoiceModel(
    this.scentenceId,
    this.answerId,
  );
}

class StudentMatchingChoiceModel {
  int rightSideId;
  int leftSideId;

  StudentMatchingChoiceModel(
    this.rightSideId,
    this.leftSideId,
  );
}

class McqModel {
  int id;
  int questionId;
  String mcqText;
  String mcqAttach;
  bool isCorrect;

  McqModel(
    this.id,
    this.questionId,
    this.mcqText,
    this.mcqAttach,
    this.isCorrect,
  );
}

class QCompleteModel {
  List<QCompleteSequenceModel>? questionSequence;
  List<QCompleteAnswerModel>? questionAnswer;

  QCompleteModel(
    this.questionSequence,
    this.questionAnswer,
  );
}

class QCompleteSequenceModel {
  int questionSentenceId;
  int questionId;
  String firstSentence;
  String secondSentence;
  int mark;

  QCompleteSequenceModel(
    this.questionSentenceId,
    this.questionId,
    this.firstSentence,
    this.secondSentence,
    this.mark,
  );
}

class QCompleteAnswerModel {
  int questionAnswerId;
  String answer;

  QCompleteAnswerModel(
    this.questionAnswerId,
    this.answer,
  );
}

class QContainerModel {
  List<QContainerQuestionSequenceModel>? questionSequence;
  List<QContainerAnswerModel>? questionAnswer;
  String basicContainerName;

  QContainerModel(
    this.questionSequence,
    this.questionAnswer,
      this.basicContainerName
  );
}

class QContainerQuestionSequenceModel {
  int questionSentenceId;
  int questionId;
  String sentence;
  int mark;

  QContainerQuestionSequenceModel(
    this.questionSentenceId,
    this.questionId,
    this.sentence,
    this.mark,
  );
}

class QContainerAnswerModel {
  int questionAnswerId;
  String answer;
  bool? isCorrect;
  QContainerAnswerModel(
    this.questionAnswerId,
    this.answer,
    {
      this.isCorrect
    }
  );
}

class MatchingQuestionModel {
  List<RightSideMatchingModel>? rightSideMatching;
  List<LeftSideMatchingModel>? leftSideMatching;

  MatchingQuestionModel(
    this.rightSideMatching,
    this.leftSideMatching,
  );
}

class RightSideMatchingModel {
  int id;
  int questionId;
  String rightSideText;
  int mark;

  RightSideMatchingModel(
    this.id,
    this.questionId,
    this.rightSideText,
    this.mark,
  );
}

class LeftSideMatchingModel {
  int id;
  int questionId;
  String leftSideText;

  LeftSideMatchingModel(
    this.id,
    this.questionId,
    this.leftSideText,
  );
}

class QVoiceModel {
  List<QVoiceQuestionAudioModel>? questionAudio;
  List<QVoiceQuestionAnswerModel>? questionAnswer;

  QVoiceModel(
    this.questionAudio,
    this.questionAnswer,
  );
}

class QVoiceQuestionAudioModel {
  int id;
  int questionId;
  String voiceQuestion;
  String imageQuestion;
  int mark;

  QVoiceQuestionAudioModel(
    this.id,
    this.questionId,
    this.voiceQuestion,
    this.imageQuestion,
    this.mark,
  );
}

class QVoiceQuestionAnswerModel {
  int id;
  String trueAnswer;
  List<String>? answer;
  int answerLength;
  QVoiceQuestionAnswerModel(
    this.id,
    this.answer,
    this.trueAnswer,
    this.answerLength
  );
}

class QTranslateModel {
  List<QuestionTranslateModel>? questionTranslate;
  QuestionTranslateAnswerModel? questionTranslateAnswer;

  QTranslateModel(
    this.questionTranslate,
    this.questionTranslateAnswer,
  );
}

class QuestionTranslateModel {
  int id;
  int questionId;
  String questionVoice;
  String questionText;
  int mark;

  QuestionTranslateModel(
    this.id,
    this.questionId,
    this.questionVoice,
    this.questionText,
    this.mark,
  );
}

class QuestionTranslateAnswerModel {
  int id;
  List<String>? answer;

  QuestionTranslateAnswerModel(
    this.id,
    this.answer,
  );
}
