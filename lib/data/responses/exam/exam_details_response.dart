import 'package:json_annotation/json_annotation.dart';

part 'exam_details_response.g.dart';

@JsonSerializable()
class ExamDetailsResponse {
  @JsonKey(name: 'returnValue')
  int? returnValue;
  @JsonKey(name: 'mv')
  MvResponse? mv;
  @JsonKey(name: 'exam')
  ExamResponse? exam;
  @JsonKey(name: 'teacherName')
  String? teacherName;

  ExamDetailsResponse({
    this.returnValue,
    this.mv,
    this.exam,
    this.teacherName,
  });

  factory ExamDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDetailsResponseToJson(this);
}

@JsonSerializable()
class MvResponse {
  @JsonKey(name: 'examId')
  int? examId;
  @JsonKey(name: 'studentId')
  int? studentId;
  @JsonKey(name: 'exam_student')
  ExamStudentResponse? examStudent;
  @JsonKey(name: 'subject')
  SubjectResponse? subject;
  @JsonKey(name: 'TimeStart')
  String? timeStart;
  @JsonKey(name: 'TimeAnswer')
  String? timeAnswer;
  @JsonKey(name: 'examTotalMark')
  int? examTotalMark;
  @JsonKey(name: 'ExamStarTime')
  String? examStarTime;
  @JsonKey(name: 'IsAvailable')
  bool? isAvailable;
  @JsonKey(name: 'questionId')
  int? questionId;

  MvResponse({
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
  });

  factory MvResponse.fromJson(Map<String, dynamic> json) =>
      _$MvResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MvResponseToJson(this);
}

@JsonSerializable()
class ExamStudentResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'exam_id')
  int? examId;
  @JsonKey(name: 'studentUserId')
  int? studentUserId;
  @JsonKey(name: 'exam_date')
  String? examDate;
  @JsonKey(name: 'submit_date')
  String? submitDate;
  @JsonKey(name: 'state')
  bool? state;
  @JsonKey(name: 'is_submitted')
  bool? isSubmitted;
  @JsonKey(name: 'exam_start_time')
  String? examStartTime;
  @JsonKey(name: 'exam_end_time')
  String? examEndTime;
  @JsonKey(name: 'exam_grade')
  int? examGrade;
  @JsonKey(name: 'student_grade')
  int? studentGrade;

  ExamStudentResponse({
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
  });

  factory ExamStudentResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamStudentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamStudentResponseToJson(this);
}

@JsonSerializable()
class SubjectResponse {
  @JsonKey(name: 'subject_id')
  int? subjectId;
  @JsonKey(name: 'subject_ar_name')
  String? subjectArName;
  @JsonKey(name: 'subject_en_name')
  String? subjectEnName;
  @JsonKey(name: 'subjectCode')
  String? subjectCode;
  @JsonKey(name: 'subjectEndDate')
  String? subjectEndDate;
  @JsonKey(name: 'subjectDescription')
  String? subjectDescription;
  @JsonKey(name: 'subjectThumb')
  String? subjectThumb;
  @JsonKey(name: 'matCount')
  double? matCount;
  @JsonKey(name: 'examCount')
  double? examCount;
  @JsonKey(name: 'docAttachCount')
  double? docAttachCount;
  @JsonKey(name: 'stage_name')
  String? stageName;
  @JsonKey(name: 'attach_path')
  String? attachPath;

  SubjectResponse({
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
  });

  factory SubjectResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectResponseToJson(this);
}

@JsonSerializable()
class ExamResponse {
  @JsonKey(name: 'details')
  DetailsResponse? details;
  @JsonKey(name: 'correctArticle')
  int? correctArticle;
  @JsonKey(name: 'isSolvedMcqAll')
  int? isSolvedMcqAll;
  @JsonKey(name: 'ArtSolvedNotCorrected')
  int? artSolvedNotCorrected;
  @JsonKey(name: 'groups')
  List<GroupsResponse>? groups;

  ExamResponse({
    this.details,
    this.correctArticle,
    this.isSolvedMcqAll,
    this.artSolvedNotCorrected,
    this.groups,
  });

  factory ExamResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamResponseToJson(this);
}

@JsonSerializable()
class DetailsResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'exam_ar_name')
  String? examArName;
  @JsonKey(name: 'exam_en_name')
  String? examEnName;
  @JsonKey(name: 'exam_type_id')
  int? examTypeId;
  @JsonKey(name: 'exam_period_minute')
  int? examPeriodMinute;
  @JsonKey(name: 'examGrade')
  double? examGrade;
  @JsonKey(name: 'Avilable_Date_From')
  String? avilableDateFrom;
  @JsonKey(name: 'Avilable_Date_To')
  String? avilableDateTo;
  @JsonKey(name: 'ResultDate')
  String? resultDate;
  @JsonKey(name: 'fromHour')
  String? fromHour;
  @JsonKey(name: 'toHour')
  String? toHour;
  @JsonKey(name: 'ResultTime')
  String? resultTime;
  @JsonKey(name: 'Subject_ID')
  int? subjectID;
  @JsonKey(name: 'requiredMarkToPass')
  int? requiredMarkToPass;
  @JsonKey(name: 'studentMark')
  double? studentMark;
  @JsonKey(name: 'IsAvaliable')
  bool? isAvaliable;
  @JsonKey(name: 'IsSolved')
  bool? isSolved;

  DetailsResponse({
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
  });

  factory DetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsResponseToJson(this);
}

@JsonSerializable()
class GroupsResponse {
  @JsonKey(name: 'GroupId')
  int? groupId;
  @JsonKey(name: 'GroupName')
  String? groupName;
  @JsonKey(name: 'Heads')
  List<HeadsResponse>? heads;

  GroupsResponse({
    this.groupId,
    this.groupName,
    this.heads,
  });

  factory GroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GroupsResponseToJson(this);
}

@JsonSerializable()
class HeadsResponse {
  @JsonKey(name: 'GroupId')
  int? groupId;
  @JsonKey(name: 'HeadId')
  int? headId;
  @JsonKey(name: 'HeadName')
  String? headName;
  @JsonKey(name: 'Questions')
  List<QuestionsResponse>? questions;

  HeadsResponse({
    this.groupId,
    this.headId,
    this.headName,
    this.questions,
  });

  factory HeadsResponse.fromJson(Map<String, dynamic> json) =>
      _$HeadsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HeadsResponseToJson(this);
}

@JsonSerializable()
class QuestionsResponse {
  @JsonKey(name: 'HeadId')
  int? headId;
  @JsonKey(name: 'Id')
  int? id;
  @JsonKey(name: 'QuestionDetails')
  QuestionDetailsResponse? questionDetails;
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

  QuestionsResponse({
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

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsResponseToJson(this);
}

@JsonSerializable()
class QuestionDetailsResponse {
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
  @JsonKey(name: 'perfectAnswer')
  String? perfectAnswer;
  @JsonKey(name: 'StudentChoice')
  int? studentChoice;
  @JsonKey(name: 'StudentCompleteChoice')
  List<StudentCompleteChoiceResponse>? studentCompleteChoice;
  @JsonKey(name: 'StudentCompleteContainerChoice')
  List<StudentCompleteContainerChoiceResponse>? studentCompleteContainerChoice;
  @JsonKey(name: 'StudentMatchingChoice')
  List<StudentMatchingChoiceResponse>? studentMatchingChoice;
  @JsonKey(name: 'StudentVoiceChoice')
  String? studentVoiceChoice;
  @JsonKey(name: 'StudentTranslateChoice')
  String? studentTranslateChoice;
  @JsonKey(name: 'answerText')
  String? answerText;
  @JsonKey(name: 'attachAnswer')
  String? attachAnswer;
  @JsonKey(name: 'studentMark')
  int? studentMark;

  QuestionDetailsResponse({
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
  });

  factory QuestionDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionDetailsResponseToJson(this);
}

@JsonSerializable()
class StudentCompleteChoiceResponse {
  @JsonKey(name: 'Id')
  int? id;
  @JsonKey(name: 'examId')
  int? examId;
  @JsonKey(name: 'userId')
  int? userId;
  @JsonKey(name: 'questionId')
  int? questionId;
  @JsonKey(name: 'questionTypeId')
  int? questionTypeId;
  @JsonKey(name: 'choiceId')
  int? choiceId;
  @JsonKey(name: 'question_sentence_id')
  int? questionSentenceId;
  @JsonKey(name: 'question_answer_id')
  int? questionAnswerId;
  @JsonKey(name: 'attach_path')
  String? attachPath;
  @JsonKey(name: 'answer_text')
  String? answerText;
  @JsonKey(name: 'DateTime')
  String? dateTime;
  @JsonKey(name: 'UpdatedDateTime')
  String? updatedDateTime;

  StudentCompleteChoiceResponse({
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
  });

  factory StudentCompleteChoiceResponse.fromJson(
      Map<String, dynamic> json) =>
      _$StudentCompleteChoiceResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$StudentCompleteChoiceResponseToJson(this);
}

@JsonSerializable()
class StudentCompleteContainerChoiceResponse {
  @JsonKey(name: 'scentenceId')
  int? scentenceId;
  @JsonKey(name: 'answerId')
  int? answerId;

  StudentCompleteContainerChoiceResponse({
    this.scentenceId,
    this.answerId,
  });

  factory StudentCompleteContainerChoiceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StudentCompleteContainerChoiceResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$StudentCompleteContainerChoiceResponseToJson(this);
}

@JsonSerializable()
class StudentMatchingChoiceResponse {
  @JsonKey(name: 'rightSideId')
  int? rightSideId;
  @JsonKey(name: 'leftSideId')
  int? leftSideId;

  StudentMatchingChoiceResponse({
    this.rightSideId,
    this.leftSideId,
  });

  factory StudentMatchingChoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentMatchingChoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentMatchingChoiceResponseToJson(this);
}

@JsonSerializable()
class McqResponse {
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

  McqResponse({
    this.id,
    this.questionId,
    this.mcqText,
    this.mcqAttach,
    this.isCorrect,
  });

  factory McqResponse.fromJson(Map<String, dynamic> json) =>
      _$McqResponseFromJson(json);

  Map<String, dynamic> toJson() => _$McqResponseToJson(this);
}

@JsonSerializable()
class QCompleteResponse {
  @JsonKey(name: 'question_sequence')
  List<QCompleteSequenceResponse>? questionSequence;
  @JsonKey(name: 'question_answer')
  List<QCompleteAnswerResponse>? questionAnswer;

  QCompleteResponse({
    this.questionSequence,
    this.questionAnswer,
  });

  factory QCompleteResponse.fromJson(Map<String, dynamic> json) =>
      _$QCompleteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QCompleteResponseToJson(this);
}

@JsonSerializable()
class QCompleteSequenceResponse {
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

  QCompleteSequenceResponse({
    this.questionSentenceId,
    this.questionId,
    this.firstSentence,
    this.secondSentence,
    this.mark,
  });

  factory QCompleteSequenceResponse.fromJson(Map<String, dynamic> json) =>
      _$QCompleteSequenceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QCompleteSequenceResponseToJson(this);
}

@JsonSerializable()
class QCompleteAnswerResponse {
  @JsonKey(name: 'question_answer_id')
  int? questionAnswerId;
  @JsonKey(name: 'answer')
  String? answer;

  QCompleteAnswerResponse({
    this.questionAnswerId,
    this.answer,
  });

  factory QCompleteAnswerResponse.fromJson(Map<String, dynamic> json) =>
      _$QCompleteAnswerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QCompleteAnswerResponseToJson(this);
}

@JsonSerializable()
class QContainerResponse {
  @JsonKey(name: 'question_sequence')
  List<QContainerQuestionSequenceResponse>? questionSequence;
  @JsonKey(name: 'question_answer')
  List<QContainerAnswerResponse>? questionAnswer;
  @JsonKey(name: 'basicContainerName')
  String? basicContainerName;
  QContainerResponse({this.questionSequence, this.questionAnswer,this.basicContainerName});

  factory QContainerResponse.fromJson(Map<String, dynamic> json) =>
      _$QContainerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QContainerResponseToJson(this);
}

@JsonSerializable()
class QContainerQuestionSequenceResponse {
  @JsonKey(name: 'question_sentence_id')
  int? questionSentenceId;
  @JsonKey(name: 'questionId')
  int? questionId;
  @JsonKey(name: 'sentence')
  String? sentence;
  @JsonKey(name: 'mark')
  int? mark;

  QContainerQuestionSequenceResponse({
    this.questionSentenceId,
    this.questionId,
    this.sentence,
    this.mark,
  });

  factory QContainerQuestionSequenceResponse.fromJson(Map<String, dynamic> json) =>
      _$QContainerQuestionSequenceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QContainerQuestionSequenceResponseToJson(this);
}

@JsonSerializable()
class QContainerAnswerResponse {
  @JsonKey(name: 'question_answer_id')
  int? questionAnswerId;
  @JsonKey(name: 'answer')
  String? answer;

  QContainerAnswerResponse({
    this.questionAnswerId,
    this.answer,
  });

  factory QContainerAnswerResponse.fromJson(Map<String, dynamic> json) =>
      _$QContainerAnswerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QContainerAnswerResponseToJson(this);
}

@JsonSerializable()
class MatchingQuestionResponse {
  @JsonKey(name: 'rightSideMatching')
  List<RightSideMatchingResponse>? rightSideMatching;
  @JsonKey(name: 'leftSideMatching')
  List<LeftSideMatchingResponse>? leftSideMatching;

  MatchingQuestionResponse({
    this.rightSideMatching,
    this.leftSideMatching,
  });

  factory MatchingQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$MatchingQuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MatchingQuestionResponseToJson(this);
}

@JsonSerializable()
class RightSideMatchingResponse {
  @JsonKey(name: 'Id')
  int? id;
  @JsonKey(name: 'questionId')
  int? questionId;
  @JsonKey(name: 'rightSideText')
  String? rightSideText;
  @JsonKey(name: 'mark')
  int? mark;

  RightSideMatchingResponse({
    this.id,
    this.questionId,
    this.rightSideText,
    this.mark,
  });

  factory RightSideMatchingResponse.fromJson(Map<String, dynamic> json) =>
      _$RightSideMatchingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RightSideMatchingResponseToJson(this);
}

@JsonSerializable()
class LeftSideMatchingResponse {
  @JsonKey(name: 'Id')
  int? id;
  @JsonKey(name: 'questionId')
  int? questionId;
  @JsonKey(name: 'leftSideText')
  String? leftSideText;

  LeftSideMatchingResponse({
    this.id,
    this.questionId,
    this.leftSideText,
  });

  factory LeftSideMatchingResponse.fromJson(Map<String, dynamic> json) =>
      _$LeftSideMatchingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LeftSideMatchingResponseToJson(this);
}

@JsonSerializable()
class QVoiceResponse {
  @JsonKey(name: 'Question_Audio')
  List<QVoiceQuestionAudioResponse>? questionAudio;
  @JsonKey(name: 'question_answer')
  List<QVoiceQuestionAnswerResponse>? questionAnswer;

  QVoiceResponse({
    this.questionAudio,
    this.questionAnswer,
  });

  factory QVoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$QVoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QVoiceResponseToJson(this);
}

@JsonSerializable()
class QVoiceQuestionAudioResponse {
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

  QVoiceQuestionAudioResponse({
    this.id,
    this.questionId,
    this.voiceQuestion,
    this.imageQuestion,
    this.mark,
  });

  factory QVoiceQuestionAudioResponse.fromJson(Map<String, dynamic> json) =>
      _$QVoiceQuestionAudioResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QVoiceQuestionAudioResponseToJson(this);
}

@JsonSerializable()
class QVoiceQuestionAnswerResponse {
  @JsonKey(name: 'Id')
  int? id;
  @JsonKey(name: 'trueAnswer')
  String? trueAnswer;
  @JsonKey(name: 'answer')
  List<String>? answer;
  @JsonKey(name: 'answerLenght')
  int? answerLenght;
  QVoiceQuestionAnswerResponse({
    this.id,
    this.answer,
    this.trueAnswer,
    this.answerLenght
  });

  factory QVoiceQuestionAnswerResponse.fromJson(Map<String, dynamic> json) =>
      _$QVoiceQuestionAnswerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QVoiceQuestionAnswerResponseToJson(this);
}

@JsonSerializable()
class QTranslateResponse {
  @JsonKey(name: 'question_translate')
  List<QuestionTranslateResponse>? questionTranslate;
  @JsonKey(name: 'question_Transalte_answer')
  QuestionTranslateAnswerResponse? questionTranslateAnswer;

  QTranslateResponse({
    this.questionTranslate,
    this.questionTranslateAnswer,
  });

  factory QTranslateResponse.fromJson(Map<String, dynamic> json) =>
      _$QTranslateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QTranslateResponseToJson(this);
}

@JsonSerializable()
class QuestionTranslateResponse {
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

  QuestionTranslateResponse({
    this.id,
    this.questionId,
    this.questionVoice,
    this.questionText,
    this.mark,
  });

  factory QuestionTranslateResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionTranslateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionTranslateResponseToJson(this);
}

@JsonSerializable()
class QuestionTranslateAnswerResponse {
  @JsonKey(name: 'Id')
  int? id;
  @JsonKey(name: 'answer')
  List<String>? answer;

  QuestionTranslateAnswerResponse({
    this.id,
    this.answer,
  });

  factory QuestionTranslateAnswerResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionTranslateAnswerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionTranslateAnswerResponseToJson(this);
}
