import 'package:gamification/app/constants.dart';

import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/question/single_question_response.dart';
import 'package:gamification/domain/model/question/single_question_model.dart';

extension SingleQuestionMapper on SingleQuestionResponse? {
  SingleQuestionModel toDomain() {
    return SingleQuestionModel(
      this?.returnValue.orZero() ?? Constants.zero,
      this?.returnedChoice!.map((e) => e.orEmpty()).cast<String>().toList(),
    );
  }
}
