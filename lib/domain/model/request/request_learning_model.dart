class RequestLearningModel {
  int countItems;
  List<RequestLearningItemsModel>? requests;

  RequestLearningModel(
    this.countItems,
    this.requests,
  );
}

class RequestLearningItemsModel {
  int id;
  String courseArName;
  String courseEnName;
  bool status;
  int numberOfDays;
  String reasonOfRequest;

  RequestLearningItemsModel(
    this.id,
    this.courseArName,
    this.courseEnName,
    this.status,
    this.numberOfDays,
    this.reasonOfRequest,
  );
}
