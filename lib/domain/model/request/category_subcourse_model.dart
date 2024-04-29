class CategorySubCourseModel {
  int id;
  String courseArName;
  String courseEnName;
  bool approve;
  bool hasRequestBefore;
  String attachFile;
  int courseTime;

  CategorySubCourseModel(
    this.id,
    this.courseArName,
    this.courseEnName,
    this.approve,
    this.hasRequestBefore,
    this.attachFile,
    this.courseTime,
  );
}
