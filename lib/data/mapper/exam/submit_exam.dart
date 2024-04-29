import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/exam/submit_exam_response.dart';
import 'package:gamification/domain/model/exam/submit_exam_model.dart';

extension SubmitExamResponseMapper on SubmitExamResponse? {
  SubmitExamModel toDomain() {
    return SubmitExamModel(
      this?.message.orEmpty() ?? Constants.empty,
      this?.result ?? Constants.zeroD,
      this?.totalMark ?? Constants.zeroD,
      this?.url.orEmpty() ?? Constants.empty,
      this?.repeatable ?? false,
      this?.repeatableExamCount.orZero() ?? Constants.zero,
      this?.returnValue.orZero() ?? Constants.zero,
      this?.returnString.orEmpty() ?? Constants.empty,
    );
  }
}
