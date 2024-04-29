class RequestTeachingModel {
  int countItems;
  List<RequestTeachingItemsModel>? requests;

  RequestTeachingModel(
    this.countItems,
    this.requests,
  );
}

class RequestTeachingItemsModel {
  int id;
  String employeeName;
  String courseArName;
  String courseEnName;
  bool status;
  int numberOfDays;
  String details;

  RequestTeachingItemsModel(
    this.id,
    this.employeeName,
    this.courseArName,
    this.courseEnName,
    this.status,
    this.numberOfDays,
    this.details,
  );
}
