import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/request/all_courses_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class AllCoursesRequestUseCase
    implements BaseUseCase<void, AllCoursesRequestModel> {
  final Repository _repository;

  AllCoursesRequestUseCase(this._repository);

  @override
  Future<Either<Failure, AllCoursesRequestModel>> execute(void input) {
    return _repository.getAllCoursesRequest();
  }
}
