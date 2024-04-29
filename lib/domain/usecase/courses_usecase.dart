import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/courses/courses_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class CoursesUseCase implements BaseUseCase<void, CoursesModel> {
  final Repository _repository;

  CoursesUseCase(this._repository);

  @override
  Future<Either<Failure, CoursesModel>> execute(void input) {
    return _repository.getBasicRecommendedCourses();
  }
}