import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/request/request_teaching_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class RequestTeachingUseCase implements BaseUseCase<int, RequestTeachingModel> {
  final Repository _repository;

  RequestTeachingUseCase(this._repository);

  @override
  Future<Either<Failure, RequestTeachingModel>> execute(int pageId) {
    return _repository.getAllTeachingCourseRequests(pageId);
  }
}