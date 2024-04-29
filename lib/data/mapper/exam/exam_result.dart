import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/mapper/exam/exam_details_mapper.dart';
import 'package:gamification/data/responses/exam/exam_result_response.dart';
import 'package:gamification/domain/model/exam/exam_details_model.dart';
import 'package:gamification/domain/model/exam/exam_result_model.dart';

extension ExamResultResponseMapper on ExamResultResponse? {
  ExamResultModel toDomain() {
    return ExamResultModel(
      this?.ex.toDomain(),
      this?.item.toDomain(),
      this?.teacherName.orEmpty() ?? Constants.empty,
      this?.subjectName.orEmpty() ?? Constants.empty,
    );
  }
}

extension ExamStudentResponseMapper on ExamStudentResponse? {
  ExamStudentModel toDomain() {
    return ExamStudentModel(
      this?.id.orZero() ?? Constants.zero,
      this?.examId.orZero() ?? Constants.zero,
      this?.examDate.orEmpty() ?? Constants.empty,
      this?.submitDate.orEmpty() ?? Constants.empty,
      this?.examAmount ?? Constants.zeroD,
      this?.state ?? false,
      this?.isSubmitted ?? false,
      this?.correctComplete.orZero() ?? Constants.zero,
      this?.examStartTime.orEmpty() ?? Constants.empty,
      this?.examEndTime.orEmpty() ?? Constants.empty,
      this?.examGrade ?? Constants.zeroD,
      this?.studentGrade ?? Constants.zeroD,
    );
  }
}

extension ExResponseMapper on ExResponse? {
  ExModel toDomain() {
    return ExModel(
      this?.pointsGained ?? Constants.zeroD,
      this?.userExamPoint ?? Constants.zeroD,
      this?.userExamExperince ?? Constants.zeroD,
      this?.showExamFinishMessage ?? false,
      this?.showExamContent ?? false,
      this?.showResult ?? false,
      this?.totalMark.orZero() ?? Constants.zero,
      this?.questionCount.orZero() ?? Constants.zero,
      this?.examResult ?? Constants.zeroD,
      this?.examRate.orZero() ?? Constants.zero,
      this?.examStudent.toDomain(),
      this?.examRequiresTeacherInput ?? false,
      this?.isResultAvailable ?? false,
      this?.solvedExamStudentID.orZero() ?? Constants.zero,
      this?.repeatable ?? false,
      this?.repeatableExamCount.orZero() ?? Constants.zero,
    );
  }
}

extension ItemResponseMapper on ItemResponse? {
  ItemModel toDomain() {
    return ItemModel(
      this?.details.toDomain(),
      (this!.groups!.map((group) => group.toDomain()))
          .cast<GroupsModel>()
          .toList(),
    );
  }
}

extension DetailsResponseMapper on DetailsResultResponse? {
  DetailsResultModel toDomain() {
    return DetailsResultModel(
      this?.id.orZero() ?? Constants.zero,
      this?.examPeriodMinute.orZero() ?? Constants.zero,
      this?.examArName.orEmpty() ?? Constants.empty,
      this?.examEnName.orEmpty() ?? Constants.empty,
      this?.studentMark ?? Constants.zeroD,
      this?.isAvailable ?? false,
    );
  }
}

extension GroupsResultResponse on GroupsResult? {
  GroupsModel toDomain() {
    return GroupsModel(
      this?.groupId.orZero() ?? Constants.zero,
      this?.groupName.orEmpty() ?? Constants.empty,
      (this!.heads!.map((group) => group.toDomain()))
          .cast<HeadsModel>()
          .toList(),
    );
  }
}

extension HeadsResultResponseMapper on HeadsResultResponse? {
  HeadsModel toDomain() {
    return HeadsModel(
      this?.groupId.orZero() ?? Constants.zero,
      this?.headId.orZero() ?? Constants.zero,
      this?.headName.orEmpty() ?? Constants.empty,
      (this!.questions!.map((group) => group.toDomain()))
          .cast<QuestionsModel>()
          .toList(),
    );
  }
}

extension QuestionsResultResponseMapper on QuestionsResultResponse? {
  QuestionsModel toDomain() {
    return QuestionsModel(
        this?.headId.orZero() ?? Constants.zero,
        this?.id.orZero() ?? Constants.zero,
        null,
        this?.questionDetails.toDomain(),
        this?.mcq?.map((mcq) => mcq.toDomain()).cast<McqModel>().toList(),
        this?.complete.toDomain(),
        this?.qContainer.toDomain(),
        this?.matchingQuestion.toDomain(),
        this?.qVoice.toDomain(),
        this?.qTranslate.toDomain());
  }
}

extension QuestionDetailsResultResponseMapper
    on QuestionDetailsResultResponse? {
  QuestionDetailsResultModel toDomain() {
    return QuestionDetailsResultModel(
        this?.questionId.orZero() ?? Constants.zero,
        this?.questionText.orEmpty() ?? Constants.empty,
        this?.questionAttach.orEmpty() ?? Constants.empty,
        this?.questionType.orEmpty() ?? Constants.empty,
        this?.questionMark.orZeroDouble() ?? Constants.zeroD,
        this?.questionTypeId.orZero() ?? Constants.zero,
        this?.studentChoice.toDomain(),
        (this!.studentCompleteChoice!.map((group) => group.toDomain()))
            .cast<StudentCompleteChoiceResultModel>()
            .toList(),
        (this!.studentCompleteContainerChoice!.map((group) => group.toDomain()))
            .cast<StudentCompleteContainerChoiceResultModel>()
            .toList(),
        (this!.studentMatchingChoice!.map((group) => group.toDomain()))
            .cast<StudentMatchingChoiceResultModel>()
            .toList(),
        this?.studentVoiceChoice.toDomain(),
        this?.studentTranslateChoice.toDomain());
  }
}

extension StudentChoiceResultResponseMapper on StudentChoiceResultResponse? {
  StudentChoiceResultModel toDomain() {
    return StudentChoiceResultModel(
      this?.id.orZero() ?? Constants.zero,
      this?.examId.orZero() ?? Constants.zero,
      this?.studentUserId.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.studentChoiceId.orZero() ?? Constants.zero,
      this?.questionFinalMark.orZeroDouble() ?? Constants.zeroD,
      this?.result.orEmpty() ?? Constants.empty,
    );
  }
}

extension StudentCompleteChoiceResultResponseMappper
    on StudentCompleteChoiceResultResponse? {
  StudentCompleteChoiceResultModel toDomain() {
    return StudentCompleteChoiceResultModel(
      this?.id.orZero() ?? Constants.zero,
      this?.examId.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.questionSentenceId.orZero() ?? Constants.zero,
      this?.questionAnswerId.orZero() ?? Constants.zero,
      this?.examStudentQuestionId.orZero() ?? Constants.zero,
      this?.studentUserId.orZero() ?? Constants.zero,
      this?.mark.orZero() ?? Constants.zero,
      this?.result ?? false,
    );
  }
}

extension StudentCompleteContainerChoiceResultResponseMapper
    on StudentCompleteContainerChoiceResultResponse? {
  StudentCompleteContainerChoiceResultModel toDomain() {
    return StudentCompleteContainerChoiceResultModel(
      this?.id.orZero() ?? Constants.zero,
      this?.examId.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.questionSentenceId.orZero() ?? Constants.zero,
      this?.questionAnswerId.orZero() ?? Constants.zero,
      this?.examStudentQuestionId.orZero() ?? Constants.zero,
      this?.studentUserId.orZero() ?? Constants.zero,
      this?.mark.orZero() ?? Constants.zero,
      this?.result ?? false,
    );
  }
}

extension StudentMatchingChoiceResultResponseMapper
    on StudentMatchingChoiceResultResponse? {
  StudentMatchingChoiceResultModel toDomain() {
    return StudentMatchingChoiceResultModel(
      this?.id.orZero() ?? Constants.zero,
      this?.examId.orZero() ?? Constants.zero,
      this?.studentUserId.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.questionDetRightSideId.orZero() ?? Constants.zero,
      this?.questionDetLeftSideId.orZero() ?? Constants.zero,
      this?.examStudentQuestionId.orZero() ?? Constants.zero,
      this?.result ?? false,
      this?.mark.orZero() ?? Constants.zero,
    );
  }
}

extension StudentVoiceChoiceResultResponseMapper
    on StudentVoiceChoiceResultResponse? {
  StudentVoiceChoiceResultModel toDomain() {
    return StudentVoiceChoiceResultModel(
      this?.id.orZero() ?? Constants.zero,
      this?.studentUserId.orZero() ?? Constants.zero,
      this?.examId.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.voiceQuestionAnswerId.orZero() ?? Constants.zero,
      this?.examStudentQuestionId.orZero() ?? Constants.zero,
      this?.voiceQuestionAnswer.orEmpty() ?? Constants.empty,
      this?.result ?? false,
      this?.mark.orZero() ?? Constants.zero,
    );
  }
}

extension StudentTranslateChoiceResultResponseMapper
    on StudentTranslateChoiceResultResponse? {
  StudentTranslateChoiceResultModel toDomain() {
    return StudentTranslateChoiceResultModel(
      this?.id.orZero() ?? Constants.zero,
      this?.examId.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.examStudentQuestionId.orZero() ?? Constants.zero,
      this?.translateQuestionId.orZero() ?? Constants.zero,
      this?.studentUserId.orZero() ?? Constants.zero,
      this?.translateAnswerText.orEmpty() ?? Constants.empty,
      this?.mark.orZero() ?? Constants.zero,
      this?.result.orEmpty() ?? Constants.empty,
    );
  }
}

extension McqMapper on McqResultResponse? {
  McqResultModel toDomain() {
    return McqResultModel(
      this?.id.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.mcqText.orEmpty() ?? Constants.empty,
      this?.mcqAttach.orEmpty() ?? Constants.empty,
      this?.isCorrect ?? false,
    );
  }
}

extension QCompleteMapper on QCompleteResultResponse? {
  QCompleteResultModel toDomain() {
    return QCompleteResultModel(
      this
          ?.questionSequence
          ?.map((e) => e.toDomain())
          .cast<QCompleteSequenceResultModel>()
          .toList(),
      this
          ?.questionAnswer
          ?.map((e) => e.toDomain())
          .cast<QCompleteAnswerResultModel>()
          .toList(),
    );
  }
}

extension QCompleteSequenceMapper on QCompleteSequenceResultResponse? {
  QCompleteSequenceResultModel toDomain() {
    return QCompleteSequenceResultModel(
      this?.questionSentenceId.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.firstSentence.orEmpty() ?? Constants.empty,
      this?.secondSentence.orEmpty() ?? Constants.empty,
      this?.mark.orZero() ?? Constants.zero,
    );
  }
}

extension QCompleteAnswerMapper on QCompleteAnswerResultResponse? {
  QCompleteAnswerResultModel toDomain() {
    return QCompleteAnswerResultModel(
      this?.questionAnswerId.orZero() ?? Constants.zero,
      this?.answer.orEmpty() ?? Constants.empty,
    );
  }
}

extension QContainerResultResponseMapper on QContainerResultResponse? {
  QContainerResultModel toDomain() {
    return QContainerResultModel(
      this
          ?.questionSequence
          ?.map((e) => e.toDomain())
          .cast<QContainerQuestionSequenceResultModel>()
          .toList(),
      this
          ?.questionAnswer
          ?.map((e) => e.toDomain())
          .cast<QContainerAnswerResultModel>()
          .toList(),
    );
  }
}

extension QContainerQuestionSequenceResultResponseMapper
    on QContainerQuestionSequenceResultResponse? {
  QContainerQuestionSequenceResultModel toDomain() {
    return QContainerQuestionSequenceResultModel(
      this?.questionSentenceId.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.sentence.orEmpty() ?? Constants.empty,
      this?.mark.orZero() ?? Constants.zero,
    );
  }
}

extension QContainerAnswerResultResponseMapper
    on QContainerAnswerResultResponse? {
  QContainerAnswerResultModel toDomain() {
    return QContainerAnswerResultModel(
      this?.questionAnswerId.orZero() ?? Constants.zero,
      this?.answer.orEmpty() ?? Constants.empty,
    );
  }
}

extension MatchingQuestionResultResponseMapper
    on MatchingQuestionResultResponse? {
  MatchingQuestionResultModel toDomain() {
    return MatchingQuestionResultModel(
      this
          ?.rightSideMatching
          ?.map((e) => e.toDomain())
          .cast<RightSideMatchingResultModel>()
          .toList(),
      this
          ?.leftSideMatching
          ?.map((e) => e.toDomain())
          .cast<LeftSideMatchingResultModel>()
          .toList(),
    );
  }
}

extension RightSideMatchingMapper on RightSideMatchingResultResponse? {
  RightSideMatchingResultModel toDomain() {
    return RightSideMatchingResultModel(
      this?.id.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.rightSideText.orEmpty() ?? Constants.empty,
      this?.mark.orZero() ?? Constants.zero,
    );
  }
}

extension LeftSideMatchingMapper on LeftSideMatchingResultResponse? {
  LeftSideMatchingResultModel toDomain() {
    return LeftSideMatchingResultModel(
      this?.id.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.leftSideText.orEmpty() ?? Constants.empty,
    );
  }
}

extension QVoiceMapper on QVoiceResultResponse? {
  QVoiceResultModel toDomain() {
    return QVoiceResultModel(
      this
          ?.questionAudio
          ?.map((e) => e.toDomain())
          .cast<QVoiceQuestionAudioResultModel>()
          .toList(),
      this
          ?.questionAnswer
          ?.map((e) => e.toDomain())
          .cast<QVoiceQuestionAnswerResultModel>()
          .toList(),
    );
  }
}

extension QVoiceQuestionAudioMapper on QVoiceQuestionAudioResultResponse? {
  QVoiceQuestionAudioResultModel toDomain() {
    return QVoiceQuestionAudioResultModel(
      this?.id.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.voiceQuestion.orEmpty() ?? Constants.empty,
      this?.imageQuestion.orEmpty() ?? Constants.empty,
      this?.mark.orZero() ?? Constants.zero,
    );
  }
}

extension QVoiceQuestionAnswerMapper on QVoiceQuestionAnswerResultResponse? {
  QVoiceQuestionAnswerResultModel toDomain() {
    return QVoiceQuestionAnswerResultModel(
      this?.id.orZero() ?? Constants.zero,
      this?.answer?.map((answer) => answer).cast<String>().toList(),
    );
  }
}

extension QTranslateMapper on QTranslateResultResponse? {
  QTranslateResultModel toDomain() {
    return QTranslateResultModel(
        this
            ?.questionTranslate
            ?.map((e) => e.toDomain())
            .cast<QuestionTranslateResultModel>()
            .toList(),
        this?.questionTranslateAnswer?.toDomain());
  }
}

extension QuestionTranslateMapper on QuestionTranslateResultResponse? {
  QuestionTranslateResultModel toDomain() {
    return QuestionTranslateResultModel(
      this?.id.orZero() ?? Constants.zero,
      this?.questionId.orZero() ?? Constants.zero,
      this?.questionVoice.orEmpty() ?? Constants.empty,
      this?.questionText.orEmpty() ?? Constants.empty,
      this?.mark.orZero() ?? Constants.zero,
    );
  }
}
