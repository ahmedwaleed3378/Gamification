import 'package:gamification/data/responses/exam/exam_details_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_result_response.g.dart';

@JsonSerializable()
class ExamResultResponse {
  @JsonKey(name: 'ex')
  ExResponse? ex;
  @JsonKey(name: 'item')
  ItemResponse? item;
  @JsonKey(name: 'teacherName')
  String? teacherName;
  @JsonKey(name: 'SubjectName')
  String? subjectName;

  ExamResultResponse({
    this.ex,
    this.item,
    this.teacherName,
    this.subjectName,
  });

  factory ExamResultResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamResultResponseToJson(this);
}

@JsonSerializable()
class ItemResponse {
  @JsonKey(name: 'details')
  DetailsResultResponse? details;
  @JsonKey(name: 'groups')
  List<GroupsResult>? groups;

  ItemResponse({
    this.details,
    this.groups,
  });

  factory ItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemResponseToJson(this);
}

@JsonSerializable()
class ExResponse {
  @JsonKey(name: 'PointsGained')
  double? pointsGained;
  @JsonKey(name: 'userExamPoint')
  double? userExamPoint;
  @JsonKey(name: 'userExamExperince')
  double? userExamExperince;
  @JsonKey(name: 'showExamFinishMessage')
  bool? showExamFinishMessage;
  @JsonKey(name: 'showExamContent')
  bool? showExamContent;
  @JsonKey(name: 'showResult')
  bool? showResult;
  @JsonKey(name: 'total_mark')
  int? totalMark;
  @JsonKey(name: 'question_count')
  int? questionCount;
  @JsonKey(name: 'exam_result')
  double? examResult;
  @JsonKey(name: 'studentBalance')
  double? studentBalance;
  @JsonKey(name: 'exam_rate')
  int? examRate;
  @JsonKey(name: 'TimeAnswer')
  String? timeAnswer;
  @JsonKey(name: 'exam_student')
  ExamStudentResponse? examStudent;
  @JsonKey(name: 'ExamRequiresTeacherInput')
  bool? examRequiresTeacherInput;
  @JsonKey(name: 'IsResultAvalable')
  bool? isResultAvailable;
  @JsonKey(name: 'examResultDate')
  String? examResultDate;
  @JsonKey(name: 'examDuration')
  String? examDuration;
  @JsonKey(name: 'examResultTime')
  String? examResultTime;
  @JsonKey(name: 'solvedExamStudent_ID')
  int? solvedExamStudentID;
  @JsonKey(name: 'repeatable')
  bool? repeatable;
  @JsonKey(name: 'isSolvedOffline')
  bool? isSolvedOffline;
  @JsonKey(name: 'repeatableExam_Count')
  int? repeatableExamCount;

  ExResponse(
      {this.pointsGained,
      this.userExamExperince,
      this.showExamFinishMessage,
      this.showExamContent,
      this.showResult,
      this.totalMark,
      this.questionCount,
      this.examResult,
      this.examRate,
      this.timeAnswer,
      this.examStudent,
      this.examRequiresTeacherInput,
      this.isResultAvailable,
      this.solvedExamStudentID,
      this.repeatable,
      this.repeatableExamCount,
      this.studentBalance,
      this.examDuration,
      this.examResultDate,
      this.examResultTime,
      this.userExamPoint,
      this.isSolvedOffline});

  factory ExResponse.fromJson(Map<String, dynamic> json) =>
      _$ExResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExResponseToJson(this);
}

@JsonSerializable()
class ExamStudentResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'exam_id')
  int? examId;
  @JsonKey(name: 'exam_date')
  String? examDate;
  @JsonKey(name: 'submit_date')
  String? submitDate;
  @JsonKey(name: 'exam_amount')
  double? examAmount;
  @JsonKey(name: 'state')
  bool? state;
  @JsonKey(name: 'is_submitted')
  bool? isSubmitted;
  @JsonKey(name: 'correct_complete')
  int? correctComplete;
  @JsonKey(name: 'exam_start_time')
  String? examStartTime;
  @JsonKey(name: 'exam_end_time')
  String? examEndTime;
  @JsonKey(name: 'exam_grade')
  double? examGrade;
  @JsonKey(name: 'student_grade')
  double? studentGrade;

  ExamStudentResponse({
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
  });

  factory ExamStudentResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamStudentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamStudentResponseToJson(this);
}

@JsonSerializable()
class DetailsResultResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'exam_period_minute')
  int? examPeriodMinute;
  @JsonKey(name: 'exam_ar_name')
  String? examArName;
  @JsonKey(name: 'exam_en_name')
  String? examEnName;
  @JsonKey(name: 'studentMark')
  double? studentMark;
  @JsonKey(name: 'IsAvaliable')
  bool? isAvailable;

  DetailsResultResponse({
    this.id,
    this.examArName,
    this.examEnName,
    this.studentMark,
    this.isAvailable,
    this.examPeriodMinute
  });

  factory DetailsResultResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailsResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsResultResponseToJson(this);
}

@JsonSerializable()
class GroupsResult {
  @JsonKey(name: 'GroupId')
  int? groupId;
  @JsonKey(name: 'GroupName')
  String? groupName;
  @JsonKey(name: 'Heads')
  List<HeadsResultResponse>? heads;

  GroupsResult({
    this.groupId,
    this.groupName,
    this.heads,
  });

  factory GroupsResult.fromJson(Map<String, dynamic> json) =>
      _$GroupsResultFromJson(json);

  Map<String, dynamic> toJson() => _$GroupsResultToJson(this);
}

@JsonSerializable()
class HeadsResultResponse {
  @JsonKey(name: 'GroupId')
  int? groupId;
  @JsonKey(name: 'HeadId')
  int? headId;
  @JsonKey(name: 'HeadName')
  String? headName;
  @JsonKey(name: 'Questions')
  List<QuestionsResultResponse>? questions;

  HeadsResultResponse({
    this.groupId,
    this.headId,
    this.headName,
    this.questions,
  });

  factory HeadsResultResponse.fromJson(Map<String, dynamic> json) =>
      _$HeadsResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HeadsResultResponseToJson(this);
}

@JsonSerializable()
class QuestionsResultResponse {
  @JsonKey(name: 'HeadId')
  int? headId;
  @JsonKey(name: 'Id')
  int? id;
  @JsonKey(name: 'QuestionDetails')
  QuestionDetailsResultResponse? questionDetails;
  @JsonKey(name: 'MCQ')
  List<McqResponse>? mcq;
  @JsonKey(name: 'Q_Complete')
  QCompleteResponse? complete;
  @JsonKey(name: 'Q_Container')
  QContainerResponse? qContainer;
  @JsonKey(name: 'matcingQuestion')
  MatchingQuestionResponse? matchingQuestion;
  @JsonKey(name: 'Q_Voice')
  QVoiceResponse? qVoice;
  @JsonKey(name: 'Q_Translate')
  QTranslateResponse? qTranslate;

  QuestionsResultResponse({
    this.headId,
    this.id,
    this.questionDetails,
    this.mcq,
    this.complete,
    this.qContainer,
    this.matchingQuestion,
    this.qVoice,
    this.qTranslate,
  });

  factory QuestionsResultResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsResultResponseToJson(this);
}

@JsonSerializable()
class QuestionDetailsResultResponse {
  @JsonKey(name: 'questionId')
  int? questionId;
  @JsonKey(name: 'questionText')
  String? questionText;
  @JsonKey(name: 'questionAttach')
  String? questionAttach;
  @JsonKey(name: 'questionType')
  String? questionType;
  @JsonKey(name: 'questionMark')
  double? questionMark;
  @JsonKey(name: 'questionTypeId')
  int? questionTypeId;
  @JsonKey(name: 'StudentChoice')
  StudentChoiceResultResponse? studentChoice;
  @JsonKey(name: 'StudentCompleteChoice')
  List<StudentCompleteChoiceResultResponse>? studentCompleteChoice;
  @JsonKey(name: 'StudentCompleteContainerChoice')
  List<StudentCompleteContainerChoiceResultResponse>?
      studentCompleteContainerChoice;
  @JsonKey(name: 'StudentMatchingChoice')
  List<StudentMatchingChoiceResultResponse>? studentMatchingChoice;
  @JsonKey(name: 'StudentVoiceChoice')
  StudentVoiceChoiceResultResponse? studentVoiceChoice;
  @JsonKey(name: 'StudentTranslateChoice')
  StudentTranslateChoiceResultResponse? studentTranslateChoice;

  QuestionDetailsResultResponse({
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
  });

  factory QuestionDetailsResultResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionDetailsResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionDetailsResultResponseToJson(this);
}

@JsonSerializable()
class StudentChoiceResultResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'exam_id')
  int? examId;
  @JsonKey(name: 'studentUserId')
  int? studentUserId;
  @JsonKey(name: 'question_id')
  int? questionId;
  @JsonKey(name: 'student_choice_id')
  int? studentChoiceId;
  @JsonKey(name: 'question_final_mark')
  double? questionFinalMark;
  @JsonKey(name: 'RESULT')
  String? result;

  StudentChoiceResultResponse(
      {this.id,
      this.examId,
      this.studentUserId,
      this.questionId,
      this.studentChoiceId,
      this.questionFinalMark,
      this.result});

  factory StudentChoiceResultResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentChoiceResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentChoiceResultResponseToJson(this);
}

@JsonSerializable()
class StudentCompleteChoiceResultResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'exam_id')
  int? examId;
  @JsonKey(name: 'question_id')
  int? questionId;
  @JsonKey(name: 'question_sentence_id')
  int? questionSentenceId;
  @JsonKey(name: 'question_answer_id')
  int? questionAnswerId;
  @JsonKey(name: 'exam_student_question_id')
  int? examStudentQuestionId;
  @JsonKey(name: 'student_user_id')
  int? studentUserId;
  @JsonKey(name: 'mark')
  int? mark;
  @JsonKey(name: 'result')
  bool? result;

  StudentCompleteChoiceResultResponse(
      {this.id,
      this.examId,
      this.questionId,
      this.questionSentenceId,
      this.questionAnswerId,
      this.examStudentQuestionId,
      this.studentUserId,
      this.mark,
      this.result});

  factory StudentCompleteChoiceResultResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StudentCompleteChoiceResultResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$StudentCompleteChoiceResultResponseToJson(this);
}

@JsonSerializable()
class StudentCompleteContainerChoiceResultResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'exam_id')
  int? examId;
  @JsonKey(name: 'question_id')
  int? questionId;
  @JsonKey(name: 'question_sentence_id')
  int? questionSentenceId;
  @JsonKey(name: 'question_answer_id')
  int? questionAnswerId;
  @JsonKey(name: 'exam_student_question_id')
  int? examStudentQuestionId;
  @JsonKey(name: 'student_user_id')
  int? studentUserId;
  @JsonKey(name: 'mark')
  int? mark;
  @JsonKey(name: 'result')
  bool? result;

  StudentCompleteContainerChoiceResultResponse(
      {this.id,
      this.examId,
      this.questionId,
      this.questionSentenceId,
      this.questionAnswerId,
      this.examStudentQuestionId,
      this.studentUserId,
      this.mark,
      this.result});

  factory StudentCompleteContainerChoiceResultResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StudentCompleteContainerChoiceResultResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$StudentCompleteContainerChoiceResultResponseToJson(this);
}

@JsonSerializable()
class StudentMatchingChoiceResultResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'exam_id')
  int? examId;
  @JsonKey(name: 'studentUserId')
  int? studentUserId;
  @JsonKey(name: 'question_id')
  int? questionId;
  @JsonKey(name: 'question_det_right_side_id')
  int? questionDetRightSideId;
  @JsonKey(name: 'question_det_left_side_id')
  int? questionDetLeftSideId;
  @JsonKey(name: 'exam_student_question_Id')
  int? examStudentQuestionId;
  @JsonKey(name: 'result')
  bool? result;
  @JsonKey(name: 'mark')
  int? mark;

  StudentMatchingChoiceResultResponse(
      {this.id,
      this.examId,
      this.studentUserId,
      this.questionId,
      this.questionDetRightSideId,
      this.questionDetLeftSideId,
      this.examStudentQuestionId,
      this.result,
      this.mark});

  factory StudentMatchingChoiceResultResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StudentMatchingChoiceResultResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$StudentMatchingChoiceResultResponseToJson(this);
}

@JsonSerializable()
class StudentVoiceChoiceResultResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'student_user_id')
  int? studentUserId;
  @JsonKey(name: 'exam_id')
  int? examId;
  @JsonKey(name: 'question_id')
  int? questionId;
  @JsonKey(name: 'voice_question_answer_id')
  int? voiceQuestionAnswerId;
  @JsonKey(name: 'exam_student_question_id')
  int? examStudentQuestionId;
  @JsonKey(name: 'voice_question_answer')
  String? voiceQuestionAnswer;
  @JsonKey(name: 'result')
  bool? result;
  @JsonKey(name: 'mark')
  int? mark;

  StudentVoiceChoiceResultResponse(
      {this.id,
      this.studentUserId,
      this.examId,
      this.questionId,
      this.voiceQuestionAnswerId,
      this.examStudentQuestionId,
      this.voiceQuestionAnswer,
      this.result,
      this.mark});

  factory StudentVoiceChoiceResultResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StudentVoiceChoiceResultResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$StudentVoiceChoiceResultResponseToJson(this);
}

@JsonSerializable()
class StudentTranslateChoiceResultResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'exam_id')
  int? examId;
  @JsonKey(name: 'question_id')
  int? questionId;
  @JsonKey(name: 'exam_student_question_id')
  int? examStudentQuestionId;
  @JsonKey(name: 'translate_question_id')
  int? translateQuestionId;
  @JsonKey(name: 'student_user_id')
  int? studentUserId;
  @JsonKey(name: 'translate_answer_text')
  String? translateAnswerText;
  @JsonKey(name: 'mark')
  int? mark;
  @JsonKey(name: 'result')
  String? result;

  StudentTranslateChoiceResultResponse(
      {this.id,
      this.examId,
      this.questionId,
      this.examStudentQuestionId,
      this.translateQuestionId,
      this.studentUserId,
      this.translateAnswerText,
      this.mark,
      this.result});

  factory StudentTranslateChoiceResultResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StudentTranslateChoiceResultResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$StudentTranslateChoiceResultResponseToJson(this);
}

@JsonSerializable()
class McqResultResponse {
  @JsonKey(name: 'Id')
  int? id;
  @JsonKey(name: 'questionId')
  int? questionId;
  @JsonKey(name: 'MCQText')
  String? mcqText;
  @JsonKey(name: 'MCQAttach')
  String? mcqAttach;
  @JsonKey(name: 'IsCorrect')
  bool? isCorrect;

  McqResultResponse({
    this.id,
    this.questionId,
    this.mcqText,
    this.mcqAttach,
    this.isCorrect,
  });

  factory McqResultResponse.fromJson(Map<String, dynamic> json) =>
      _$McqResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$McqResultResponseToJson(this);
}

@JsonSerializable()
class QCompleteResultResponse {
  @JsonKey(name: 'question_sequence')
  List<QCompleteSequenceResultResponse>? questionSequence;
  @JsonKey(name: 'question_answer')
  List<QCompleteAnswerResultResponse>? questionAnswer;

  QCompleteResultResponse({
    this.questionSequence,
    this.questionAnswer,
  });

  factory QCompleteResultResponse.fromJson(Map<String, dynamic> json) =>
      _$QCompleteResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QCompleteResultResponseToJson(this);
}

@JsonSerializable()
class QCompleteSequenceResultResponse {
  @JsonKey(name: 'question_sentence_id')
  int? questionSentenceId;
  @JsonKey(name: 'questionId')
  int? questionId;
  @JsonKey(name: 'first_sentence')
  String? firstSentence;
  @JsonKey(name: 'second_sentence')
  String? secondSentence;
  @JsonKey(name: 'mark')
  int? mark;

  QCompleteSequenceResultResponse({
    this.questionSentenceId,
    this.questionId,
    this.firstSentence,
    this.secondSentence,
    this.mark,
  });

  factory QCompleteSequenceResultResponse.fromJson(Map<String, dynamic> json) =>
      _$QCompleteSequenceResultResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$QCompleteSequenceResultResponseToJson(this);
}

@JsonSerializable()
class QCompleteAnswerResultResponse {
  @JsonKey(name: 'question_answer_id')
  int? questionAnswerId;
  @JsonKey(name: 'answer')
  String? answer;

  QCompleteAnswerResultResponse({
    this.questionAnswerId,
    this.answer,
  });

  factory QCompleteAnswerResultResponse.fromJson(Map<String, dynamic> json) =>
      _$QCompleteAnswerResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QCompleteAnswerResultResponseToJson(this);
}

@JsonSerializable()
class QContainerResultResponse {
  @JsonKey(name: 'question_sequence')
  List<QContainerQuestionSequenceResultResponse>? questionSequence;
  @JsonKey(name: 'question_answer')
  List<QContainerAnswerResultResponse>? questionAnswer;

  QContainerResultResponse({this.questionSequence, this.questionAnswer});

  factory QContainerResultResponse.fromJson(Map<String, dynamic> json) =>
      _$QContainerResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QContainerResultResponseToJson(this);
}

@JsonSerializable()
class QContainerQuestionSequenceResultResponse {
  @JsonKey(name: 'question_sentence_id')
  int? questionSentenceId;
  @JsonKey(name: 'questionId')
  int? questionId;
  @JsonKey(name: 'sentence')
  String? sentence;
  @JsonKey(name: 'mark')
  int? mark;

  QContainerQuestionSequenceResultResponse({
    this.questionSentenceId,
    this.questionId,
    this.sentence,
    this.mark,
  });

  factory QContainerQuestionSequenceResultResponse.fromJson(
          Map<String, dynamic> json) =>
      _$QContainerQuestionSequenceResultResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$QContainerQuestionSequenceResultResponseToJson(this);
}

@JsonSerializable()
class QContainerAnswerResultResponse {
  @JsonKey(name: 'question_answer_id')
  int? questionAnswerId;
  @JsonKey(name: 'answer')
  String? answer;

  QContainerAnswerResultResponse({
    this.questionAnswerId,
    this.answer,
  });

  factory QContainerAnswerResultResponse.fromJson(Map<String, dynamic> json) =>
      _$QContainerAnswerResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QContainerAnswerResultResponseToJson(this);
}

@JsonSerializable()
class MatchingQuestionResultResponse {
  @JsonKey(name: 'rightSideMatching')
  List<RightSideMatchingResultResponse>? rightSideMatching;
  @JsonKey(name: 'leftSideMatching')
  List<LeftSideMatchingResultResponse>? leftSideMatching;

  MatchingQuestionResultResponse({
    this.rightSideMatching,
    this.leftSideMatching,
  });

  factory MatchingQuestionResultResponse.fromJson(Map<String, dynamic> json) =>
      _$MatchingQuestionResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MatchingQuestionResultResponseToJson(this);
}

@JsonSerializable()
class RightSideMatchingResultResponse {
  @JsonKey(name: 'Id')
  int? id;
  @JsonKey(name: 'questionId')
  int? questionId;
  @JsonKey(name: 'rightSideText')
  String? rightSideText;
  @JsonKey(name: 'mark')
  int? mark;

  RightSideMatchingResultResponse({
    this.id,
    this.questionId,
    this.rightSideText,
    this.mark,
  });

  factory RightSideMatchingResultResponse.fromJson(Map<String, dynamic> json) =>
      _$RightSideMatchingResultResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RightSideMatchingResultResponseToJson(this);
}

@JsonSerializable()
class LeftSideMatchingResultResponse {
  @JsonKey(name: 'Id')
  int? id;
  @JsonKey(name: 'questionId')
  int? questionId;
  @JsonKey(name: 'leftSideText')
  String? leftSideText;

  LeftSideMatchingResultResponse({
    this.id,
    this.questionId,
    this.leftSideText,
  });

  factory LeftSideMatchingResultResponse.fromJson(Map<String, dynamic> json) =>
      _$LeftSideMatchingResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LeftSideMatchingResultResponseToJson(this);
}

@JsonSerializable()
class QVoiceResultResponse {
  @JsonKey(name: 'Question_Audio')
  List<QVoiceQuestionAudioResultResponse>? questionAudio;
  @JsonKey(name: 'question_answer')
  List<QVoiceQuestionAnswerResultResponse>? questionAnswer;

  QVoiceResultResponse({
    this.questionAudio,
    this.questionAnswer,
  });

  factory QVoiceResultResponse.fromJson(Map<String, dynamic> json) =>
      _$QVoiceResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QVoiceResultResponseToJson(this);
}

@JsonSerializable()
class QVoiceQuestionAudioResultResponse {
  @JsonKey(name: 'Id')
  int? id;
  @JsonKey(name: 'questionId')
  int? questionId;
  @JsonKey(name: 'voice_question')
  String? voiceQuestion;
  @JsonKey(name: 'image_question')
  String? imageQuestion;
  @JsonKey(name: 'mark')
  int? mark;

  QVoiceQuestionAudioResultResponse({
    this.id,
    this.questionId,
    this.voiceQuestion,
    this.imageQuestion,
    this.mark,
  });

  factory QVoiceQuestionAudioResultResponse.fromJson(
          Map<String, dynamic> json) =>
      _$QVoiceQuestionAudioResultResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$QVoiceQuestionAudioResultResponseToJson(this);
}

@JsonSerializable()
class QVoiceQuestionAnswerResultResponse {
  @JsonKey(name: 'Id')
  int? id;
  @JsonKey(name: 'answer')
  List<String>? answer;

  QVoiceQuestionAnswerResultResponse({
    this.id,
    this.answer,
  });

  factory QVoiceQuestionAnswerResultResponse.fromJson(
          Map<String, dynamic> json) =>
      _$QVoiceQuestionAnswerResultResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$QVoiceQuestionAnswerResultResponseToJson(this);
}

@JsonSerializable()
class QTranslateResultResponse {
  @JsonKey(name: 'question_translate')
  List<QuestionTranslateResultResponse>? questionTranslate;
  @JsonKey(name: 'question_Transalte_answer')
  QuestionTranslateAnswerResponse? questionTranslateAnswer;

  QTranslateResultResponse({
    this.questionTranslate,
    this.questionTranslateAnswer,
  });

  factory QTranslateResultResponse.fromJson(Map<String, dynamic> json) =>
      _$QTranslateResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QTranslateResultResponseToJson(this);
}

@JsonSerializable()
class QuestionTranslateResultResponse {
  @JsonKey(name: 'Id')
  int? id;
  @JsonKey(name: 'questionId')
  int? questionId;
  @JsonKey(name: 'Qusetion_Voice')
  String? questionVoice;
  @JsonKey(name: 'Qusetion_Text')
  String? questionText;
  @JsonKey(name: 'Mark')
  int? mark;

  QuestionTranslateResultResponse({
    this.id,
    this.questionId,
    this.questionVoice,
    this.questionText,
    this.mark,
  });

  factory QuestionTranslateResultResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionTranslateResultResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$QuestionTranslateResultResponseToJson(this);
}
