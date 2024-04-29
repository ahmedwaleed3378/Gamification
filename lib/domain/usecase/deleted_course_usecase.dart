import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/domain/model/request/success_request_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class DeletedCourseUseCase implements BaseUseCase<int, SuccessRequestModel> {
  final Repository _repository;

  DeletedCourseUseCase(this._repository);

  @override
  Future<Either<Failure, SuccessRequestModel>> execute(int requestId) {
    return _repository.deleteCourseRequest(requestId);
  }
}
