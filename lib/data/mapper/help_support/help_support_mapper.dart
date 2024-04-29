import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/help_support/help_support_response.dart';
import 'package:gamification/domain/model/help_support/help_support_model.dart';

extension CommonQuestionsContentMapper on CommonQuestionsContentResponse? {
  CommonQuestionsContentModel toDomain() {
    return CommonQuestionsContentModel(
      this?.question.orEmpty() ?? Constants.empty,
      this?.answer.orEmpty() ?? Constants.empty,
    );
  }
}

extension HelpContentMapper on HelpContentResponse? {
  HelpContentModel toDomain() {
    return HelpContentModel(
      this?.companyEmails?.map((email) => email).cast<String>().toList(),
      this?.companyNumbers?.map((number) => number).cast<String>().toList(),
    );
  }
}

extension HelpSupportMapper on HelpSupportResponse? {
  HelpSupportModel toDomain() {
    return HelpSupportModel(
      this!.helpContent.toDomain(),
      this
          ?.commonQuestionsContent
          ?.map((question) => question.toDomain())
          .cast<CommonQuestionsContentModel>()
          .toList(),
      this?.privacyContent.orEmpty() ?? Constants.empty,
      this?.termsContent.orEmpty() ?? Constants.empty,
    );
  }
}
