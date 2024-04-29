class HelpSupportModel {
  HelpContentModel? helpContent;
  List<CommonQuestionsContentModel>? commonQuestionsContent;
  String privacyContent;
  String termsContent;

  HelpSupportModel(
    this.helpContent,
    this.commonQuestionsContent,
    this.privacyContent,
    this.termsContent,
  );
}

class HelpContentModel {
  List<String>? companyNumbers;
  List<String>? companyEmails;

  HelpContentModel(
    this.companyNumbers,
    this.companyEmails,
  );
}

class CommonQuestionsContentModel {
  String question;
  String answer;

  CommonQuestionsContentModel(
    this.question,
    this.answer,
  );
}
