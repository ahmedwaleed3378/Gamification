import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/request/request_learning_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class CourseRequestUseCase implements BaseUseCase<int, RequestLearningModel> {
  final Repository _repository;

  CourseRequestUseCase(this._repository);

  @override
  Future<Either<Failure, RequestLearningModel>> execute(int pageID) {
    return _repository.getAllCourseRequests(pageID);
  }
}