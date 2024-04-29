class StudentRankModel {
  final List<StudentModel?> top3Students;
  final List<StudentModel?> mylogginStudentShortList;
  final List<StudentModel?> studentsRankList;
  final int? resetDays;
  final int? resetHours;
  final int? resetMinutes;
  final int? resetSeconds;

  List<String>? instructions;
  StudentRankModel({
    required this.top3Students,
    required this.mylogginStudentShortList,
    required this.studentsRankList,
    required this.resetDays,
    required this.resetHours,
    required this.resetMinutes,
    required this.resetSeconds,
    required this.instructions,
  });
}

class StudentModel {
  final int userId;
  final double totalPoints;
  final String arName;
  final String userProfile;
  final int userRank;
  StudentModel({
    required this.userId,
    required this.totalPoints,
    required this.arName,
    required this.userProfile,
    required this.userRank,
  });
}
