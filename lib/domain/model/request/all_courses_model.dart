class AllCoursesRequestModel {
  int returnValue;
  List<CoursesRequestItemsModel>? courses;

  AllCoursesRequestModel(
    this.returnValue,
    this.courses,
  );
}

class CoursesRequestItemsModel {
  int id;
  String courseArName;
  String courseEnName;

  CoursesRequestItemsModel(
    this.id,
    this.courseArName,
    this.courseEnName,
  );
}
