import 'package:gamification/app/constants.dart';

import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/question/single_question_history_response.dart';
import 'package:gamification/domain/model/question/single_question_history_model.dart';

extension SingleQuestionHistoryMapper on SingleQuestionHistoryResponse? {
  SingleQuestionHistoryModel toDomain() {
    return SingleQuestionHistoryModel(
      this?.returnValue.orZero() ?? Constants.zero,
      this?.returnedChoice.orEmpty() ?? Constants.empty,
    );
  }
}
