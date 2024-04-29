import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/request/category_subcourse_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class CategorySubCourseUsecase
    implements BaseUseCase<int, List<CategorySubCourseModel>> {
  final Repository _repository;

  CategorySubCourseUsecase(this._repository);

  @override
  Future<Either<Failure, List<CategorySubCourseModel>>> execute(
      int categoryId) {
    return _repository.getSubCourseByCategoryId(categoryId);
  }
}
