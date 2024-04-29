import 'package:dartz/dartz.dart';
import 'package:gamification/data/network/failure.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/exam/submit_exam_model.dart';
import 'package:gamification/domain/repository/repository.dart';
import 'package:gamification/domain/usecase/base_usecase.dart';

class SubmitExamCase
    implements BaseUseCase<SubmitExamRequest, SubmitExamModel> {
  final Repository _repository;

  SubmitExamCase(this._repository);

  @override
  Future<Either<Failure, SubmitExamModel>> execute(
      SubmitExamRequest submitExamRequest) async {
    return await _repository.submitExam(submitExamRequest);
  }
}
