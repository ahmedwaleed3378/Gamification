class CoursesModel {
  List<CourseContentModel>? basicCoursesList;
  List<CourseContentModel>? recommendedCoursesList;

  CoursesModel(
    this.basicCoursesList,
    this.recommendedCoursesList,
  );
}

class CourseContentModel {
  int subjectId;
  String subjectArName;
  String subjectEnName;
  String subjectDescreption;
  String subjectPromoLink;
  bool courseCertificate;
  int courseMinutes;
  bool isArabic;
  bool isEnglish;
  int diplomaId;
  String diplomaArName;
  String diplomaEnName;
  int eduCompId;
  String attachPath;
  List<String>? whatYouLearn;
  int exams;
  int files;
  String teacherArName;
  int subjectUserNumbers;
  bool isCurrent;
  bool isBasic;

  CourseContentModel(
    this.subjectId,
    this.subjectArName,
    this.subjectEnName,
    this.subjectDescreption,
    this.subjectPromoLink,
    this.courseCertificate,
    this.courseMinutes,
    this.isArabic,
    this.isEnglish,
    this.diplomaId,
    this.diplomaArName,
    this.diplomaEnName,
    this.eduCompId,
    this.attachPath,
    this.whatYouLearn,
    this.exams,
    this.files,
    this.teacherArName,
    this.subjectUserNumbers,
    this.isCurrent,
    this.isBasic,
  );
}
