// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCourseResponse _$SubCourseResponseFromJson(Map<String, dynamic> json) =>
    SubCourseResponse(
      id: json['id'] as int?,
      eduCompId: json['eduCompId'] as int?,
      subCourseArName: json['subCourse_ar_name'] as String?,
      subCourseEnName: json['subCourse_en_name'] as String?,
      subjectDescription: json['subjectDescription'] as String?,
      subjectPromoVideoPath: json['subjectPromoVideoPath'] as String?,
      diplomaId: json['Diploma_id'] as int?,
      mainCourseArName: json['main_course_ar_name'] as String?,
      mainCourseEnName: json['main_course_en_name'] as String?,
      attachPath: json['attach_path'] as String?,
      isArabic: json['isArabic'] as bool?,
      isEnglish: json['isEnglish'] as bool?,
      isFollow: json['isFollow'] as bool?,
      courseCertificate: json['CourseCertificate'] as bool?,
      subCourseMinutes: json['subCourseMinutes'] as int?,
      courseCategories: (json['course_categories'] as List<dynamic>?)
          ?.map((e) =>
              CourseCategoriesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      department: (json['department'] as List<dynamic>?)
          ?.map((e) =>
              CourseDepartmentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubCourseResponseToJson(SubCourseResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eduCompId': instance.eduCompId,
      'subCourse_ar_name': instance.subCourseArName,
      'subCourse_en_name': instance.subCourseEnName,
      'subjectDescription': instance.subjectDescription,
      'subjectPromoVideoPath': instance.subjectPromoVideoPath,
      'Diploma_id': instance.diplomaId,
      'main_course_ar_name': instance.mainCourseArName,
      'main_course_en_name': instance.mainCourseEnName,
      'attach_path': instance.attachPath,
      'isArabic': instance.isArabic,
      'isEnglish': instance.isEnglish,
      'isFollow': instance.isFollow,
      'CourseCertificate': instance.courseCertificate,
      'subCourseMinutes': instance.subCourseMinutes,
      'course_categories': instance.courseCategories,
      'department': instance.department,
    };

CourseCategoriesResponse _$CourseCategoriesResponseFromJson(
        Map<String, dynamic> json) =>
    CourseCategoriesResponse(
      categoryId: json['category_id'] as int?,
      educationalCategoryId: json['educational_category_id'] as int?,
      categoryArName: json['category_ar_name'] as String?,
      categoryEnName: json['category_en_name'] as String?,
    );

Map<String, dynamic> _$CourseCategoriesResponseToJson(
        CourseCategoriesResponse instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'educational_category_id': instance.educationalCategoryId,
      'category_ar_name': instance.categoryArName,
      'category_en_name': instance.categoryEnName,
    };

CourseDepartmentResponse _$CourseDepartmentResponseFromJson(
        Map<String, dynamic> json) =>
    CourseDepartmentResponse(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
      isActive: json['is_active'] as bool?,
      isMandatory: json['is_mandatory'] as bool?,
      jobTitle: (json['jobTitle'] as List<dynamic>?)
          ?.map(
              (e) => CourseJobTitleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseDepartmentResponseToJson(
        CourseDepartmentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ar_name': instance.arName,
      'en_name': instance.enName,
      'is_active': instance.isActive,
      'is_mandatory': instance.isMandatory,
      'jobTitle': instance.jobTitle,
    };

CourseJobTitleResponse _$CourseJobTitleResponseFromJson(
        Map<String, dynamic> json) =>
    CourseJobTitleResponse(
      id: json['id'] as int?,
      jobTitleCourseId: json['jobTitleCourseId'] as int?,
      depJobId: json['depJobId'] as int?,
      isMandatory: json['is_mandatory'] as bool?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
      isActive: json['is_active'] as bool?,
      fromDate: json['from_date'] as String?,
      toDate: json['to_date'] as String?,
    );

Map<String, dynamic> _$CourseJobTitleResponseToJson(
        CourseJobTitleResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobTitleCourseId': instance.jobTitleCourseId,
      'depJobId': instance.depJobId,
      'is_mandatory': instance.isMandatory,
      'ar_name': instance.arName,
      'en_name': instance.enName,
      'is_active': instance.isActive,
      'from_date': instance.fromDate,
      'to_date': instance.toDate,
    };
