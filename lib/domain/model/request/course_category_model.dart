class CourseCategoryModel {
  int returnValue;
  List<CourseCategoryListModel>? courseCategoryList;

  CourseCategoryModel(
    this.returnValue,
    this.courseCategoryList,
  );
}

class CourseCategoryListModel {
  int id;
  String arName;
  String enName;

  CourseCategoryListModel(
    this.id,
    this.arName,
    this.enName,
  );
}
