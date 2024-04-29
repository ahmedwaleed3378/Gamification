import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/exam/exam_details_response.dart';
import 'package:gamification/domain/model/exam/exam_details_model.dart';

extension QuestionTranslateMapper on QuestionTranslateResponse? {
  QuestionTranslateModel toDomain() {
    return QuestionTranslateModel(
      this?.id.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.questionVoice.orEmpty() ?? Constants.empty,
      this?.questionText.orEmpty() ?? Constants.empty,
      this?.mark.orZero() ?? Constants.zero,
    );
  }
}

extension QuestionTranslateAnswerMapper on QuestionTranslateAnswerResponse? {
  QuestionTranslateAnswerModel toDomain() {
    return QuestionTranslateAnswerModel(
      this?.id.orZero() ?? Constants.zero,
      this?.answer?.map((e) => e).cast<String>().toList(),
    );
  }
}

extension QTranslateMapper on QTranslateResponse? {
  QTranslateModel toDomain() {
    return QTranslateModel(
        this
            ?.questionTranslate
            ?.map((e) => e.toDomain())
            .cast<QuestionTranslateModel>()
            .toList(),
        this?.questionTranslateAnswer.toDomain());
  }
}

extension QwQuestionTranslateAnswerMapper on QuestionTranslateAnswerResponse? {
  QuestionTranslateAnswerModel toDomaain() {
    return QuestionTranslateAnswerModel(
      this?.id.orZero() ?? Constants.zero,
      this
          ?.answer
          ?.map((e) => e.orEmpty() ?? Constants.zero)
          .cast<String>()
          .toList(),
    );
  }
}

extension QVoiceQuestionAnswerMapper on QVoiceQuestionAnswerResponse? {
  QVoiceQuestionAnswerModel toDomain() {
    return QVoiceQuestionAnswerModel(
      this?.id.orZero() ?? Constants.zero,
      this?.answer?.map((answer) => answer).cast<String>().toList(),
      this?.trueAnswer.orEmpty() ?? Constants.empty,
      this?.answerLenght.orZero() ?? Constants.zero,
    );
  }
}

extension QVoiceQuestionAudioMapper on QVoiceQuestionAudioResponse? {
  QVoiceQuestionAudioModel toDomain() {
    return QVoiceQuestionAudioModel(
      this?.id.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.voiceQuestion.orEmpty() ?? Constants.empty,
      this?.imageQuestion.orEmpty() ?? Constants.empty,
      this?.mark.orZero() ?? Constants.zero,
    );
  }
}

extension QVoiceMapper on QVoiceResponse? {
  QVoiceModel toDomain() {
    return QVoiceModel(
      this
          ?.questionAudio
          ?.map((e) => e.toDomain())
          .cast<QVoiceQuestionAudioModel>()
          .toList(),
      this
          ?.questionAnswer
          ?.map((e) => e.toDomain())
          .cast<QVoiceQuestionAnswerModel>()
          .toList(),
    );
  }
}

extension LeftSideMatchingMapper on LeftSideMatchingResponse? {
  LeftSideMatchingModel toDomain() {
    return LeftSideMatchingModel(
      this?.id.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.leftSideText.orEmpty() ?? Constants.empty,
    );
  }
}

extension RightSideMatchingMapper on RightSideMatchingResponse? {
  RightSideMatchingModel toDomain() {
    return RightSideMatchingModel(
      this?.id.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.rightSideText.orEmpty() ?? Constants.empty,
      this?.mark.orZero() ?? Constants.zero,
    );
  }
}

extension MatchingQuestionMapper on MatchingQuestionResponse? {
  MatchingQuestionModel toDomain() {
    return MatchingQuestionModel(
      this
          ?.rightSideMatching
          ?.map((e) => e.toDomain())
          .cast<RightSideMatchingModel>()
          .toList(),
      this
          ?.leftSideMatching
          ?.map((e) => e.toDomain())
          .cast<LeftSideMatchingModel>()
          .toList(),
    );
  }
}

extension QContainerAnswerMapper on QContainerAnswerResponse? {
  QContainerAnswerModel toDomain() {
    return QContainerAnswerModel(
      this?.questionAnswerId.orZero() ?? Constants.zero,
      this?.answer.orEmpty() ?? Constants.empty,
    );
  }
}

extension QContainerQuestionSequenceMapper
    on QContainerQuestionSequenceResponse? {
  QContainerQuestionSequenceModel toDomain() {
    return QContainerQuestionSequenceModel(
      this?.questionSentenceId.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.sentence.orEmpty() ?? Constants.empty,
      this?.mark.orZero() ?? Constants.zero,
    );
  }
}

extension QContainerMapper on QContainerResponse? {
  QContainerModel toDomain() {
    return QContainerModel(
      this
          ?.questionSequence
          ?.map((e) => e.toDomain())
          .cast<QContainerQuestionSequenceModel>()
          .toList(),
      this
          ?.questionAnswer
          ?.map((e) => e.toDomain())
          .cast<QContainerAnswerModel>()
          .toList(),
      this?.basicContainerName.orEmpty() ?? Constants.empty,

    );
  }
}

extension QCompleteAnswerMapper on QCompleteAnswerResponse? {
  QCompleteAnswerModel toDomain() {
    return QCompleteAnswerModel(
      this?.questionAnswerId.orZero() ?? Constants.zero,
      this?.answer.orEmpty() ?? Constants.empty,
    );
  }
}

extension QCompleteSequenceMapper on QCompleteSequenceResponse? {
  QCompleteSequenceModel toDomain() {
    return QCompleteSequenceModel(
      this?.questionSentenceId.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.firstSentence.orEmpty() ?? Constants.empty,
      this?.secondSentence.orEmpty() ?? Constants.empty,
      this?.mark.orZero() ?? Constants.zero,
    );
  }
}

extension QCompleteMapper on QCompleteResponse? {
  QCompleteModel toDomain() {
    return QCompleteModel(
      this
          ?.questionSequence
          ?.map((e) => e.toDomain())
          .cast<QCompleteSequenceModel>()
          .toList(),
      this
          ?.questionAnswer
          ?.map((e) => e.toDomain())
          .cast<QCompleteAnswerModel>()
          .toList(),
    );
  }
}

extension McqMapper on McqResponse? {
  McqModel toDomain() {
    return McqModel(
      this?.id.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.mcqText.orEmpty() ?? Constants.empty,
      this?.mcqAttach.orEmpty() ?? Constants.empty,
      this?.isCorrect ?? false,
    );
  }
}

extension StudentMatchingChoiceMapper on StudentMatchingChoiceResponse? {
  StudentMatchingChoiceModel toDomain() {
    return StudentMatchingChoiceModel(
      this?.rightSideId.orZero() ?? Constants.zero,
      this?.leftSideId.orZero() ?? Constants.zero,
    );
  }
}

extension StudentCompleteContainerChoiceMapper
    on StudentCompleteContainerChoiceResponse? {
  StudentCompleteContainerChoiceModel toDomain() {
    return StudentCompleteContainerChoiceModel(
      this?.scentenceId.orZero() ?? Constants.zero,
      this?.answerId.orZero() ?? Constants.zero,
    );
  }
}

extension StudentCompleteChoiceMapper on StudentCompleteChoiceResponse? {
  StudentCompleteChoiceModel toDomain() {
    return StudentCompleteChoiceModel(
      this?.id.orZero() ?? Constants.zero,
      this?.examId.orZero() ?? Constants.zero,
      this?.userId.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.questionTypeId.orZero() ?? Constants.zero,
      this?.choiceId.orZero() ?? Constants.zero,
      this?.questionSentenceId.orZero() ?? Constants.zero,
      this?.questionAnswerId.orZero() ?? Constants.zero,
      this?.attachPath.orEmpty() ?? Constants.empty,
      this?.answerText.orEmpty() ?? Constants.empty,
      this?.dateTime.orEmpty() ?? Constants.empty,
      this?.updatedDateTime.orEmpty() ?? Constants.empty,
    );
  }
}

extension QuestionDetailsMapper on QuestionDetailsResponse? {
  QuestionDetailsModel toDomain() {
    return QuestionDetailsModel(
      this?.questionId.orZero() ?? Constants.zero,
      this?.questionText.orEmpty() ?? Constants.empty,
      this?.questionAttach.orEmpty() ?? Constants.empty,
      this?.questionType.orEmpty() ?? Constants.empty,
      this?.questionMark.orZeroDouble() ?? Constants.zeroD,
      this?.questionTypeId.orZero() ?? Constants.zero,
      this?.perfectAnswer.orEmpty() ?? Constants.empty,
      this?.studentChoice.orZero() ?? Constants.zero,
      this
          ?.studentCompleteChoice
          ?.map((choice) => choice.toDomain())
          .cast<StudentCompleteChoiceModel>()
          .toList(),
      this
          ?.studentCompleteContainerChoice
          ?.map((e) => e.toDomain())
          .cast<StudentCompleteContainerChoiceModel>()
          .toList(),
      this
          ?.studentMatchingChoice
          ?.map((e) => e.toDomain())
          .cast<StudentMatchingChoiceModel>()
          .toList(),
      this?.studentVoiceChoice.orEmpty() ?? Constants.empty,
      this?.studentTranslateChoice.orEmpty() ?? Constants.empty,
      this?.answerText.orEmpty() ?? Constants.empty,
      this?.attachAnswer.orEmpty() ?? Constants.empty,
      this?.studentMark.orZero() ?? Constants.zero,
    );
  }
}

extension QuestionsMapper on QuestionsResponse? {
  QuestionsModel toDomain() {
    return QuestionsModel(
      this?.headId.orZero() ?? Constants.zero,
      this?.id.orZero() ?? Constants.zero,
      this?.questionDetails.toDomain(),
      null,
      this?.mcq?.map((mcq) => mcq.toDomain()).cast<McqModel>().toList(),
      this?.complete.toDomain(),
      this?.qContainer.toDomain(),
      this?.matchingQuestion.toDomain(),
      this?.qVoice.toDomain(),
      this?.qTranslate.toDomain(),
    );
  }
}

extension HeadsMapper on HeadsResponse? {
  HeadsModel toDomain() {
    return HeadsModel(
      this?.groupId.orZero() ?? Constants.zero,
      this?.headId.orZero() ?? Constants.zero,
      this?.headName.orEmpty() ?? Constants.empty,
      this
          ?.questions
          ?.map((question) => question.toDomain())
          .cast<QuestionsModel>()
          .toList(),
    );
  }
}

extension GroupsMapper on GroupsResponse? {
  GroupsModel toDomain() {
    return GroupsModel(
      this?.groupId.orZero() ?? Constants.zero,
      this?.groupName.orEmpty() ?? Constants.empty,
      this?.heads?.map((head) => head.toDomain()).cast<HeadsModel>().toList(),
    );
  }
}

extension DetailsMapper on DetailsResponse? {
  DetailsModel toDomain() {
    return DetailsModel(
      this?.id.orZero() ?? Constants.zero,
      this?.examArName.orEmpty() ?? Constants.empty,
      this?.examEnName.orEmpty() ?? Constants.empty,
      this?.examTypeId.orZero() ?? Constants.zero,
      this?.examPeriodMinute.orZero() ?? Constants.zero,
      this?.examGrade.orZeroDouble() ?? Constants.zeroD,
      this?.avilableDateFrom.orEmpty() ?? Constants.empty,
      this?.avilableDateTo.orEmpty() ?? Constants.empty,
      this?.resultDate.orEmpty() ?? Constants.empty,
      this?.fromHour.orEmpty() ?? Constants.empty,
      this?.toHour.orEmpty() ?? Constants.empty,
      this?.resultTime.orEmpty() ?? Constants.empty,
      this?.subjectID.orZero() ?? Constants.zero,
      this?.requiredMarkToPass.orZero() ?? Constants.zero,
      this?.studentMark.orZeroDouble() ?? Constants.zeroD,
      this?.isAvaliable ?? false,
      this?.isSolved ?? false,
    );
  }
}

extension ExamMapper on ExamResponse? {
  ExamModel toDomain() {
    return ExamModel(
      this?.details.toDomain(),
      this?.correctArticle.orZero() ?? Constants.zero,
      this?.isSolvedMcqAll.orZero() ?? Constants.zero,
      this?.artSolvedNotCorrected.orZero() ?? Constants.zero,
      this
          ?.groups
          ?.map((group) => group.toDomain())
          .cast<GroupsModel>()
          .toList(),
    );
  }
}

extension SubjectMapper on SubjectResponse? {
  SubjectModel toDomain() {
    return SubjectModel(
      this?.subjectId.orZero() ?? Constants.zero,
      this?.subjectArName.orEmpty() ?? Constants.empty,
      this?.subjectEnName.orEmpty() ?? Constants.empty,
      this?.subjectCode.orEmpty() ?? Constants.empty,
      this?.subjectEndDate.orEmpty() ?? Constants.empty,
      this?.subjectDescription.orEmpty() ?? Constants.empty,
      this?.subjectThumb.orEmpty() ?? Constants.empty,
      this?.matCount.orZeroDouble() ?? Constants.zeroD,
      this?.examCount.orZeroDouble() ?? Constants.zeroD,
      this?.docAttachCount.orZeroDouble() ?? Constants.zeroD,
      this?.stageName.orEmpty() ?? Constants.empty,
      this?.attachPath.orEmpty() ?? Constants.empty,
    );
  }
}

extension ExamStudentMapper on ExamStudentResponse? {
  ExamStudentResultModel toDomain() {
    return ExamStudentResultModel(
      this?.id.orZero() ?? Constants.zero,
      this?.examId.orZero() ?? Constants.zero,
      this?.studentUserId.orZero() ?? Constants.zero,
      this?.examDate.orEmpty() ?? Constants.empty,
      this?.submitDate.orEmpty() ?? Constants.empty,
      this?.state ?? false,
      this?.isSubmitted ?? false,
      this?.examStartTime.orEmpty() ?? Constants.empty,
      this?.examEndTime.orEmpty() ?? Constants.empty,
      this?.examGrade.orZero() ?? Constants.zero,
      this?.studentGrade.orZero() ?? Constants.zero,
    );
  }
}

extension MvMapper on MvResponse? {
  MvModel toDomain() {
    return MvModel(
      this?.examId.orZero() ?? Constants.zero,
      this?.studentId.orZero() ?? Constants.zero,
      this?.examStudent.toDomain(),
      this?.subject.toDomain(),
      this?.timeStart.orEmpty() ?? Constants.empty,
      this?.timeAnswer.orEmpty() ?? Constants.empty,
      this?.examTotalMark.orZero() ?? Constants.zero,
      this?.examStarTime.orEmpty() ?? Constants.empty,
      this?.isAvailable ?? false,
      this?.questionId.orZero() ?? Constants.zero,
    );
  }
}

extension ExamDetailsMapper on ExamDetailsResponse? {
  ExamDetailsModel toDomain() {
    return ExamDetailsModel(
      this?.returnValue.orZero() ?? Constants.zero,
      this?.mv.toDomain(),
      this?.exam.toDomain(),
      this?.teacherName.orEmpty() ?? Constants.empty,
    );
  }
}
