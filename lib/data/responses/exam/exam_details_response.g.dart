// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamDetailsResponse _$ExamDetailsResponseFromJson(Map<String, dynamic> json) =>
    ExamDetailsResponse(
      returnValue: json['returnValue'] as int?,
      mv: json['mv'] == null
          ? null
          : MvResponse.fromJson(json['mv'] as Map<String, dynamic>),
      exam: json['exam'] == null
          ? null
          : ExamResponse.fromJson(json['exam'] as Map<String, dynamic>),
      teacherName: json['teacherName'] as String?,
    );

Map<String, dynamic> _$ExamDetailsResponseToJson(
        ExamDetailsResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'mv': instance.mv,
      'exam': instance.exam,
      'teacherName': instance.teacherName,
    };

MvResponse _$MvResponseFromJson(Map<String, dynamic> json) => MvResponse(
      examId: json['examId'] as int?,
      studentId: json['studentId'] as int?,
      examStudent: json['exam_student'] == null
          ? null
          : ExamStudentResponse.fromJson(
              json['exam_student'] as Map<String, dynamic>),
      subject: json['subject'] == null
          ? null
          : SubjectResponse.fromJson(json['subject'] as Map<String, dynamic>),
      timeStart: json['TimeStart'] as String?,
      timeAnswer: json['TimeAnswer'] as String?,
      examTotalMark: json['examTotalMark'] as int?,
      examStarTime: json['ExamStarTime'] as String?,
      isAvailable: json['IsAvailable'] as bool?,
      questionId: json['questionId'] as int?,
    );

Map<String, dynamic> _$MvResponseToJson(MvResponse instance) =>
    <String, dynamic>{
      'examId': instance.examId,
      'studentId': instance.studentId,
      'exam_student': instance.examStudent,
      'subject': instance.subject,
      'TimeStart': instance.timeStart,
      'TimeAnswer': instance.timeAnswer,
      'examTotalMark': instance.examTotalMark,
      'ExamStarTime': instance.examStarTime,
      'IsAvailable': instance.isAvailable,
      'questionId': instance.questionId,
    };

ExamStudentResponse _$ExamStudentResponseFromJson(Map<String, dynamic> json) =>
    ExamStudentResponse(
      id: json['id'] as int?,
      examId: json['exam_id'] as int?,
      studentUserId: json['studentUserId'] as int?,
      examDate: json['exam_date'] as String?,
      submitDate: json['submit_date'] as String?,
      state: json['state'] as bool?,
      isSubmitted: json['is_submitted'] as bool?,
      examStartTime: json['exam_start_time'] as String?,
      examEndTime: json['exam_end_time'] as String?,
      examGrade: json['exam_grade'] as int?,
      studentGrade: json['student_grade'] as int?,
    );

Map<String, dynamic> _$ExamStudentResponseToJson(
        ExamStudentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exam_id': instance.examId,
      'studentUserId': instance.studentUserId,
      'exam_date': instance.examDate,
      'submit_date': instance.submitDate,
      'state': instance.state,
      'is_submitted': instance.isSubmitted,
      'exam_start_time': instance.examStartTime,
      'exam_end_time': instance.examEndTime,
      'exam_grade': instance.examGrade,
      'student_grade': instance.studentGrade,
    };

SubjectResponse _$SubjectResponseFromJson(Map<String, dynamic> json) =>
    SubjectResponse(
      subjectId: json['subject_id'] as int?,
      subjectArName: json['subject_ar_name'] as String?,
      subjectEnName: json['subject_en_name'] as String?,
      subjectCode: json['subjectCode'] as String?,
      subjectEndDate: json['subjectEndDate'] as String?,
      subjectDescription: json['subjectDescription'] as String?,
      subjectThumb: json['subjectThumb'] as String?,
      matCount: (json['matCount'] as num?)?.toDouble(),
      examCount: (json['examCount'] as num?)?.toDouble(),
      docAttachCount: (json['docAttachCount'] as num?)?.toDouble(),
      stageName: json['stage_name'] as String?,
      attachPath: json['attach_path'] as String?,
    );

Map<String, dynamic> _$SubjectResponseToJson(SubjectResponse instance) =>
    <String, dynamic>{
      'subject_id': instance.subjectId,
      'subject_ar_name': instance.subjectArName,
      'subject_en_name': instance.subjectEnName,
      'subjectCode': instance.subjectCode,
      'subjectEndDate': instance.subjectEndDate,
      'subjectDescription': instance.subjectDescription,
      'subjectThumb': instance.subjectThumb,
      'matCount': instance.matCount,
      'examCount': instance.examCount,
      'docAttachCount': instance.docAttachCount,
      'stage_name': instance.stageName,
      'attach_path': instance.attachPath,
    };

ExamResponse _$ExamResponseFromJson(Map<String, dynamic> json) => ExamResponse(
      details: json['details'] == null
          ? null
          : DetailsResponse.fromJson(json['details'] as Map<String, dynamic>),
      correctArticle: json['correctArticle'] as int?,
      isSolvedMcqAll: json['isSolvedMcqAll'] as int?,
      artSolvedNotCorrected: json['ArtSolvedNotCorrected'] as int?,
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) => GroupsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExamResponseToJson(ExamResponse instance) =>
    <String, dynamic>{
      'details': instance.details,
      'correctArticle': instance.correctArticle,
      'isSolvedMcqAll': instance.isSolvedMcqAll,
      'ArtSolvedNotCorrected': instance.artSolvedNotCorrected,
      'groups': instance.groups,
    };

DetailsResponse _$DetailsResponseFromJson(Map<String, dynamic> json) =>
    DetailsResponse(
      id: json['id'] as int?,
      examArName: json['exam_ar_name'] as String?,
      examEnName: json['exam_en_name'] as String?,
      examTypeId: json['exam_type_id'] as int?,
      examPeriodMinute: json['exam_period_minute'] as int?,
      examGrade: (json['examGrade'] as num?)?.toDouble(),
      avilableDateFrom: json['Avilable_Date_From'] as String?,
      avilableDateTo: json['Avilable_Date_To'] as String?,
      resultDate: json['ResultDate'] as String?,
      fromHour: json['fromHour'] as String?,
      toHour: json['toHour'] as String?,
      resultTime: json['ResultTime'] as String?,
      subjectID: json['Subject_ID'] as int?,
      requiredMarkToPass: json['requiredMarkToPass'] as int?,
      studentMark: (json['studentMark'] as num?)?.toDouble(),
      isAvaliable: json['IsAvaliable'] as bool?,
      isSolved: json['IsSolved'] as bool?,
    );

Map<String, dynamic> _$DetailsResponseToJson(DetailsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exam_ar_name': instance.examArName,
      'exam_en_name': instance.examEnName,
      'exam_type_id': instance.examTypeId,
      'exam_period_minute': instance.examPeriodMinute,
      'examGrade': instance.examGrade,
      'Avilable_Date_From': instance.avilableDateFrom,
      'Avilable_Date_To': instance.avilableDateTo,
      'ResultDate': instance.resultDate,
      'fromHour': instance.fromHour,
      'toHour': instance.toHour,
      'ResultTime': instance.resultTime,
      'Subject_ID': instance.subjectID,
      'requiredMarkToPass': instance.requiredMarkToPass,
      'studentMark': instance.studentMark,
      'IsAvaliable': instance.isAvaliable,
      'IsSolved': instance.isSolved,
    };

GroupsResponse _$GroupsResponseFromJson(Map<String, dynamic> json) =>
    GroupsResponse(
      groupId: json['GroupId'] as int?,
      groupName: json['GroupName'] as String?,
      heads: (json['Heads'] as List<dynamic>?)
          ?.map((e) => HeadsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupsResponseToJson(GroupsResponse instance) =>
    <String, dynamic>{
      'GroupId': instance.groupId,
      'GroupName': instance.groupName,
      'Heads': instance.heads,
    };

HeadsResponse _$HeadsResponseFromJson(Map<String, dynamic> json) =>
    HeadsResponse(
      groupId: json['GroupId'] as int?,
      headId: json['HeadId'] as int?,
      headName: json['HeadName'] as String?,
      questions: (json['Questions'] as List<dynamic>?)
          ?.map((e) => QuestionsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HeadsResponseToJson(HeadsResponse instance) =>
    <String, dynamic>{
      'GroupId': instance.groupId,
      'HeadId': instance.headId,
      'HeadName': instance.headName,
      'Questions': instance.questions,
    };

QuestionsResponse _$QuestionsResponseFromJson(Map<String, dynamic> json) =>
    QuestionsResponse(
      headId: json['HeadId'] as int?,
      id: json['Id'] as int?,
      questionDetails: json['QuestionDetails'] == null
          ? null
          : QuestionDetailsResponse.fromJson(
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

Map<String, dynamic> _$QuestionsResponseToJson(QuestionsResponse instance) =>
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

QuestionDetailsResponse _$QuestionDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    QuestionDetailsResponse(
      questionId: json['questionId'] as int?,
      questionText: json['questionText'] as String?,
      questionAttach: json['questionAttach'] as String?,
      questionType: json['questionType'] as String?,
      questionMark: (json['questionMark'] as num?)?.toDouble(),
      questionTypeId: json['questionTypeId'] as int?,
      perfectAnswer: json['perfectAnswer'] as String?,
      studentChoice: json['StudentChoice'] as int?,
      studentCompleteChoice: (json['StudentCompleteChoice'] as List<dynamic>?)
          ?.map((e) =>
              StudentCompleteChoiceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      studentCompleteContainerChoice:
          (json['StudentCompleteContainerChoice'] as List<dynamic>?)
              ?.map((e) => StudentCompleteContainerChoiceResponse.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      studentMatchingChoice: (json['StudentMatchingChoice'] as List<dynamic>?)
          ?.map((e) =>
              StudentMatchingChoiceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      studentVoiceChoice: json['StudentVoiceChoice'] as String?,
      studentTranslateChoice: json['StudentTranslateChoice'] as String?,
      answerText: json['answerText'] as String?,
      attachAnswer: json['attachAnswer'] as String?,
      studentMark: json['studentMark'] as int?,
    );

Map<String, dynamic> _$QuestionDetailsResponseToJson(
        QuestionDetailsResponse instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'questionText': instance.questionText,
      'questionAttach': instance.questionAttach,
      'questionType': instance.questionType,
      'questionMark': instance.questionMark,
      'questionTypeId': instance.questionTypeId,
      'perfectAnswer': instance.perfectAnswer,
      'StudentChoice': instance.studentChoice,
      'StudentCompleteChoice': instance.studentCompleteChoice,
      'StudentCompleteContainerChoice': instance.studentCompleteContainerChoice,
      'StudentMatchingChoice': instance.studentMatchingChoice,
      'StudentVoiceChoice': instance.studentVoiceChoice,
      'StudentTranslateChoice': instance.studentTranslateChoice,
      'answerText': instance.answerText,
      'attachAnswer': instance.attachAnswer,
      'studentMark': instance.studentMark,
    };

StudentCompleteChoiceResponse _$StudentCompleteChoiceResponseFromJson(
        Map<String, dynamic> json) =>
    StudentCompleteChoiceResponse(
      id: json['Id'] as int?,
      examId: json['examId'] as int?,
      userId: json['userId'] as int?,
      questionId: json['questionId'] as int?,
      questionTypeId: json['questionTypeId'] as int?,
      choiceId: json['choiceId'] as int?,
      questionSentenceId: json['question_sentence_id'] as int?,
      questionAnswerId: json['question_answer_id'] as int?,
      attachPath: json['attach_path'] as String?,
      answerText: json['answer_text'] as String?,
      dateTime: json['DateTime'] as String?,
      updatedDateTime: json['UpdatedDateTime'] as String?,
    );

Map<String, dynamic> _$StudentCompleteChoiceResponseToJson(
        StudentCompleteChoiceResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'examId': instance.examId,
      'userId': instance.userId,
      'questionId': instance.questionId,
      'questionTypeId': instance.questionTypeId,
      'choiceId': instance.choiceId,
      'question_sentence_id': instance.questionSentenceId,
      'question_answer_id': instance.questionAnswerId,
      'attach_path': instance.attachPath,
      'answer_text': instance.answerText,
      'DateTime': instance.dateTime,
      'UpdatedDateTime': instance.updatedDateTime,
    };

StudentCompleteContainerChoiceResponse
    _$StudentCompleteContainerChoiceResponseFromJson(
            Map<String, dynamic> json) =>
        StudentCompleteContainerChoiceResponse(
          scentenceId: json['scentenceId'] as int?,
          answerId: json['answerId'] as int?,
        );

Map<String, dynamic> _$StudentCompleteContainerChoiceResponseToJson(
        StudentCompleteContainerChoiceResponse instance) =>
    <String, dynamic>{
      'scentenceId': instance.scentenceId,
      'answerId': instance.answerId,
    };

StudentMatchingChoiceResponse _$StudentMatchingChoiceResponseFromJson(
        Map<String, dynamic> json) =>
    StudentMatchingChoiceResponse(
      rightSideId: json['rightSideId'] as int?,
      leftSideId: json['leftSideId'] as int?,
    );

Map<String, dynamic> _$StudentMatchingChoiceResponseToJson(
        StudentMatchingChoiceResponse instance) =>
    <String, dynamic>{
      'rightSideId': instance.rightSideId,
      'leftSideId': instance.leftSideId,
    };

McqResponse _$McqResponseFromJson(Map<String, dynamic> json) => McqResponse(
      id: json['Id'] as int?,
      questionId: json['questionId'] as int?,
      mcqText: json['MCQText'] as String?,
      mcqAttach: json['MCQAttach'] as String?,
      isCorrect: json['IsCorrect'] as bool?,
    );

Map<String, dynamic> _$McqResponseToJson(McqResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'questionId': instance.questionId,
      'MCQText': instance.mcqText,
      'MCQAttach': instance.mcqAttach,
      'IsCorrect': instance.isCorrect,
    };

QCompleteResponse _$QCompleteResponseFromJson(Map<String, dynamic> json) =>
    QCompleteResponse(
      questionSequence: (json['question_sequence'] as List<dynamic>?)
          ?.map((e) =>
              QCompleteSequenceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      questionAnswer: (json['question_answer'] as List<dynamic>?)
          ?.map((e) =>
              QCompleteAnswerResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QCompleteResponseToJson(QCompleteResponse instance) =>
    <String, dynamic>{
      'question_sequence': instance.questionSequence,
      'question_answer': instance.questionAnswer,
    };

QCompleteSequenceResponse _$QCompleteSequenceResponseFromJson(
        Map<String, dynamic> json) =>
    QCompleteSequenceResponse(
      questionSentenceId: json['question_sentence_id'] as int?,
      questionId: json['questionId'] as int?,
      firstSentence: json['first_sentence'] as String?,
      secondSentence: json['second_sentence'] as String?,
      mark: json['mark'] as int?,
    );

Map<String, dynamic> _$QCompleteSequenceResponseToJson(
        QCompleteSequenceResponse instance) =>
    <String, dynamic>{
      'question_sentence_id': instance.questionSentenceId,
      'questionId': instance.questionId,
      'first_sentence': instance.firstSentence,
      'second_sentence': instance.secondSentence,
      'mark': instance.mark,
    };

QCompleteAnswerResponse _$QCompleteAnswerResponseFromJson(
        Map<String, dynamic> json) =>
    QCompleteAnswerResponse(
      questionAnswerId: json['question_answer_id'] as int?,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$QCompleteAnswerResponseToJson(
        QCompleteAnswerResponse instance) =>
    <String, dynamic>{
      'question_answer_id': instance.questionAnswerId,
      'answer': instance.answer,
    };

QContainerResponse _$QContainerResponseFromJson(Map<String, dynamic> json) =>
    QContainerResponse(
      questionSequence: (json['question_sequence'] as List<dynamic>?)
          ?.map((e) => QContainerQuestionSequenceResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      questionAnswer: (json['question_answer'] as List<dynamic>?)
          ?.map((e) =>
              QContainerAnswerResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      basicContainerName: json['basicContainerName'] as String?,
    );

Map<String, dynamic> _$QContainerResponseToJson(QContainerResponse instance) =>
    <String, dynamic>{
      'question_sequence': instance.questionSequence,
      'question_answer': instance.questionAnswer,
      'basicContainerName': instance.basicContainerName,
    };

QContainerQuestionSequenceResponse _$QContainerQuestionSequenceResponseFromJson(
        Map<String, dynamic> json) =>
    QContainerQuestionSequenceResponse(
      questionSentenceId: json['question_sentence_id'] as int?,
      questionId: json['questionId'] as int?,
      sentence: json['sentence'] as String?,
      mark: json['mark'] as int?,
    );

Map<String, dynamic> _$QContainerQuestionSequenceResponseToJson(
        QContainerQuestionSequenceResponse instance) =>
    <String, dynamic>{
      'question_sentence_id': instance.questionSentenceId,
      'questionId': instance.questionId,
      'sentence': instance.sentence,
      'mark': instance.mark,
    };

QContainerAnswerResponse _$QContainerAnswerResponseFromJson(
        Map<String, dynamic> json) =>
    QContainerAnswerResponse(
      questionAnswerId: json['question_answer_id'] as int?,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$QContainerAnswerResponseToJson(
        QContainerAnswerResponse instance) =>
    <String, dynamic>{
      'question_answer_id': instance.questionAnswerId,
      'answer': instance.answer,
    };

MatchingQuestionResponse _$MatchingQuestionResponseFromJson(
        Map<String, dynamic> json) =>
    MatchingQuestionResponse(
      rightSideMatching: (json['rightSideMatching'] as List<dynamic>?)
          ?.map((e) =>
              RightSideMatchingResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      leftSideMatching: (json['leftSideMatching'] as List<dynamic>?)
          ?.map((e) =>
              LeftSideMatchingResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MatchingQuestionResponseToJson(
        MatchingQuestionResponse instance) =>
    <String, dynamic>{
      'rightSideMatching': instance.rightSideMatching,
      'leftSideMatching': instance.leftSideMatching,
    };

RightSideMatchingResponse _$RightSideMatchingResponseFromJson(
        Map<String, dynamic> json) =>
    RightSideMatchingResponse(
      id: json['Id'] as int?,
      questionId: json['questionId'] as int?,
      rightSideText: json['rightSideText'] as String?,
      mark: json['mark'] as int?,
    );

Map<String, dynamic> _$RightSideMatchingResponseToJson(
        RightSideMatchingResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'questionId': instance.questionId,
      'rightSideText': instance.rightSideText,
      'mark': instance.mark,
    };

LeftSideMatchingResponse _$LeftSideMatchingResponseFromJson(
        Map<String, dynamic> json) =>
    LeftSideMatchingResponse(
      id: json['Id'] as int?,
      questionId: json['questionId'] as int?,
      leftSideText: json['leftSideText'] as String?,
    );

Map<String, dynamic> _$LeftSideMatchingResponseToJson(
        LeftSideMatchingResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'questionId': instance.questionId,
      'leftSideText': instance.leftSideText,
    };

QVoiceResponse _$QVoiceResponseFromJson(Map<String, dynamic> json) =>
    QVoiceResponse(
      questionAudio: (json['Question_Audio'] as List<dynamic>?)
          ?.map((e) =>
              QVoiceQuestionAudioResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      questionAnswer: (json['question_answer'] as List<dynamic>?)
          ?.map((e) =>
              QVoiceQuestionAnswerResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QVoiceResponseToJson(QVoiceResponse instance) =>
    <String, dynamic>{
      'Question_Audio': instance.questionAudio,
      'question_answer': instance.questionAnswer,
    };

QVoiceQuestionAudioResponse _$QVoiceQuestionAudioResponseFromJson(
        Map<String, dynamic> json) =>
    QVoiceQuestionAudioResponse(
      id: json['Id'] as int?,
      questionId: json['questionId'] as int?,
      voiceQuestion: json['voice_question'] as String?,
      imageQuestion: json['image_question'] as String?,
      mark: json['mark'] as int?,
    );

Map<String, dynamic> _$QVoiceQuestionAudioResponseToJson(
        QVoiceQuestionAudioResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'questionId': instance.questionId,
      'voice_question': instance.voiceQuestion,
      'image_question': instance.imageQuestion,
      'mark': instance.mark,
    };

QVoiceQuestionAnswerResponse _$QVoiceQuestionAnswerResponseFromJson(
        Map<String, dynamic> json) =>
    QVoiceQuestionAnswerResponse(
      id: json['Id'] as int?,
      answer:
          (json['answer'] as List<dynamic>?)?.map((e) => e as String).toList(),
      trueAnswer: json['trueAnswer'] as String?,
      answerLenght: json['answerLenght'] as int?,
    );

Map<String, dynamic> _$QVoiceQuestionAnswerResponseToJson(
        QVoiceQuestionAnswerResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'trueAnswer': instance.trueAnswer,
      'answer': instance.answer,
      'answerLenght': instance.answerLenght,
    };

QTranslateResponse _$QTranslateResponseFromJson(Map<String, dynamic> json) =>
    QTranslateResponse(
      questionTranslate: (json['question_translate'] as List<dynamic>?)
          ?.map((e) =>
              QuestionTranslateResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      questionTranslateAnswer: json['question_Transalte_answer'] == null
          ? null
          : QuestionTranslateAnswerResponse.fromJson(
              json['question_Transalte_answer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QTranslateResponseToJson(QTranslateResponse instance) =>
    <String, dynamic>{
      'question_translate': instance.questionTranslate,
      'question_Transalte_answer': instance.questionTranslateAnswer,
    };

QuestionTranslateResponse _$QuestionTranslateResponseFromJson(
        Map<String, dynamic> json) =>
    QuestionTranslateResponse(
      id: json['Id'] as int?,
      questionId: json['questionId'] as int?,
      questionVoice: json['Qusetion_Voice'] as String?,
      questionText: json['Qusetion_Text'] as String?,
      mark: json['Mark'] as int?,
    );

Map<String, dynamic> _$QuestionTranslateResponseToJson(
        QuestionTranslateResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'questionId': instance.questionId,
      'Qusetion_Voice': instance.questionVoice,
      'Qusetion_Text': instance.questionText,
      'Mark': instance.mark,
    };

QuestionTranslateAnswerResponse _$QuestionTranslateAnswerResponseFromJson(
        Map<String, dynamic> json) =>
    QuestionTranslateAnswerResponse(
      id: json['Id'] as int?,
      answer:
          (json['answer'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$QuestionTranslateAnswerResponseToJson(
        QuestionTranslateAnswerResponse instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'answer': instance.answer,
    };
