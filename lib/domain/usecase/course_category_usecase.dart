import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/request/course_category_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class CourseCategoryUsecase implements BaseUseCase<void, CourseCategoryModel> {
  final Repository _repository;

  CourseCategoryUsecase(this._repository);

  @override
  Future<Either<Failure, CourseCategoryModel>> execute(void input) {
    return _repository.getAllRequestCategories();
  }
}
