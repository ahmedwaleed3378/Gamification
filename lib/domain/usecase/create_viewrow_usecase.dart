import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/request/success_request_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class CreateViewRowUseCase
    implements BaseUseCase<LectureRowRequest, SuccessRequestModel> {
  final Repository _repository;

  CreateViewRowUseCase(this._repository);

  @override
  Future<Either<Failure, SuccessRequestModel>> execute(
    LectureRowRequest lectureRowRequest,
  ) async {
    return await _repository.createViewRow(
      lectureRowRequest.materialId,
      lectureRowRequest.partId,
    );
  }
}
