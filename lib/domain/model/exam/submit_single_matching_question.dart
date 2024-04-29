class SubmitSingleMatchingQuestionModel {
  int returnValue;
  List<String> returnedMatchingChoices;

  SubmitSingleMatchingQuestionModel(
      this.returnValue, this.returnedMatchingChoices);
}

class SubmitSingleMatchingQuestionHistoryModel {
  int returnValue;
  String returnedChoice;

  SubmitSingleMatchingQuestionHistoryModel(
      this.returnValue, this.returnedChoice);
}
