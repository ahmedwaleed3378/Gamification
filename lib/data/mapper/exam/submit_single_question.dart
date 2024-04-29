import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/exam/submit_single_matching_question_res.dart';
import 'package:gamification/data/responses/exam/submit_single_question_response.dart';
import 'package:gamification/domain/model/exam/submit_single_matching_question.dart';
import 'package:gamification/domain/model/exam/submit_single_question_model.dart';
import 'package:gamification/domain/model/exam/submit_single_qvoice_model.dart';

extension SubmitSingleQuestionResponseMapper on SubmitSingleQuestionResponse? {
  SubmitSingleQuestionModel toDomain() {
    return SubmitSingleQuestionModel(
        this?.returnValue.orZero() ?? Constants.zero,
        this?.returnedChoice.orEmpty() ?? Constants.empty);
  }
}


extension SubmitSingleMatchingQuestionResponseMapper on SubmitSingleMatchingQuestionResponse? {
  SubmitSingleMatchingQuestionModel toDomain() {
    return SubmitSingleMatchingQuestionModel(
        this?.returnValue.orZero() ?? Constants.zero,
        (this!.returnedMatchingChoices!.map((mcq) => mcq.orEmpty() ?? Constants.empty)).cast<String>().toList());
  }
}

extension SubmitSingleMatchingQuestionHistoryResponseMapper on SubmitSingleMatchingQuestionHistoryResponse? {
  SubmitSingleMatchingQuestionHistoryModel toDomain() {
    return SubmitSingleMatchingQuestionHistoryModel(
        this?.returnValue.orZero() ?? Constants.zero,
        this?.returnedChoice.orEmpty() ?? Constants.empty,);
  }
}


extension SubmitSingleQVoiceResponseMapper on SubmitSingleQVoiceQuestionResponse? {
  SubmitSingleQVoiceQuestionModel toDomain() {
    return SubmitSingleQVoiceQuestionModel(
      this?.returnValue.orZero() ?? Constants.zero,);
  }
}