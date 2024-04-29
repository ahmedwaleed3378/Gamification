// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamResultResponse _$ExamResultResponseFromJson(Map<String, dynamic> json) =>
    ExamResultResponse(
      ex: json['ex'] == null
          ? null
          : ExResponse.fromJson(json['ex'] as Map<String, dynamic>),
      item: json['item'] == null
          ? null
          : ItemResponse.fromJson(json['item'] as Map<String, dynamic>),
      teacherName: json['teacherName'] as String?,
      subjectName: json['SubjectName'] as String?,
    );

Map<String, dynamic> _$ExamResultResponseToJson(ExamResultResponse instance) =>
    <String, dynamic>{
      'ex': instance.ex,
      'item': instance.item,
      'teacherName': instance.teacherName,
      'SubjectName': instance.subjectName,
    };

ItemResponse _$ItemResponseFromJson(Map<String, dynamic> json) => ItemResponse(
      details: json['details'] == null
          ? null
          : DetailsResultResponse.fromJson(
              json['details'] as Map<String, dynamic>),
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) => GroupsResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemResponseToJson(ItemResponse instance) =>
    <String, dynamic>{
      'details': instance.details,
      'groups': instance.groups,
    };

ExResponse _$ExResponseFromJson(Map<String, dynamic> json) => ExResponse(
      pointsGained: (json['PointsGained'] as num?)?.toDouble(),
      userExamExperince: (json['userExamExperince'] as num?)?.toDouble(),
      showExamFinishMessage: json['showExamFinishMessage'] as bool?,
      showExamContent: json['showExamContent'] as bool?,
      showResult: json['showResult'] as bool?,
      totalMark: json['total_mark'] as int?,
      questionCount: json['question_count'] as int?,
      examResult: (json['exam_result'] as num?)?.toDouble(),
      examRate: json['exam_rate'] as int?,
      timeAnswer: json['TimeAnswer'] as String?,
      examStudent: json['exam_student'] == null
          ? null
          : ExamStudentResponse.fromJson(
              json['exam_student'] as Map<String, dynamic>),
      examRequiresTeacherInput: json['ExamRequiresTeacherInput'] as bool?,
      isResultAvailable: json['IsResultAvalable'] as bool?,
      solvedExamStudentID: json['solvedExamStudent_ID'] as int?,
      repeatable: json['repeatable'] as bool?,
      repeatableExamCount: json['repeatableExam_Count'] as int?,
      studentBalance: (json['studentBalance'] as num?)?.toDouble(),
      examDuration: json['examDuration'] as String?,
      examResultDate: json['examResultDate'] as String?,
      examResultTime: json['examResultTime'] as String?,
      userExamPoint: (json['userExamPoint'] as num?)?.toDouble(),
      isSolvedOffline: json['isSolvedOffline'] as bool?,
    );

Map<String, dynamic> _$ExResponseToJson(ExResponse instance) =>
    <String, dynamic>{
      'PointsGained': instance.pointsGained,
      'userExamPoint': instance.userExamPoint,
      'userExamExperince': instance.userExamExperince,
      'showExamFinishMessage': instance.showExamFinishMessage,
      'showExamContent': instance.showExamContent,
      'showResult': instance.showResult,
      'total_mark': instance.totalMark,
      'question_count': instance.questionCount,
      'exam_result': instance.examResult,
      'studentBalance': instance.studentBalance,
      'exam_rate': instance.examRate,
      'TimeAnswer': instance.timeAnswer,
      'exam_student': instance.examStudent,
      'ExamRequiresTeacherInput': instance.examRequiresTeacherInput,
      'IsResultAvalable': instance.isResultAvailable,
      'examResultDate': instance.examResultDate,
      'examDuration': instance.examDuration,
      'examResultTime': instance.examResultTime,
      'solvedExamStudent_ID': instance.solvedExamStudentID,
      'repeatable': instance.repeatable,
      'isSolvedOffline': instance.isSolvedOffline,
      'repeatableExam_Count': instance.repeatableExamCount,
    };

ExamStudentResponse _$ExamStudentResponseFromJson(Map<String, dynamic> json) =>
    ExamStudentResponse(
      id: json['id'] as int?,
      examId: json['exam_id'] as int?,
      examDate: json['exam_date'] as String?,
      submitDate: json['submit_date'] as String?,
      examAmount: (json['exam_amount'] as num?)?.toDouble(),
      state: json['state'] as bool?,
      isSubmitted: json['is_submitted'] as bool?,
      correctComplete: json['correct_complete'] as int?,
      examStartTime: json['exam_start_time'] as String?,
      examEndTime: json['exam_end_time'] as String?,
      examGrade: (json['exam_grade'] as num?)?.toDouble(),
      studentGrade: (json['student_grade'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ExamStudentResponseToJson(
        ExamStudentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exam_id': instance.examId,
      'exam_date': instance.examDate,
      'submit_date': instance.submitDate,
      'exam_amount': instance.examAmount,
      'state': instance.state,
      'is_submitted': instance.isSubmitted,
      'correct_complete': instance.correctComplete,
      'exam_start_time': instance.examStartTime,
      'exam_end_time': instance.examEndTime,
      'exam_grade': instance.examGrade,
      'student_grade': instance.studentGrade,
    };

DetailsResultResponse _$DetailsResultResponseFromJson(
        Map<String, dynamic> json) =>
    DetailsResultResponse(
      id: json['id'] as int?,
      examArName: json['exam_ar_name'] as String?,
      examEnName: json['exam_en_name'] as String?,
      studentMark: (json['studentMark'] as num?)?.toDouble(),
      isAvailable: json['IsAvaliable'] as bool?,
      examPeriodMinute: json['exam_period_minute'] as int?,
    );

Map<String, dynamic> _$DetailsResultResponseToJson(
        DetailsResultResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exam_period_minute': instance.examPeriodMinute,
      'exam_ar_name': instance.examArName,
      'exam_en_name': instance.examEnName,
      'studentMark': instance.studentMark,
      'IsAvaliable': instance.isAvailable,
    };

GroupsResult _$GroupsResultFromJson(Map<String, dynamic> json) => GroupsResult(
      groupId: json['GroupId'] as int?,
      groupName: json['GroupName'] as String?,
      heads: (json['Heads'] as List<dynamic>?)
          ?.map((e) => HeadsResultResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupsResultToJson(GroupsResult instance) =>
    <String, dynamic>{
      'GroupId': instance.groupId,
      'GroupName': instance.groupName,
      'Heads': instance.heads,
    };

HeadsResultResponse _$HeadsResultResponseFromJson(Map<String, dynamic> json) =>
    HeadsResultResponse(
      groupId: json['GroupId'] as int?,
      headId: json['HeadId'] as int?,
      headName: json['HeadName'] as String?,
      questions: (json['Questions'] as List<dynamic>?)
          ?.map((e) =>
              QuestionsResultResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HeadsResultResponseToJson(
        HeadsResultResponse instance) =>
    <String, dynamic>{
      'GroupId': instance.groupId,
      'HeadId': instance.headId,
      'HeadName': instance.headName,
      'Questions': instance.questions,
    };

QuestionsResultResponse _$QuestionsResultResponseFromJson(
        Map<String, dynamic> json) =>
    QuestionsResultResponse(
      headId: json['HeadId'] as int?,
      id: json['Id'] as int?,
      questionDetails: json['QuestionDetails'] == null
          ? null
          : QuestionDetailsResultResponse.fromJson(
              json['QuestionDetails'] as Map<String, dynamic>),
      mcq: (json['MCQ'] as List<dynamic>?)
          ?.map((e) => McqResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      complete: json['Q_Complete'] == null
          ? null
          : QCompleteResponse.fromJson(
              json['Q_Complete'] as Map<String, dynamic>),
      qContainer: json['Q_Container'] == null
          ? null
          : QContainerResponse.fromJson(
              json['Q_Container'] as Map<String, dynamic>),
      matchingQuestion: json['matcingQuestion'] == null
          ? null
          : MatchingQuestionResponse.fromJson(
              json['matcingQuestion'] as Map<String, dynamic>),
      qVoice: json['Q_Voice'] == null
          ? null
          : QVoiceResponse.fromJson(json['Q_Voice'] as Map<String, dynamic>),
      qTranslate: json['Q_Translate'] == null
          ? null
          : QTranslateResponse.fromJson(
              json['Q_Translate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionsResultResponseToJson(
        QuestionsResultResponse instance) =>
    <String, dynamic>{
      'HeadId': instance.headId,
      'Id': instance.id,
      'QuestionDetails': instance.questionDetails,
      'MCQ': instance.mcq,
      'Q_Complete': instance.complete,
      'Q_Container': instance.qContainer,
      'matcingQuestion': instance.matchingQuestion,
      'Q_Voice': instance.qVoice,
      'Q_Translate': instance.qTranslate,
    };

QuestionDetailsResultResponse _$QuestionDetailsResultResponseFromJson(
        Map<String, dynamic> json) =>
    QuestionDetailsResultResponse(
      questionId: json['questionId'] as int?,
      questionText: json['questionText'] as String?,
      questionAttach: json['questionAttach'] as String?,
      questionType: json['questionType'] as String?,
      questionMark: (json['questionMark'] as num?)?.toDouble(),
      questionTypeId: json['questionTypeId'] as int?,
      studentChoice: json['StudentChoice'] == null
          ? null
          : StudentChoiceResultResponse.fromJson(
              json['StudentChoice'] as Map<String, dynamic>),
      studentCompleteChoice: (json['StudentCompleteChoice'] as List<dynamic>?)
          ?.map((e) => StudentCompleteChoiceResultResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      studentCompleteContainerChoice: (json['StudentCompleteContainerChoice']
              as List<dynamic>?)
          ?.map((e) => StudentCompleteContainerChoiceResultResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      studentMatchingChoice: (json['StudentMatchingChoice'] as List<dynamic>?)
          ?.map((e) => StudentMatchingChoiceResultResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      studentVoiceChoice: json['StudentVoiceChoice'] == null
          ? null
          : StudentVoiceChoiceResultResponse.fromJson(
              json['StudentVoiceChoice'] as Map<String, dynamic>),
      studentTranslateChoice: json['StudentTranslateChoice'] == null
          ? null
          : StudentTranslateChoiceResultResponse.fromJson(
              json['StudentTranslateChoice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionDetailsResultResponseToJson(
        QuestionDetailsResultResponse instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'questionText': instance.questionText,
      'questionAttach': instance.questionAttach,
      'questionType': instance.questionType,
      'questionMark': instance.questionMark,
      'questionTypeId': instance.questionTypeId,
      'StudentChoice': instance.studentChoice,
      'StudentCompleteChoice': instance.studentCompleteChoice,
      'StudentCompleteContainerChoice': instance.studentCompleteContainerChoice,
      'StudentMatchingChoice': instance.studentMatchingChoice,
      'StudentVoiceChoice': instance.studentVoiceChoice,
      'StudentTranslateChoice': instance.studentTranslateChoice,
    };

StudentChoiceResultResponse _$StudentChoiceResultResponseFromJson(
        Map<String, dynamic> json) =>
    StudentChoiceResultResponse(
      id: json['id'] as int?,
      examId: json['exam_id'] as int?,
      studentUserId: json['studentUserId'] as int?,
      questionId: json['question_id'] as int?,
      studentChoiceId: json['student_choice_id'] as int?,
      questionFinalMark: (json['question_final_mark'] as num?)?.toDouble(),
      result: json['RESULT'] as String?,
    );

Map<String, dynamic> _$StudentChoiceResultResponseToJson(
        StudentChoiceResultResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exam_id': instance.examId,
      'studentUserId': instance.studentUserId,
      'question_id': instance.questionId,
      'student_choice_id': instance.studentChoiceId,
      'question_final_mark': instance.questionFinalMark,
      'RESULT': instance.result,
    };

StudentCompleteChoiceResultResponse
    _$StudentCompleteChoiceResultResponseFromJson(Map<String, dynamic> json) =>
        StudentCompleteChoiceResultResponse(
          id: json['id'] as int?,
          examId: json['exam_id'] as int?,
          questionId: json['question_id'] as int?,
          questionSentenceId: json['question_sentence_id'] as int?,
          questionAnswerId: json['question_answer_id'] as int?,
          examStudentQuestionId: json['exam_student_question_id'] as int?,
          studentUserId: json['student_user_id'] as int?,
          mark: json['mark'] as int?,
          result: json['result'] as bool?,
        );

Map<String, dynamic> _$StudentCompleteChoiceResultResponseToJson(
        StudentCompleteChoiceResultResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exam_id': instance.examId,
      'question_id': instance.questionId,
      'question_sentence_id': instance.questionSentenceId,
      'question_answer_id': instance.questionAnswerId,
      'exam_student_question_id': instance.examStudentQuestionId,
      'student_user_id': instance.studentUserId,
      'mark': instance.mark,
      'result': instance.result,
    };

StudentCompleteContainerChoiceResultResponse
    _$StudentCompleteContainerChoiceResultResponseFromJson(
            Map<String, dynamic> json) =>
        StudentCompleteContainerChoiceResultResponse(
          id: json['id'] as int?,
          examId: json['exam_id'] as int?,
          questionId: json['question_id'] as int?,
          questionSentenceId: json['question_sentence_id'] as int?,
          questionAnswerId: json['question_answer_id'] as int?,
          examStudentQuestionId: json['exam_student_question_id'] as int?,
          studentUserId: json['student_user_id'] as int?,
          mark: json['mark'] as int?,
          result: json['result'] as bool?,
        );

Map<String, dynamic> _$StudentCompleteContainerChoiceResultResponseToJson(
        StudentCompleteContainerChoiceResultResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exam_id': instance.examId,
      'question_id': instance.questionId,
      'question_sentence_id': instance.questionSentenceId,
      'question_answer_id': instance.questionAnswerId,
      'exam_student_question_id': instance.examStudentQuestionId,
      'student_user_id': instance.studentUserId,
      'mark': instance.mark,
      'result': instance.result,
    };

StudentMatchingChoiceResultResponse
    _$StudentMatchingChoiceResultResponseFromJson(Map<String, dynamic> json) =>
        StudentMatchingChoiceResultResponse(
          id: json['id'] as int?,
          examId: json['exam_id'] as int?,
          studentUserId: json['studentUserId'] as int?,
          questionId: json['question_id'] as int?,
          questionDetRightSideId: json['question_det_right_side_id'] as int?,
          questionDetLeftSideId: json['question_det_left_side_id'] as int?,
          examStudentQuestionId: json['exam_student_question_Id'] as int?,
          result: json['result'] as bool?,
          mark: json['mark'] as int?,
        );

Map<String, dynamic> _$StudentMatchingChoiceResultResponseToJson(
        StudentMatchingChoiceResultResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exam_id': instance.examId,
      'studentUserId': instance.studentUserId,
      'question_id': instance.questionId,
      'question_det_right_side_id': instance.questionDetRightSideId,
      'question_det_left_side_id': instance.questionDetLeftSideId,
      'exam_student_question_Id': instance.examStudentQuestionId,
      'result': instance.result,
      'mark': instance.mark,
    };

StudentVoiceChoiceResultResponse _$StudentVoiceChoiceResultResponseFromJson(
        Map<String, dynamic> json) =>
    StudentVoiceChoiceResultResponse(
      id: json['id'] as int?,
      studentUserId: json['student_user_id'] as int?,
      examId: json['exam_id'] as int?,
      questionId: json['question_id'] as int?,
      voiceQuestionAnswerId: json['voice_question_answer_id'] as int?,
      examStudentQuestionId: json['exam_student_question_id'] as int?,
      voiceQuestionAnswer: json['voice_question_answer'] as String?,
      result: json['result'] as bool?,
      mark: json['mark'] as int?,
    );

Map<String, dynamic> _$StudentVoiceChoiceResultResponseToJson(
        StudentVoiceChoiceResultResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_user_id': instance.studentUserId,
      'exam_id': instance.examId,
      'question_id': instance.questionId,
      'voice_question_answer_id': instance.voiceQuestionAnswerId,
      'exam_student_question_id': instance.examStudentQuestionId,
      'voice_question_answer': instance.voiceQuestionAnswer,
      'result': instance.result,
      'mark': instance.mark,
    };

StudentTranslateChoiceResultResponse
    _$StudentTranslateChoiceResultResponseFromJson(Map<String, dynamic> json) =>
        StudentTranslateChoiceResultResponse(
          id: json['id'] as int?,
          examId: json['exam_id'] as int?,
          questionId: json['question_id'] as int?,
          examStudentQuestionId: json['exam_student_question_id'] as int?,
          translateQuestionId: json['translate_question_id'] as int?,
          studentUserId: json['student_user_id'] as int?,
          translateAnswerText: json['translate_answer_text'] as String?,
          mark: json['mark'] as int?,
          result: json['result'] as String?,
        );

Map<String, dynamic> _$StudentTranslateChoiceResultResponseToJson(
        StudentTranslateChoiceResultResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exam_id': instance.examId,
      'question_id': instance.questionId,
      'exam_student_question_id': instance.examStudentQuestionId,
      'translate_question_id': instance.translateQuestionId,
      'student_user_id': instance.studentUserId,
      'translate_answer_text': instance.translateAnswerText,
      'mark': instance.mark,
      'result': instance.result,
    };

McqResultResponse _$McqResultResponseFromJson(Map<String, dynamic> json) =>
    McqResultResponse(
      id: json['Id'] as int?,
      questionId: json['questionId'] as int?,
      mcqText: json['MCQText'] as String?,
      mcqAttach: json['MCQAttach'] as String?,
      isCorrect: json['IsCorrect'] as bool?,
    );

Map<String, dynamic> _$McqResultResponseToJson(McqResultResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'questionId': instance.questionId,
      'MCQText': instance.mcqText,
      'MCQAttach': instance.mcqAttach,
      'IsCorrect': instance.isCorrect,
    };

QCompleteResultResponse _$QCompleteResultResponseFromJson(
        Map<String, dynamic> json) =>
    QCompleteResultResponse(
      questionSequence: (json['question_sequence'] as List<dynamic>?)
          ?.map((e) => QCompleteSequenceResultResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      questionAnswer: (json['question_answer'] as List<dynamic>?)
          ?.map((e) =>
              QCompleteAnswerResultResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QCompleteResultResponseToJson(
        QCompleteResultResponse instance) =>
    <String, dynamic>{
      'question_sequence': instance.questionSequence,
      'question_answer': instance.questionAnswer,
    };

QCompleteSequenceResultResponse _$QCompleteSequenceResultResponseFromJson(
        Map<String, dynamic> json) =>
    QCompleteSequenceResultResponse(
      questionSentenceId: json['question_sentence_id'] as int?,
      questionId: json['questionId'] as int?,
      firstSentence: json['first_sentence'] as String?,
      secondSentence: json['second_sentence'] as String?,
      mark: json['mark'] as int?,
    );

Map<String, dynamic> _$QCompleteSequenceResultResponseToJson(
        QCompleteSequenceResultResponse instance) =>
    <String, dynamic>{
      'question_sentence_id': instance.questionSentenceId,
      'questionId': instance.questionId,
      'first_sentence': instance.firstSentence,
      'second_sentence': instance.secondSentence,
      'mark': instance.mark,
    };

QCompleteAnswerResultResponse _$QCompleteAnswerResultResponseFromJson(
        Map<String, dynamic> json) =>
    QCompleteAnswerResultResponse(
      questionAnswerId: json['question_answer_id'] as int?,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$QCompleteAnswerResultResponseToJson(
        QCompleteAnswerResultResponse instance) =>
    <String, dynamic>{
      'question_answer_id': instance.questionAnswerId,
      'answer': instance.answer,
    };

QContainerResultResponse _$QContainerResultResponseFromJson(
        Map<String, dynamic> json) =>
    QContainerResultResponse(
      questionSequence: (json['question_sequence'] as List<dynamic>?)
          ?.map((e) => QContainerQuestionSequenceResultResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      questionAnswer: (json['question_answer'] as List<dynamic>?)
          ?.map((e) => QContainerAnswerResultResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QContainerResultResponseToJson(
        QContainerResultResponse instance) =>
    <String, dynamic>{
      'question_sequence': instance.questionSequence,
      'question_answer': instance.questionAnswer,
    };

QContainerQuestionSequenceResultResponse
    _$QContainerQuestionSequenceResultResponseFromJson(
            Map<String, dynamic> json) =>
        QContainerQuestionSequenceResultResponse(
          questionSentenceId: json['question_sentence_id'] as int?,
          questionId: json['questionId'] as int?,
          sentence: json['sentence'] as String?,
          mark: json['mark'] as int?,
        );

Map<String, dynamic> _$QContainerQuestionSequenceResultResponseToJson(
        QContainerQuestionSequenceResultResponse instance) =>
    <String, dynamic>{
      'question_sentence_id': instance.questionSentenceId,
      'questionId': instance.questionId,
      'sentence': instance.sentence,
      'mark': instance.mark,
    };

QContainerAnswerResultResponse _$QContainerAnswerResultResponseFromJson(
        Map<String, dynamic> json) =>
    QContainerAnswerResultResponse(
      questionAnswerId: json['question_answer_id'] as int?,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$QContainerAnswerResultResponseToJson(
        QContainerAnswerResultResponse instance) =>
    <String, dynamic>{
      'question_answer_id': instance.questionAnswerId,
      'answer': instance.answer,
    };

MatchingQuestionResultResponse _$MatchingQuestionResultResponseFromJson(
        Map<String, dynamic> json) =>
    MatchingQuestionResultResponse(
      rightSideMatching: (json['rightSideMatching'] as List<dynamic>?)
          ?.map((e) => RightSideMatchingResultResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      leftSideMatching: (json['leftSideMatching'] as List<dynamic>?)
          ?.map((e) => LeftSideMatchingResultResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MatchingQuestionResultResponseToJson(
        MatchingQuestionResultResponse instance) =>
    <String, dynamic>{
      'rightSideMatching': instance.rightSideMatching,
      'leftSideMatching': instance.leftSideMatching,
    };

RightSideMatchingResultResponse _$RightSideMatchingResultResponseFromJson(
        Map<String, dynamic> json) =>
    RightSideMatchingResultResponse(
      id: json['Id'] as int?,
      questionId: json['questionId'] as int?,
      rightSideText: json['rightSideText'] as String?,
      mark: json['mark'] as int?,
    );

Map<String, dynamic> _$RightSideMatchingResultResponseToJson(
        RightSideMatchingResultResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'questionId': instance.questionId,
      'rightSideText': instance.rightSideText,
      'mark': instance.mark,
    };

LeftSideMatchingResultResponse _$LeftSideMatchingResultResponseFromJson(
        Map<String, dynamic> json) =>
    LeftSideMatchingResultResponse(
      id: json['Id'] as int?,
      questionId: json['questionId'] as int?,
      leftSideText: json['leftSideText'] as String?,
    );

Map<String, dynamic> _$LeftSideMatchingResultResponseToJson(
        LeftSideMatchingResultResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'questionId': instance.questionId,
      'leftSideText': instance.leftSideText,
    };

QVoiceResultResponse _$QVoiceResultResponseFromJson(
        Map<String, dynamic> json) =>
    QVoiceResultResponse(
      questionAudio: (json['Question_Audio'] as List<dynamic>?)
          ?.map((e) => QVoiceQuestionAudioResultResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      questionAnswer: (json['question_answer'] as List<dynamic>?)
          ?.map((e) => QVoiceQuestionAnswerResultResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QVoiceResultResponseToJson(
        QVoiceResultResponse instance) =>
    <String, dynamic>{
      'Question_Audio': instance.questionAudio,
      'question_answer': instance.questionAnswer,
    };

QVoiceQuestionAudioResultResponse _$QVoiceQuestionAudioResultResponseFromJson(
        Map<String, dynamic> json) =>
    QVoiceQuestionAudioResultResponse(
      id: json['Id'] as int?,
      questionId: json['questionId'] as int?,
      voiceQuestion: json['voice_question'] as String?,
      imageQuestion: json['image_question'] as String?,
      mark: json['mark'] as int?,
    );

Map<String, dynamic> _$QVoiceQuestionAudioResultResponseToJson(
        QVoiceQuestionAudioResultResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'questionId': instance.questionId,
      'voice_question': instance.voiceQuestion,
      'image_question': instance.imageQuestion,
      'mark': instance.mark,
    };

QVoiceQuestionAnswerResultResponse _$QVoiceQuestionAnswerResultResponseFromJson(
        Map<String, dynamic> json) =>
    QVoiceQuestionAnswerResultResponse(
      id: json['Id'] as int?,
      answer:
          (json['answer'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$QVoiceQuestionAnswerResultResponseToJson(
        QVoiceQuestionAnswerResultResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'answer': instance.answer,
    };

QTranslateResultResponse _$QTranslateResultResponseFromJson(
        Map<String, dynamic> json) =>
    QTranslateResultResponse(
      questionTranslate: (json['question_translate'] as List<dynamic>?)
          ?.map((e) => QuestionTranslateResultResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      questionTranslateAnswer: json['question_Transalte_answer'] == null
          ? null
          : QuestionTranslateAnswerResponse.fromJson(
              json['question_Transalte_answer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QTranslateResultResponseToJson(
        QTranslateResultResponse instance) =>
    <String, dynamic>{
      'question_translate': instance.questionTranslate,
      'question_Transalte_answer': instance.questionTranslateAnswer,
    };

QuestionTranslateResultResponse _$QuestionTranslateResultResponseFromJson(
        Map<String, dynamic> json) =>
    QuestionTranslateResultResponse(
      id: json['Id'] as int?,
      questionId: json['questionId'] as int?,
      questionVoice: json['Qusetion_Voice'] as String?,
      questionText: json['Qusetion_Text'] as String?,
      mark: json['Mark'] as int?,
    );

Map<String, dynamic> _$QuestionTranslateResultResponseToJson(
        QuestionTranslateResultResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'questionId': instance.questionId,
      'Qusetion_Voice': instance.questionVoice,
      'Qusetion_Text': instance.questionText,
      'Mark': instance.mark,
    };
