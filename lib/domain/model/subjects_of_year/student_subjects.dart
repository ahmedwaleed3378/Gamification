import '../header_profile_data/header_profile_data.dart';

class StudentSubjectsModel {
  List<SubjectModel?>? subjectEducationalYears;
  List<RecentSubjectsModel>? recentSubjects;
  ProfileDataModel? profileData;
  bool isOpen;
  StudentSubjectsModel({
    this.subjectEducationalYears,
    this.recentSubjects,
    this.profileData,
   required this.isOpen
  });
}

class SubjectModel {
  final int subjectId;
  final int eduYearId;
  final String subjectArName;
  final String eduYearArName;
  final String subjectEnName;
  final String eduYearEnName;
  final String subjectImage;
  SubjectModel({
    required this.subjectId,
    required this.eduYearId,
    required this.subjectArName,
    required this.eduYearArName,
    required this.subjectEnName,
    required this.eduYearEnName,
    required this.subjectImage,
  });
}


class RecentSubjectsModel{
  int subjectId;
  int userExamNotSolvedCount;
  String subjectArName;
  String subjectEnName;
  String subjectImage;
  RecentSubjectsModel(
    this.subjectId,
    this.subjectArName,
    this.subjectEnName,
    this.subjectImage,
    this.userExamNotSolvedCount
  );

}