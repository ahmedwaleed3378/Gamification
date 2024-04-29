class SubCourseModel {
  int id;
  int eduCompId;
  String subCourseArName;
  String subCourseEnName;
  String subjectDescription;
  String subjectPromoVideoPath;
  int diplomaId;
  String mainCourseArName;
  String mainCourseEnName;
  String attachPath;
  bool isArabic;
  bool isEnglish;
  bool isFollow;
  bool courseCertificate;
  int subCourseMinutes;
  List<CourseCategoriesModel>? courseCategories;
  List<CourseDepartmentModel>? department;

  SubCourseModel(
    this.id,
    this.eduCompId,
    this.subCourseArName,
    this.subCourseEnName,
    this.subjectDescription,
    this.subjectPromoVideoPath,
    this.diplomaId,
    this.mainCourseArName,
    this.mainCourseEnName,
    this.attachPath,
    this.isArabic,
    this.isEnglish,
    this.isFollow,
    this.courseCertificate,
    this.subCourseMinutes,
    this.courseCategories,
    this.department,
  );
}

class CourseCategoriesModel {
  int categoryId;
  int educationalCategoryId;
  String categoryArName;
  String categoryEnName;

  CourseCategoriesModel(
    this.categoryId,
    this.educationalCategoryId,
    this.categoryArName,
    this.categoryEnName,
  );
}

class CourseDepartmentModel {
  int id;
  String arName;
  String enName;
  bool isActive;
  bool isMandatory;
  List<CourseJobTitleModel>? jobTitle;

  CourseDepartmentModel(
    this.id,
    this.arName,
    this.enName,
    this.isActive,
    this.isMandatory,
    this.jobTitle,
  );
}

class CourseJobTitleModel {
  int id;
  int jobTitleCourseId;
  int depJobId;
  bool isMandatory;
  String arName;
  String enName;
  bool isActive;
  String fromDate;
  String toDate;

  CourseJobTitleModel(
    this.id,
    this.jobTitleCourseId,
    this.depJobId,
    this.isMandatory,
    this.arName,
    this.enName,
    this.isActive,
    this.fromDate,
    this.toDate,
  );
}
