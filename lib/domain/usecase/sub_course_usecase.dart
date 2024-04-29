import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/sub_course/sub_course_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class SubCourseUseCase implements BaseUseCase<int, SubCourseModel> {
  final Repository _repository;

  SubCourseUseCase(this._repository);

  @override
  Future<Either<Failure, SubCourseModel>> execute(int courseId) {
    return _repository.getSubCourseById(courseId);
  }
}
