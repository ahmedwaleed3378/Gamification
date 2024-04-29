import 'package:gamification/app/constants.dart';
import 'package:gamification/app/extension.dart';
import 'package:gamification/data/responses/sub_course/sub_course_response.dart';
import 'package:gamification/domain/model/sub_course/sub_course_model.dart';

extension CourseJobTitleMapper on CourseJobTitleResponse? {
  CourseJobTitleModel toDomain() {
    return CourseJobTitleModel(
      this?.id.orZero() ?? Constants.zero,
      this?.jobTitleCourseId.orZero() ?? Constants.zero,
      this?.depJobId.orZero() ?? Constants.zero,
      this?.isMandatory ?? false,
      this?.arName.orEmpty() ?? Constants.empty,
      this?.enName.orEmpty() ?? Constants.empty,
      this?.isActive ?? false,
      this?.fromDate.orEmpty() ?? Constants.empty,
      this?.toDate.orEmpty() ?? Constants.empty,
    );
  }
}

extension CourseDepartmentMapper on CourseDepartmentResponse? {
  CourseDepartmentModel toDomain() {
    return CourseDepartmentModel(
      this?.id.orZero() ?? Constants.zero,
      this?.arName.orEmpty() ?? Constants.empty,
      this?.enName.orEmpty() ?? Constants.empty,
      this?.isActive ?? false,
      this?.isMandatory ?? false,
      this
          ?.jobTitle
          ?.map((model) => model.toDomain())
          .cast<CourseJobTitleModel>()
          .toList(),
    );
  }
}

extension CourseCategoriesMapper on CourseCategoriesResponse? {
  CourseCategoriesModel toDomain() {
    return CourseCategoriesModel(
      this?.categoryId.orZero() ?? Constants.zero,
      this?.educationalCategoryId.orZero() ?? Constants.zero,
      this?.categoryArName.orEmpty() ?? Constants.empty,
      this?.categoryEnName.orEmpty() ?? Constants.empty,
    );
  }
}

extension UnitDataMapper on SubCourseResponse? {
  SubCourseModel toDomain() {
    return SubCourseModel(
      this?.id.orZero() ?? Constants.zero,
      this?.eduCompId.orZero() ?? Constants.zero,
      this?.subCourseArName.orEmpty() ?? Constants.empty,
      this?.subCourseEnName.orEmpty() ?? Constants.empty,
      this?.subjectDescription.orEmpty() ?? Constants.empty,
      this?.subjectPromoVideoPath.orEmpty() ?? Constants.empty,
      this?.diplomaId.orZero() ?? Constants.zero,
      this?.mainCourseArName.orEmpty() ?? Constants.empty,
      this?.mainCourseEnName.orEmpty() ?? Constants.empty,
      this?.attachPath.orEmpty() ?? Constants.empty,
      this?.isArabic ?? false,
      this?.isEnglish ?? false,
      this?.isFollow ?? false,
      this?.courseCertificate ?? false,
      this?.subCourseMinutes.orZero() ?? Constants.zero,
      this
          ?.courseCategories
          ?.map((model) => model.toDomain())
          .cast<CourseCategoriesModel>()
          .toList(),
      this
          ?.department
          ?.map((model) => model.toDomain())
          .cast<CourseDepartmentModel>()
          .toList(),
    );
  }
}
